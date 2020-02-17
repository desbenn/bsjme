<?php

class Model_parish extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	//--> Get the active parish data
	public function getActiveParish()
	{
		$sql = "SELECT * FROM parish WHERE active = ? ORDER BY name ASC";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}

	//--> Get the data
	public function getParishData($id = null)
	{
		if($id) {
			$sql = "SELECT * FROM parish where id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT * FROM parish";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

	public function create($data)
	{
		if($data) {
			$insert = $this->db->insert('parish', $data);
			return ($insert == true) ? true : false;
		}
	}

	public function update($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('parish', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('parish');
			return ($delete == true) ? true : false;
		}
	}

	public function countTotalParish()
	{
		$sql = "SELECT * FROM parish WHERE active = ?";
		$query = $this->db->query($sql, array(1));
		return $query->num_rows();
	}

	//---> Validate if the parish is used in table Consultation 

	public function checkIntegrity($id)
	{

		$sql = "SELECT * FROM client WHERE parish_id = ?";
		$query = $this->db->query($sql, array($id));
		return $query->num_rows();

	}

}