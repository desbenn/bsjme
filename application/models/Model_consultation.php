<?php

class Model_consultation extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	//--> Get the data
	public function getConsultationData($id = null)
	{
		if($id) {
			$sql = "SELECT consultation.*,address,client_name,company_name,director_name,trn,
			    district,email,mobile,phone,postal_code,website,directory,
				parish.name AS 'parish_name',phase.name AS 'phase_name',
				county.name AS 'county_name',program.name AS 'program_name',					 
				(SELECT name FROM user WHERE client.updated_by = user.id) AS 'updated_by'   
			FROM consultation
				JOIN client ON consultation.client_id = client.id
				LEFT JOIN program ON consultation.program_id = program.id
				LEFT JOIN phase ON consultation.phase_id = phase.id
				LEFT JOIN parish ON client.parish_id = parish.id
				LEFT JOIN county ON client.county_id = county.id
				LEFT JOIN city ON client.city_id = city.id

			WHERE consultation.id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT consultation.*,address,client_name,company_name,director_name,trn,
			    district,email,mobile,phone,postal_code,website,directory,
				parish.name AS 'parish_name',program.name AS 'program_name',
				county.name AS 'county_name',phase.name AS 'phase_name',						 
				(SELECT name FROM user WHERE client.updated_by = user.id) AS 'updated_by'   
			FROM consultation
				JOIN client ON consultation.client_id = client.id
				LEFT JOIN program ON consultation.program_id = program.id
				LEFT JOIN phase ON consultation.phase_id = phase.id
				LEFT JOIN parish ON client.parish_id = parish.id
				LEFT JOIN county ON client.county_id = county.id
				LEFT JOIN city ON client.city_id = city.id
			ORDER BY consultation.id DESC";
		$query = $this->db->query($sql);
		return $query->result_array();
	}



	//--> Get the data for a specific consultant or for all

	public function getConsultationByConsultant($consultant)
	{

        if ($consultant == 'all') {
        	$sql = "SELECT consultation.*,consultation.id AS 'id',company_name,
							user.name AS 'consultant_name',sector.name AS 'sector_name'
			FROM consultation
			        LEFT JOIN client ON consultation.client_id = client.id
					LEFT JOIN user ON consultation.consultant_id = user.id
					LEFT JOIN sector ON consultation.sector_id = sector.id
			ORDER by company_name";
        } else {
        	$sql = "SELECT consultation.*,consultation.id AS 'id',company_name,
							user.name AS 'consultant_name',sector.name AS 'sector_name'
			FROM consultation
			        LEFT JOIN client ON consultation.client_id = client.id
					LEFT JOIN user ON consultation.consultant_id = user.id
					LEFT JOIN sector ON consultation.sector_id = sector.id
		    WHERE consultation.consultant_id LIKE '%$consultant%'
			ORDER by company_name";
        }
		
		$query = $this->db->query($sql);
		return $query->result_array();
	}



	//--> Get the data for a specific client

	public function getConsultationByClient($trn)
	{

		$sql = "SELECT consultation.*,consultation.id AS 'id',company_name,
						user.name AS 'consultant_name',sector.name AS 'sector_name'
		FROM consultation
		        LEFT JOIN client ON consultation.client_id = client.id
				LEFT JOIN user ON consultation.consultant_id = user.id
				LEFT JOIN sector ON consultation.sector_id = sector.id
		WHERE client.trn = $trn		
		ORDER by company_name";
		
		$query = $this->db->query($sql);
		return $query->result_array();
	}


	public function getActiveConsultationData()
	{
		$sql = "SELECT * FROM consultation WHERE status_id = ? ORDER BY id DESC";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}

	public function create($data)
	{
		//---> The id is returned to the controller so that the update form
		//     of consultation can be opened to continue encoding the datas
		if($data) {
			$insert = $this->db->insert('consultation', $data);
			$insert_id = $this->db->insert_id();
			return ($insert == true) ? $insert_id : false;
		}
	}

	public function update($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('consultation', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		//--> All the information attached to the client must be deleted

		if($id) {

			// Remove the tables attached to consultation
			// THe document should be removed manually by the user before deleting the consultation

		    // Remove the answer related to the consultation before deleting the consultation
		    $this->db->where('consultation_id', $id);
			$delete = $this->db->delete('answer');	
			
			// delete the consultation
			$this->db->where('id', $id);
			$delete = $this->db->delete('consultation');
		    return ($delete == true) ? true : false;

		}
	}

	public function countTotalConsultation($year)
	{
		$sql = "SELECT * FROM consultation
		WHERE ? = year(date_creation)";
		$query = $this->db->query($sql, array($year));
		return $query->num_rows();
	}

	public function countTotalConsultationByParish($year,$parish_code)
	{

		$sql = "SELECT * 
		FROM consultation
			LEFT JOIN client ON consultation.client_id = client.id
			LEFT JOIN parish ON client.parish_id = parish.id
		WHERE parish.code = $parish_code
		      AND $year = year(date_creation)";
		$query = $this->db->query($sql, array());
		return $query->num_rows();

	}

	public function createDocument($data)
	{
		if($data) {
			$insert = $this->db->insert('document', $data);
			$insert_id = $this->db->insert_id();
			return ($insert == true) ? $insert_id : false;
		}
	}

	public function removeDocument($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('document');
			return ($delete == true) ? true : false;
		}
	}

	public function getDocument($id = null)
	{
		$sql = "SELECT document.*,directory
		FROM document
		     JOIN client ON document.client_id = client.id
		WHERE document.id = ?";
		$query = $this->db->query($sql, array($id));
		return $query->row_array();

	}

	public function getConsultationClient($id = null)
	{
		$sql = "SELECT * FROM consultation WHERE client_id = ?";
		$query = $this->db->query($sql, array($id));
		return $query->result_array();

	}

	public function getConsultationDocument($consultation_id)
	{

		//only document type related to consultation (2=consultation 3=client 4=activity 5=environment)

		$sql = "SELECT document.*,directory,document_type.name AS 'document_type_name',
		               document_class.name AS 'document_class_name'
		FROM document
			LEFT JOIN document_type ON document.document_type_id = document_type.id
			LEFT JOIN document_class ON document.document_class_id = document_class.id
			JOIN client ON document.client_id = client.id
		WHERE consultation_id = ?";
		$query = $this->db->query($sql, array($consultation_id));
		return $query->result_array();
	}

	public function getConsultationQuestion($program_id,$phase)
	{
		$sql="SELECT question.*, question FROM question WHERE `program_id`=$program_id AND `phase_id`=$phase";
		$query = $this->db->query($sql);
		return $query->result_array();
		//Nicholas ... here you have to think differently as we don't know how many
		//             phase they will have for each program and at what phase the questions
		//             should appear.  

		/*   Here is an example on getting the question related to the program
		    You must get the questions for a specific standard and a clause ...
		    But first, they will need to be clear about the process and the actions to execute
		    for each program, phase and standard ...
		$sql = "SELECT question.id AS 'question_id',question, sub_clause.code AS 'sub_clause', 
			question_type.code AS 'question_type_code'  
			FROM question 
				JOIN sub_clause ON question.sub_clause_id = sub_clause.id 
				JOIN clause ON sub_clause.clause_id = clause.id 
				JOIN standard ON clause.standard_id = standard.id 
				LEFT JOIN question_type ON question.question_type_id = question_type.id
				JOIN program ON program.standard_id = standard.id AND program.clause_id = clause.id
				
            WHERE program.standard_id = 5 AND program.clause_id = 13";
		$query = $this->db->query($sql, array());
		return $query->result_array();	*/
		
		// Unless they know exactly what they want, I suggest to bring the general questions
		// for demonstration of the system...
		// $sql = "SELECT question.id AS 'question_id',question, sub_clause.code AS 'sub_clause', 
		// 	question_type.code AS 'question_type_code'  
		// 	FROM question 
		// 		JOIN sub_clause ON question.sub_clause_id = sub_clause.id 
		// 		JOIN clause ON sub_clause.clause_id = clause.id 
		// 		JOIN standard ON clause.standard_id = standard.id 
		// 		LEFT JOIN question_type ON question.question_type_id = question_type.id
		// WHERE clause.standard_id = 1 AND sub_clause.code BETWEEN '4.0.0' AND '4.9.9'";
		// $query = $this->db->query($sql, array());
		// return $query->result_array();
	}



	//---> Validate if the consultation have some documents attached
	public function checkIntegrity($id)
	{
		$sql = "SELECT * FROM document WHERE consultation_id = ?";
		$query = $this->db->query($sql, array($id));
		return $query->num_rows();

	}



}