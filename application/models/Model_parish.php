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

	//---> Validate if the parish is used in table Client, Consultation 

	public function checkIntegrity($id)
	{

		$num_rows = 0;

		// select with the wildcard %.  It is possible to have more
		// than one parish in consultation table.   In this case, the information
		// will appear between bracket ex:["1"].  The search will be
		// SELECT * FROM consultation WHERE parish_id LIKE '%["1"]%'
		/*$this->db->select('*');
		$this->db->from('consultation');
		$this->db->like('parish_id', $id, 'both');
		$query = $this->db->get();
		$num_rows = $query->num_rows();*/

		$sql = "SELECT * FROM client WHERE parish_id = ?";
		$query = $this->db->query($sql, array($id));
		$num_rows = $num_rows + $query->num_rows();

		$sql = "SELECT * FROM consultation WHERE parish_id = ?";
		$query = $this->db->query($sql, array($id));
		$num_rows = $num_rows + $query->num_rows();

		return $num_rows;

	}

}