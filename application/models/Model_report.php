<?php

class Model_report extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}


	//--> Get active information
	public function getReportList()
	{
		$sql = "SELECT report_code,report_title
		FROM report
		WHERE report_selection = ?
		ORDER BY report_code";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}


		public function getReportInfo ($report_code)
	{

		$sql = "SELECT report_code,report_title
				FROM report
				WHERE report_code = ?
				ORDER BY report_code";
		$query = $this->db->query($sql, array($report_code));
		return $query->row_array();
	}


	//--> print a specific consultation
	public function getReportConsultation($consultation_id)
	{

		$sql = "SELECT consultation.*,standard.name AS 'standard_name',
			status.name AS 'status_name', phase.name AS 'phase_name',			
			sector.name AS 'sector_name',consultant_id,
			program.name AS 'program_name',
			clause.name AS 'clause_name'
		FROM consultation
		    JOIN program ON consultation.program_id = program.id
			JOIN standard ON consultation.standard_id = standard.id
			JOIN status ON consultation.status_id = status.id
			JOIN phase ON consultation.phase_id = phase.id
			LEFT JOIN clause ON consultation.clause_id = clause.id
			LEFT JOIN sector ON consultation.sector_id = sector.id
		WHERE consultation.id = ?";
		$query = $this->db->query($sql, array($consultation_id));
		return $query->result();

	}


	//--> print of a client
	public function getReportClient($client_id)
	{
		$sql = "SELECT client.*,parish.name AS 'parish_name',
			county.name AS 'county_name',city.name AS 'city_name',
			activity.name AS 'activity_name'
		FROM client
			 LEFT JOIN parish ON client.parish_id = parish.id
			 LEFT JOIN county ON client.county_id = county.id
			 LEFT JOIN city ON client.city_id = city.id
			 JOIN activity ON client.activity_id = activity.id
		WHERE client.id = ?";
		$query = $this->db->query($sql, array($client_id));
		return $query->result();

	}

	//--> print consultation of client
	public function getReportClient_consultation($client_id)
	{

		$sql = "SELECT consultation.*,standard.name AS 'standard_name',
			status.name AS 'status_name', phase.name AS 'phase_name',
			sector.name AS 'sector_name',consultant_id,
			program.name AS 'program_name', clause.name AS 'clause_name'
		FROM consultation
			JOIN standard ON consultation.standard_id = standard.id
			JOIN status ON consultation.status_id = status.id
			JOIN phase ON consultation.phase_id = phase.id
			LEFT JOIN clause ON consultation.clause_id = clause.id
			LEFT JOIN sector ON consultation.sector_id = sector.id
			LEFT JOIN program ON consultation.program_id = program.id
		WHERE client_id = ?
		ORDER BY consultation_no";
		$query = $this->db->query($sql, array($client_id));
		return $query->result();

	}



	public function getReportClient_inquiry($client_id)
	{
		$sql = "SELECT inquiry.*,
			support_type.name AS 'support_type_name', inquiry_type.name AS 'inquiry_type_name'
		FROM inquiry
			LEFT JOIN support_type ON support_type.id = inquiry.support_type_id
			LEFT JOIN inquiry_type ON inquiry_type.id = inquiry.inquiry_type_id
		WHERE client_id = ?";
		$query = $this->db->query($sql, array($client_id));
		return $query->result();
	}



	public function getReportClient_Document($client_id)
	{
		$sql = "SELECT document.*,document_type.name AS 'document_type_name',
		               consultation_no,document_class.name AS 'document_class_name'
		FROM document
			JOIN document_type ON document.document_type_id = document_type.id
			JOIN document_class ON document.document_class_id = document_class.id
  	 	 	LEFT JOIN consultation ON document.consultation_id = consultation.id
		WHERE document.client_id = ?
		ORDER BY document_type.name";
		$query = $this->db->query($sql, array($client_id));
		return $query->result();

	}




	public function get_REP01()
	{
		//--> Criteria County
		$county = $this->session->county;
        if ($county == 'all') {
        	$county_from = 0;
			$county_to = 999;
        }
        else {
			$county_from = $county;
			$county_to = $county;
		}

		//--> Criteria Parish
		$parish = $this->session->parish;
        if ($parish == 'all') {
        	$parish_from = 0;
			$parish_to = 999;
        }
        else {
			$parish_from = $parish;
			$parish_to = $parish;
		}

		$sql = "SELECT client.*,parish.name AS 'parish_name',
			county.name AS 'county_name'
		FROM client
			 LEFT JOIN parish ON client.parish_id = parish.id			 
			 LEFT JOIN county ON client.county_id = county.id
		WHERE parish_id BETWEEN $parish_from AND $parish_to
		    AND county_id BETWEEN $county_from AND $county_to
			
		ORDER BY company_name";

		$query = $this->db->query($sql, array());

		if ($query->num_rows() > 0) {return $query->result();}

		return NULL;

	}


	public function get_REP02()
	{
		//--> Criteria Phase
		$phase = $this->session->phase;
        if ($phase == 'all') {
        	$phase_from = 0;
			$phase_to = 999;
        }
        else {
			$phase_from = $phase;
			$phase_to = $phase;
		}

		//--> Criteria Status
		$status = $this->session->status;
        if ($status == 'all') {
        	$status_from = 0;
			$status_to = 999;
        }
        else {
			$status_from = $status;
			$status_to = $status;
		}


		//--> Criteria Standard
		$standard = $this->session->standard;
        if ($standard == 'all') {
        	$standard_from = 0;
			$standard_to = 999;
        }
        else {
			$standard_from = $standard;
			$standard_to = $standard;
		}

		//--> Criteria Sector
		$sector = $this->session->sector;
        if ($sector == 'all') {
        	$sector_from = 0;
			$sector_to = 999;
        }
        else {
			$sector_from = $sector;
			$sector_to = $sector;		}



		//--> Criteria date
		$date_creation_from = $this->session->date_creation_from;
		$date_creation_to = $this->session->date_creation_to;
		if ($date_creation_from == null) {$date_creation_from = "'1900-01-01'";} else {$date_creation_from = "'".$date_creation_from."'";}
		if ($date_creation_to == null) {$date_creation_to = "'2500-01-01'";} else {$date_creation_to = "'".$date_creation_to."'";}


		//---> Get Consultant filter, if the user is a consultant,
        //     we will generate a drop-down list empty

        if ($this->session->consultant == 'all') {
        	$sql = "SELECT consultation.*,sector.name AS 'sector_name',
						standard.name AS 'standard_name',company_name,
						phase.name AS 'phase_name',status.name AS 'status_name'
					FROM consultation
						JOIN client ON consultation.client_id = client.id
						LEFT JOIN standard ON consultation.standard_id = standard.id
						LEFT JOIN phase ON consultation.phase_id = phase.id
						LEFT JOIN status ON consultation.status_id = status.id
						LEFT JOIN sector ON consultation.sector_id = sector.id
						
					WHERE  consultation.phase_id BETWEEN $phase_from AND $phase_to
						AND standard_id BETWEEN $standard_from AND $standard_to
						AND sector_id BETWEEN $sector_from AND $sector_to
						AND status_id BETWEEN $status_from AND $status_to
						AND date_creation BETWEEN $date_creation_from AND $date_creation_to
					ORDER BY company_name";
            
        } else {
        	//Insert quote before and after the consultant_id for the where clause LIKE '%"1"%'
        	//that search inside the field consultant_id.  It may contains more than one consultant.
            $consultant = '"'.$this->session->consultant.'"';

	    	$sql = "SELECT consultation.*,sector.name AS 'sector_name',
				standard.name AS 'standard_name',company_name,
				phase.name AS 'phase_name',status.name AS 'status_name'
			FROM consultation
				JOIN client ON consultation.client_id = client.id
				LEFT JOIN standard ON consultation.standard_id = standard.id
				LEFT JOIN phase ON consultation.phase_id = phase.id
				LEFT JOIN status ON consultation.status_id = status.id
				LEFT JOIN sector ON consultation.sector_id = sector.id
				
			WHERE  consultation.phase_id BETWEEN $phase_from AND $phase_to
				AND standard_id BETWEEN $standard_from AND $standard_to
				AND sector_id BETWEEN $sector_from AND $sector_to
				AND status_id BETWEEN $status_from AND $status_to
				AND date_creation BETWEEN $date_creation_from AND $date_creation_to
			    AND consultation.consultant_id LIKE '%$consultant%'	
			ORDER BY company_name";
		}			

		$query = $this->db->query($sql, array());

		if ($query->num_rows() > 0) {
			return $query->result();
		}

		return NULL;

	}


	public function get_REP04()
	{

		$inquiry_type = $this->session->inquiry_type;
        if ($inquiry_type == 'all') {
        	$inquiry_type_from = 0;
			$inquiry_type_to = 999;
        }
        else {
			$inquiry_type_from = $inquiry_type;
			$inquiry_type_to = $inquiry_type;
		}

		$support_type = $this->session->support_type;
        if ($support_type == 'all') {
        	$support_type_from = 0;
			$support_type_to = 999;
        }
        else {
			$support_type_from = $support_type;
			$support_type_to = $support_type;
		}

		$date_from = $this->session->date_from;
		$date_to = $this->session->date_to;
		if ($date_from == null) {$date_from = "'1900-01-01'";} else {$date_from = "'".$date_from."'";}
		if ($date_to == null) {$date_to = "'2500-01-01'";} else {$date_to = "'".$date_to."'";}



        $sql = "SELECT inquiry.*, inquiry_type.name AS 'inquiry_type_name', company_name,
        trn,support_type.name AS 'support_type_name'
		FROM inquiry
			 JOIN client ON inquiry.client_id = client.id
			 JOIN inquiry_type ON inquiry_type.id = inquiry.inquiry_type_id
			 JOIN support_type ON support_type.id = inquiry.support_type_id
		WHERE  inquiry_date BETWEEN $date_from AND $date_to
				AND inquiry_type_id BETWEEN $inquiry_type_from AND $inquiry_type_to
				AND support_type_id BETWEEN $support_type_from AND $support_type_to
		ORDER BY company_name";

		$query = $this->db->query($sql, array());

		if ($query->num_rows() > 0) {return $query->result();}

		return NULL;
	}


	public function get_REP05()
	{

		//--> Criteria Phase
		$phase = $this->session->phase;
        if ($phase == 'all') {
        	$phase_from = 0;
			$phase_to = 999;
        }
        else {
			$phase_from = $phase;
			$phase_to = $phase;
		}

		//--> Criteria Status
		$status = $this->session->status;
        if ($status == 'all') {
        	$status_from = 0;
			$status_to = 999;
        }
        else {
			$status_from = $status;
			$status_to = $status;
		}

		//--> Criteria Sector
		$sector = $this->session->sector;
        if ($sector == 'all') {
        	$sector_from = 0;
			$sector_to = 999;
        }
        else {
			$sector_from = $sector;
			$sector_to = $sector;		}

		//--> Criteria Consultant
		$consultant = $this->session->consultant;
        if ($consultant == 'all') {
        	$consultant_from = 0;
			$consultant_to = 999;
        }
        else {
			$consultant_from = $consultant;
			$consultant_to = $consultant;		}

		//--> Criteria date
		$date_creation_from = $this->session->date_creation_from;
		$date_creation_to = $this->session->date_creation_to;

		if ($date_creation_from == null) {$date_creation_from = "'1900-01-01'";} else {$date_creation_from = "'".$date_creation_from."'";}
		if ($date_creation_to == null) {$date_creation_to = "'2500-01-01'";} else {$date_creation_to = "'".$date_creation_to."'";}


		$sql = "SELECT consultation.id,consultation_no,company_name,county.name AS 'county_name',
					     status.name as 'status_name',phase.name as 'phase_name',
					     sector.name AS 'sector_name',
					     client.county_id,user.name AS 'consultant_name',
					     date_end,date_creation,description
				FROM consultation
					JOIN client ON consultation.client_id = client.id
					LEFT JOIN status ON consultation.status_id = status.id
					LEFT JOIN sector ON consultation.sector_id = sector.id
					LEFT JOIN phase ON consultation.phase_id = phase.id
					LEFT JOIN user ON consultation.consultant_id = user.id
					LEFT JOIN county ON client.county_id = county.id
				WHERE  consultation.phase_id BETWEEN $phase_from AND $phase_to
					AND status_id BETWEEN $status_from AND $status_to
					AND consultant_id BETWEEN $consultant_from AND $consultant_to
					AND date_creation BETWEEN $date_creation_from AND $date_creation_to";

		$query = $this->db->query($sql, array());

	   	if ($query->num_rows() > 0) {
			return $query->result();
		}

		return NULL;

	}


	//-------------------------------------- S E T T I N G S ----------------------------------------------------

	public function getReport06($setting)
	{
		if ($setting == 'county') {
			$sql = "SELECT id,name,code,
					CASE WHEN active = 1 THEN 'Yes' else 'No' END AS 'active'
					FROM county ORDER BY name";
			$query = $this->db->query($sql, array());
			return $query->result();
		}

		elseif ($setting == 'parish') {
			$sql = "SELECT id,name,code,
					CASE WHEN active = 1 THEN 'Yes' else 'No' END AS 'active'
					FROM parish ORDER BY name";
			$query = $this->db->query($sql, array());
			return $query->result();
		}

		elseif ($setting == 'city') {
			$sql = "SELECT id,name,code,
					CASE WHEN active = 1 THEN 'Yes' else 'No' END AS 'active'
					FROM city ORDER BY name";
			$query = $this->db->query($sql, array());
			return $query->result();
		}

		elseif ($setting == 'sector') {
			$sql = "SELECT id,name,'no code' AS 'code',
					CASE WHEN active = 1 THEN 'Yes' else 'No' END AS 'active'
					FROM sector ORDER BY name";
			$query = $this->db->query($sql, array());
			return $query->result();
		}

		elseif ($setting == 'inquiry_type') {
			$sql = "SELECT id,name,code,
					CASE WHEN active = 1 THEN 'Yes' else 'No' END AS 'active'
					FROM inquiry_type ORDER BY name";
			$query = $this->db->query($sql, array());
			return $query->result();
		}

		elseif ($setting == 'activity') {
			$sql = "SELECT id,name,'no code' AS 'code',
					CASE WHEN active = 1 THEN 'Yes' else 'No' END AS 'active'
					FROM activity ORDER BY name";
			$query = $this->db->query($sql, array());
			return $query->result();
		}

		elseif ($setting == 'support_type') {
			$sql = "SELECT id,name,code,
					CASE WHEN active = 1 THEN 'Yes' else 'No' END AS 'active'
					FROM support_type ORDER BY name";
			$query = $this->db->query($sql, array());
			return $query->result();
		}

		elseif ($setting == 'document_type') {
			$sql = "SELECT document_type.id AS 'id',
						   CONCAT(document_type.name, '  (default class= ', document_class.name, ')') AS 'name',
			               document_type.code AS 'code',
					CASE WHEN document_type.active = 1 THEN 'Yes' else 'No' END AS 'active'
					FROM document_type 
					LEFT JOIN document_class ON document_class.id = document_type.document_class_id
					ORDER BY document_type.name";
			$query = $this->db->query($sql, array());
			return $query->result();
		}

		elseif ($setting == 'document_class') {
			$sql = "SELECT id,name,code,
					CASE WHEN active = 1 THEN 'Yes' else 'No' END AS 'active'
					FROM document_class ORDER BY name";
			$query = $this->db->query($sql, array());
			return $query->result();
		}

		elseif ($setting == 'standard') {
			$sql = "SELECT id,name,code,
					CASE WHEN active = 1 THEN 'Yes' else 'No' END AS 'active'
					FROM standard ORDER BY name";
			$query = $this->db->query($sql, array());
			return $query->result();
		}

		elseif ($setting == 'status') {
			$sql = "SELECT status.id AS 'id',
						   CONCAT(status.name, '  (Phase= ', phase.name, ')') AS 'name',
			               status.code AS 'code',
					CASE WHEN status.active = 1 THEN 'Yes' else 'No' END AS 'active'
					FROM status 
					LEFT JOIN phase ON phase.id = status.phase_id
					ORDER BY status.name";
			$query = $this->db->query($sql, array());
			return $query->result();
		}

		elseif ($setting == 'phase') {
			$sql = "SELECT id,name,code,
					CASE WHEN active = 1 THEN 'Yes' else 'No' END AS 'active'
					FROM phase ORDER BY name";
			$query = $this->db->query($sql, array());
			return $query->result();
		}

		elseif ($setting == 'category') {
			$sql = "SELECT id,name,'no code' AS 'code',
					CASE WHEN active = 1 THEN 'Yes' else 'No' END AS 'active'
					FROM category ORDER BY name";
			$query = $this->db->query($sql, array());
			return $query->result();
		}

	}

	//--> Get a specific list of the sub-clause

	public function getReport07()
	{
		$sql = "SELECT sub_clause.id,clause.name AS 'clause_name',clause.code,sub_clause.code,
		            sub_clause.name,CASE WHEN clause.active = 1 THEN 'Yes' else 'No' END AS 'active',
					standard.name AS 'standard_name',phase_id
					FROM sub_clause
						JOIN clause ON sub_clause.clause_id = clause.id
						JOIN standard ON clause.standard_id = standard.id
					ORDER BY standard.name,clause.code,sub_clause.code";
			$query = $this->db->query($sql, array());
			return $query->result();
	}



	//--> Get a specific list of the settings Clause

	public function getReport08()
	{
		$sql = "SELECT clause.id,clause.name,clause.code,
					CASE WHEN clause.active = 1 THEN 'Yes' else 'No' END AS 'active',
					standard.name AS 'standard_name'
					FROM clause
					JOIN standard ON clause.standard_id = standard.id
					ORDER BY standard.name,clause.name";
			$query = $this->db->query($sql, array());
			return $query->result();
	}


}