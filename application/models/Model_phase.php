<?php

class Model_phase extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}


	public function getPhaseData($id = null)
	{
		if($id) {
			$sql = "SELECT phase.*
			FROM phase
			WHERE phase.id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT * FROM phase ORDER BY id DESC";
		$query = $this->db->query($sql);
		return $query->result_array();
	}


	//--> Get the active phase data
	public function getActivePhase()
	{
		$sql = "SELECT * FROM phase WHERE active = ? ORDER BY name ASC";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}


	


	public function create($data)
	{
		if($data) {
			$insert = $this->db->insert('phase', $data);
			$insert_id = $this->db->insert_id();
			return ($insert == true) ? $insert_id : false;
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


	//---> Validate if the phase is used in table consultation
	public function checkIntegrity($id)
	{
		$num_rows = 0;
		
		$sql = "SELECT * FROM consultation WHERE phase_id = ?";
		$query = $this->db->query($sql, array($id));
		$num_rows = $num_rows + $query->num_rows();

		$sql = "SELECT * FROM program_phase WHERE phase_id = ?";
		$query = $this->db->query($sql, array($id));
		$num_rows = $num_rows + $query->num_rows();

		$sql = "SELECT * FROM status WHERE phase_id = ?";
		$query = $this->db->query($sql, array($id));
		$num_rows = $num_rows + $query->num_rows();

		return $num_rows;

	}


}