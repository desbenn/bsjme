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

	//---> Validate if the sector is used in table Client
	public function checkIntegrity($id)
	{
		// select with the wildcard %.  It is possible to have more
		// than one sector in client table.   In this case, the information
		// will appear between bracket ["1"].  The search will be
		// SELECT * FROM client WHERE sector_id LIKE '%["1"]%'
		$this->db->select('*');
		$this->db->from('client');
		$this->db->like('sector_id', $id, 'both');
		$query = $this->db->get();
		return $query->num_rows();

	}
}