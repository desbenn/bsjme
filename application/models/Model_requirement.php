<?php 

class Model_requirement extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	public function getQuestionData($id = null)
	{
		if($id) {
			$sql = "SELECT * FROM `requirements` where id='$id'";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		else{
			$sql = "SELECT * FROM `requirements`";
			$query = $this->db->query($sql);
			return $query->result_array();
		}
	}

	public function getActiveQuestionType()
	{
		$sql = "SELECT * FROM question_type WHERE active = ? ORDER BY name ASC";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}

	public function create($data)
	{
            
		$insert = $this->db->insert('requirements', $data);
		//$question_id = $this->db->insert_id();
		return ($insert) ? $insert : false;
	}

	public function update($data,$id)
	{
		if($id) 
		{	
            $this->db->where('id', $id);
			$update = $this->db->update('requirements', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		if($id) 
		{
			$this->db->where('id', $id);
			$delete = $this->db->delete('requirements');
			return ($delete == true) ? true : false;
		}
	}



}