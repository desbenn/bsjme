<?php

class Model_category extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	//--> Get active information
	public function getActiveCategory()
	{
		$sql = "SELECT * FROM category WHERE active = ?";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}

	//--> Get the category data
	public function getCategoryData($id = null)
	{
		if($id) {
			$sql = "SELECT * FROM category WHERE id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT * FROM category";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

	public function create($data)
	{
		if($data) {
			$insert = $this->db->insert('category', $data);
			return ($insert == true) ? true : false;
		}
	}

	public function update($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('category', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('category');
			return ($delete == true) ? true : false;
		}
	}

	//---> Validate if the category is used in table post
	public function checkIntegrity($id)
	{
		$sql = "SELECT * FROM post WHERE category_id = ?";
		$query = $this->db->query($sql, array($id));
		return $query->num_rows();

	}

}