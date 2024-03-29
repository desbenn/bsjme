<?php

class Model_technical_advice extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}
	

	public function getTechnicalAdviceData($id=null)
	{
		if($id){
			$sql = "SELECT technical_advice.*, `address`, client_name, company_name, district, email, mobile, phone, postal_code, website, directory,
			parish.name AS 'parish_name', county.name AS 'county_name',(SELECT name FROM user WHERE technical_advice.updated_by = user.id) as 'updated_by'
			FROM technical_advice
			JOIN client on technical_advice.client_id= client.id
			LEFT JOIN parish ON client.parish_id = parish.id
			LEFT JOIN county ON client.county_id = county.id
			LEFT JOIN city ON client.city_id = city.id
			where technical_advice.id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}
		$sql = "SELECT technical_advice.*, address, client_name, company_name, district, email, mobile, phone, postal_code, website, directory,
		parish.name AS 'parish_name', county.name AS 'county_name',(SELECT name FROM user WHERE client.updated_by = user.id) as 'updated_by'
		FROM technical_advice
		JOIN client on technical_advice.client_id= client.id
		LEFT JOIN parish ON client.parish_id = parish.id
		LEFT JOIN county ON client.county_id = county.id
		LEFT JOIN city ON client.city_id = city.id
		ORDER BY technical_advice.id DES";
		$query = $this->db->query($sql);
		return $query->result_array();

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

		$sql = "SELECT technical_advice.*,company_name,
				FROM technical_advice
		        LEFT JOIN client ON technical_advice.client_id = client.id
				LEFT JOIN user ON technical_advice.consultant_id = user.id
		WHERE client.trn = $trn";
		
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
			
			// delete the technical advice
			$this->db->where('id', $id);
			$delete = $this->db->delete('technical_advice');
		    return ($delete == true) ? true : false;

		}
	}

	public function update($data,$id)
	{
		if($data && $id)
		{
			$this->db->where('id',$id);
			$update = $this->db->update('technical_advice', $data);
			return ($update == true) ? true : false;
		}
	}



}