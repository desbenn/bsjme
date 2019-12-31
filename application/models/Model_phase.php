<?php

class Model_phase extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	//--> Get the active phase data
	public function getActivePhase()
	{
		$sql = "SELECT * FROM phase WHERE active = ? ORDER BY name ASC";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}

	//--> Get the data
	public function getPhaseData($id = null)
	{
		if($id) {
			$sql = "SELECT * FROM phase where id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT * FROM phase";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

	public function create($data)
	{
		if($data) {
			$insert = $this->db->insert('phase', $data);
			return ($insert == true) ? true : false;
		}
	}

	public function update($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('phase', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('phase');
			return ($delete == true) ? true : false;
		}
	}

	public function countTotalPhase()
	{
		$sql = "SELECT * FROM phase WHERE active = ?";
		$query = $this->db->query($sql, array(1));
		return $query->num_rows();
	}

	//---> Validate if the phase is used in table consultation
	public function checkIntegrity($id)
	{
		$sql = "SELECT * FROM consultation WHERE phase_id = ?";
		$query = $this->db->query($sql, array($id));
		return $query->num_rows();

	}

}