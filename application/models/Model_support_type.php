<?php

class Model_support_type extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	//--> Get active information
	public function getActiveSupportType()
	{
		$sql = "SELECT * FROM support_type WHERE active = ? ORDER BY name ASC";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}

	//--> Get the data
	public function getSupportTypeData($id = null)
	{
		if($id) {
			$sql = "SELECT * FROM support_type WHERE id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT * FROM support_type";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

	public function create($data)
	{
		if($data) {
			$insert = $this->db->insert('support_type', $data);
			return ($insert == true) ? true : false;
		}
	}

	public function update($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('support_type', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('support_type');
			return ($delete == true) ? true : false;
		}
	}

	//---> Validate if the support type is used in table inquiry
	public function checkIntegrity($id)
	{
		$sql = "SELECT * FROM inquiry WHERE support_type_id = ?";
		$query = $this->db->query($sql, array($id));
		return $query->num_rows();

	}

}