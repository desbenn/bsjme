<?php

class Model_manual extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}



	//--> print a specific consultation
	public function getConsultation($consultation_id)
	{

		$sql = "SELECT business_process,board_meeting_time_period,management_review_time,					
			sector.name AS 'sector_name',company_name,client_id,quality_policy,product,
			county.name AS 'county_name',parish.name AS 'parish_name',
			city.name AS 'city_name',exemption
		FROM consultation
			JOIN phase ON consultation.phase_id = phase.id
			LEFT JOIN sector ON consultation.sector_id = sector.id
			JOIN client ON consultation.client_id = client.id
			LEFT JOIN county ON client.county_id = county.id
			LEFT JOIN parish ON client.parish_id = parish.id
			LEFT JOIN city ON client.city_id = city.id
		WHERE consultation.id = ?";
		$query = $this->db->query($sql, array($consultation_id));#																																																																	
		return $query->row();

	}



	public function getClient_Document($client_id)
	{
		$sql = "SELECT document.*,document_type.name AS 'document_type_name',
		               consultation_no
		FROM document
			JOIN document_type ON document.document_type_id = document_type.id
  	 	 	LEFT JOIN consultation ON document.consultation_id = consultation.id
		WHERE document.client_id = ?
		ORDER BY document_type.name";
		$query = $this->db->query($sql, array($client_id));
		return $query->result();

	}

}