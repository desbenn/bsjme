<?php

class Model_sector extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	//--> Get active information
	public function getActiveSector()
	{
		$sql = "SELECT * FROM sector WHERE active = ? ORDER BY name ASC";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}

	//--> Get the data of the table
	public function getSectorData($id = null)
	{
		if($id) {
			$sql = "SELECT * FROM sector WHERE id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT * FROM sector";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

	public function create($data)
	{
		if($data) {
			$insert = $this->db->insert('sector', $data);
			return ($insert == true) ? true : false;
		}
	}

	public function update($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('sector', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('sector');
			return ($delete == true) ? true : false;
		}
	}

	//---> Validate if the sector is used in table consultation
	public function checkIntegrity($id)
	{
		$sql = "SELECT * FROM consultation WHERE sector_id = ?";
		$query = $this->db->query($sql, array($id));
		return $query->num_rows();


	}
}