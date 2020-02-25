<?php

class Model_document_class extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	//--> Get active information
	public function getActiveDocumentClass()
	{
		$sql = "SELECT * FROM document_class WHERE active = ? ORDER BY name ASC";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}

	//--> Get the data
	public function getDocumentClassData($id = null)
	{
		if($id) {
			$sql = "SELECT * FROM document_class WHERE id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT * FROM document_class";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

	public function create($data)
	{
		if($data) {
			$insert = $this->db->insert('document_class', $data);
			return ($insert == true) ? true : false;
		}
	}

	public function update($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('document_class', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('document_class');
			return ($delete == true) ? true : false;
		}
	}

	//---> Validate if the document type is used in table inquiry
	public function checkIntegrity($id)
	{
		$num_rows = 0;
		
		$sql = "SELECT * FROM document WHERE document_class_id = ?";
		$query = $this->db->query($sql, array($id));
		$num_rows = $num_rows + $query->num_rows();

		$sql = "SELECT * FROM document_type WHERE document_class_id = ?";
		$query = $this->db->query($sql, array($id));
		$num_rows = $num_rows + $query->num_rows();

		return $num_rows;

	}

}