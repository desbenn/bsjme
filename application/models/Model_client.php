<?php

class Model_client extends CI_Model
{
	public function __construct()
	{
		parent::__construct();

	}



	public function getClientDataById($id)
	{
		$sql = "SELECT client.*,(SELECT name FROM user WHERE client.updated_by = user.id) AS 'updated_by' 
		FROM client where client.id = ?";
		$query = $this->db->query($sql, array($id));
		return $query->row_array();

	}


	public function getClientData()
	{
		$sql = "SELECT * FROM client ORDER BY company_name ASC";
		$query = $this->db->query($sql, array());
		return $query->result_array();

	}


	//--> Get the data for a specific consultant or for all

	public function getClientByConsultant($consultant,$activity)
	{

		if ($activity == 'all') {
			$activity_from = '0';
			$activity_to = '999';
		} else  {
			$activity_from = $activity;
			$activity_to = $activity;	
			
		}
		if ($consultant == 'all') {
			$sql = "SELECT DISTINCT client.id,activity_id,
			               company_name,trn,client_name,activity.name AS 'activity_name'
			FROM client
			     LEFT JOIN consultation ON consultation.client_id = client.id
			     JOIN activity ON client.activity_id = activity.id
			WHERE activity_id BETWEEN $activity_from AND $activity_to     
			ORDER by client.activity_id DESC,company_name";
	    } else {

			$sql = "SELECT DISTINCT client.id,activity_id,
			               company_name,trn,client_name,activity.name AS 'activity_name'
			FROM client
			        LEFT JOIN consultation ON consultation.client_id = client.id
			        JOIN activity ON client.activity_id = activity.id
		    WHERE consultation.consultant_id LIKE '%$consultant%'
		          AND activity_id BETWEEN $activity_from AND $activity_to    
			ORDER by client.activity_id DESC,company_name";
	    }

		$query = $this->db->query($sql);
		return $query->result_array();
	}


	//--> Get the data for a specific client

	public function getClientByClient($trn)
	{

		$sql = "SELECT client.id,activity_id,
			           company_name,trn,client_name,activity.name AS 'activity_name'
		FROM client
 	        JOIN activity ON client.activity_id = activity.id
	    WHERE client.trn = $trn";

		$query = $this->db->query($sql);
		return $query->result_array();
	}



	public function getClientConsultationData()
	{
		$sql = "SELECT consultation.id as 'id',company_name,
		description AS 'consultation_description',consultation_no,
		sector.name AS 'sector_name'
		 FROM consultation 
		 JOIN client ON consultation.client_id = client.id
		 JOIN sector ON consultation.sector_id = sector.id
		 WHERE client.activity_id = ?
		 ORDER BY company_name ASC";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();

	}


	public function getClientRequirement($id)
	{
		$sql = "SELECT client_requirement.id,answer,requirement.question
		        FROM client_requirement
		        LEFT JOIN requirement ON client_requirement.requirement_id = requirement.id
		        WHERE client_requirement.client_id = $id";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

	


	public function getClientDocument($id)
	{

		$sql = "SELECT document.*,document_type.name AS 'document_type_name',
		               directory,consultation_no,
		               document_class.name AS 'document_class_name'
		FROM document
		 	 LEFT JOIN document_type ON document.document_type_id = document_type.id
		 	 LEFT JOIN document_class ON document.document_class_id = document_class.id
		 	 LEFT JOIN consultation ON document.consultation_id = consultation.id
		 	 JOIN client ON document.client_id = client.id
		WHERE document.client_id = ?";
		$query = $this->db->query($sql, array($id));
		return $query->result_array();

	}


	public function create($data)
	{
		//---> The id is returned to the controller so that the update form
		//     of client can be opened to continue encoding the datas
		if($data) {
			$insert = $this->db->insert('client', $data);
			$insert_id = $this->db->insert_id();
			return ($insert == true) ? $insert_id : false;
		}
	}

	public function update($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('client', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		//--> All the information attached to the client must be deleted

		if($id) {
			// Get the directory of the documents from the client table
			$sql = "SELECT directory FROM client where id = ?";
			$query = $this->db->query($sql, array($id));
			$row = $query->row();

			if (isset($row)) {$directory = $row->directory;}
			$path = "./upload/documents/".$directory;

			// Delete all the documents inside the directory
			// We can delete a directory with rmdir only if it's empty
			$dir = opendir($path);
		    while(false !== ( $file = readdir($dir)) ) {
		        if (( $file != '.' ) && ( $file != '..' )) {
		            $full = $path . '/' . $file;
		            if ( is_dir($full) ) {rrmdir($full);}
		            else {unlink($full);}
		        }
		    }
		    closedir($dir);
		    rmdir($path);

			// Remove the tables attached to client
			// consultation - document - inquiry

		    // Remove the answer related to the consultation before deleting the consultation
		    $this->db->where("EXISTS(SELECT * FROM consultation WHERE client_id = $id)");
			$delete = $this->db->delete('answer');	
			// Delete the consultations
			$this->db->where('client_id', $id);
			$delete = $this->db->delete('consultation');
			// Delete the document in document table
			$this->db->where('client_id', $id);
			$delete = $this->db->delete('document');
			// Delete the inquiry
			$this->db->where('client_id', $id);
			$delete = $this->db->delete('inquiry');
			// Delete the requirement related to the client
			$this->db->where('client_id', $id);
			$delete = $this->db->delete('client_requirement');

			// delete the client
			$this->db->where('id', $id);
			$delete = $this->db->delete('client');
		    return ($delete == true) ? true : false;

		}
	}


	public function countTotalClient($activity_id)
	{
		$sql = "SELECT * FROM client WHERE activity_id = ?";
		$query = $this->db->query($sql, array($activity_id));
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

	/**Client Requirement section. Which will have CRUD operations */
	public function addClientRequirement($data)
	{
		$sql = "";
		$insert = $this->db->insert('client_requirement', $data);
		return ($insert == true) ? true : false;
	}

	public function retrieveClientRequirement($id)
	{
		
	}


}