<?php

class Model_city extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	//--> Get the active city data
	public function getActiveCity()
	{
		$sql = "SELECT * FROM city WHERE active = ? ORDER BY name ASC";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}

	//--> Get the data
	public function getCityData($id = null)
	{
		if($id) {
			$sql = "SELECT * FROM city where id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT * FROM city";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

	public function create($data)
	{
		if($data) {
			$insert = $this->db->insert('city', $data);
			return ($insert == true) ? true : false;
		}
	}

	public function update($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('city', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('city');
			return ($delete == true) ? true : false;
		}
	}

	public function countTotalCity()
	{
		$sql = "SELECT * FROM city WHERE active = ?";
		$query = $this->db->query($sql, array(1));
		return $query->num_rows();
	}

	//---> Validate if the city is used in table Client
	public function checkIntegrity($id)
	{
		$sql = "SELECT * FROM client WHERE city_id = ?";
		$query = $this->db->query($sql, array($id));
		return $query->num_rows();

	}

}