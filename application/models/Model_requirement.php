<?php 

class Model_requirement extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	public function getRequirementData($id = null)
	{
		if($id) {
			$sql = "SELECT requirement.*,question_type.name AS 'question_type_name' 
			FROM requirement 
			JOIN question_type ON requirement.question_type_id = question_type.id
			WHERE requirement.id=?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		else{
			$sql = "SELECT requirement.*,question_type.name AS 'question_type_name' 
			FROM requirement 
			JOIN question_type ON requirement.question_type_id = question_type.id";
			$query = $this->db->query($sql);
			return $query->result_array();
		}
	}



	public function create($data)
	{
            
		$insert = $this->db->insert('requirement', $data);
		//$question_id = $this->db->insert_id();
		return ($insert) ? $insert : false;
	}

	public function update($data,$id)
	{
		if($id) 
		{	
            $this->db->where('id', $id);
			$update = $this->db->update('requirement', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		if($id) 
		{
			$this->db->where('id', $id);
			$delete = $this->db->delete('requirement');
			return ($delete == true) ? true : false;
		}
	}



}