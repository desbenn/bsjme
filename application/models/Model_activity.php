<?php

class Model_activity extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	//--> Get active information
	public function getActiveActivity()
	{
		$sql = "SELECT * FROM activity WHERE active = ?";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}

	//--> Get the activity data
	public function getActivityData($id = null)
	{
		if($id) {
			$sql = "SELECT * FROM activity WHERE id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT * FROM activity";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

	public function create($data)
	{
		if($data) {
			$insert = $this->db->insert('activity', $data);
			return ($insert == true) ? true : false;
		}
	}

	public function update($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('activity', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('activity');
			return ($delete == true) ? true : false;
		}
	}

	//---> Validate if the activity is used in table post
	public function checkIntegrity($id)
	{
		$sql = "SELECT * FROM client WHERE activity_id = ?";
		$query = $this->db->query($sql, array($id));
		return $query->num_rows();

	}

}