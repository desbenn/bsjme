<?php

class Model_county extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	//--> Get the active county data
	public function getActiveCounty()
	{
		$sql = "SELECT * FROM county WHERE active = ? ORDER BY name ASC";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}

	//--> Get the data
	public function getCountyData($id = null)
	{
		if($id) {
			$sql = "SELECT * FROM county where id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT * FROM county";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

	public function create($data)
	{
		if($data) {
			$insert = $this->db->insert('county', $data);
			return ($insert == true) ? true : false;
		}
	}

	public function update($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('county', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('county');
			return ($delete == true) ? true : false;
		}
	}

	public function countTotalCounty()
	{
		$sql = "SELECT * FROM county WHERE active = ?";
		$query = $this->db->query($sql, array(1));
		return $query->num_rows();
	}

	//---> Validate if the county is used in table Client or Consultation
	public function checkIntegrity($id)
	{

		$num_rows = 0;

		// select with the wildcard %.  It is possible to have more
		// than one county in consultation table.   In this case, the information
		// will appear between bracket ex:["1"].  The search will be
		// SELECT * FROM consultation WHERE parish_id LIKE '%["1"]%'
		$this->db->select('*');
		$this->db->from('consultation');
		$this->db->like('county_id', $id, 'both');
		$query = $this->db->get();
		$num_rows = $query->num_rows();

		$sql = "SELECT * FROM client WHERE county_id = ?";
		$query = $this->db->query($sql, array($id));
		$num_rows = $num_rows + $query->num_rows();
		return $num_rows;

	}

}