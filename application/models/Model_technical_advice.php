<?php

class Model_technical_advice extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}
	//--> Get the data for a specific consultant or for all

	public function getTechnicalAdviceByConsultant($consultant,$activity)
	{

        if ($activity == 'all') {
			$activity_from = '0';
			$activity_to = '999';
		} else  {
			$activity_from = $activity;
			$activity_to = $activity;	
			
		}
		if ($consultant == 'all') {
			$sql = "SELECT DISTINCT technical_advice.id AS 'id',
            client.id AS 'client_id', technical_advice.consultant_id AS 'consultant_id', technical_advice.activity AS 'activity_id',
            activity.name AS 'activity_name', date_created
			FROM technical_advice
                 LEFT JOIN client ON technical_advice.client_id = client.id
			     JOIN activity ON technical_advice.activity= activity.id
			WHERE activity BETWEEN $activity_from AND $activity_to     
			ORDER by client.activity_id DESC,company_name";
	    } else {
			$sql = "SELECT DISTINCT technical_advice.id, technical_advice.client_id, technical_advice.consultant_id as 'consultant_id', technical_advice.activity AS 'activity_id', activity.name AS 'activity_name', technical_advice.date_created FROM technical_advice 
			LEFT JOIN client ON technical_advice.client_id = client.id
			LEFT JOIN user ON technical_advice.consultant_id = user.id
			JOIN activity ON technical_advice.activity= activity.id
			WHERE technical_advice.consultant_id LIKE '%$consultant%' AND activity.id BETWEEN $activity_from AND $activity_to";
            
	    }

		$query = $this->db->query($sql);
		return $query->result_array();
	}

	//--> Get the data for a specific client

	public function getTechnicalAdviceByClient($trn)
	{

		$sql = "SELECT technical_advice.*,technical_advice.id AS 'id',company_name,
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

	public function create($data)
	{
		//---> The id is returned to the controller so that the update form
		//     of technical advice can be opened to continue encoding the datas
		if($data) {
			$insert = $this->db->insert('technical_advice', $data);
			$insert_id = $this->db->insert_id();
			return ($insert == true) ? $insert_id : false;
		}
	}

	public function remove($id)
	{
		//--> All the information attached to the client must be deleted

		if($id) {
			
			// delete the consultation
			$this->db->where('id', $id);
			$delete = $this->db->delete('technical_advice');
		    return ($delete == true) ? true : false;

		}
	}

	



}