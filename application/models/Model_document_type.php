<?php 

class Model_document_type extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}



	//--> Get active information
	public function getActiveDocumentType()
	{
		$sql = "SELECT document_type.id,document_type.code,document_type.name,document_class_id,
						document_class.name AS 'document_class_name'
		 FROM document_type
		      JOIN document_class ON document_type.document_class_id = document_class.id 
		 WHERE document_type.active = ?";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}



	//--> Get the document_type data
	public function getDocumentTypeData($id = null)
	{
		if($id) {
			$sql = "SELECT document_type.id,document_type.code,document_type.name,document_class_id,document_type.active,
						   document_class.name AS 'document_class_name'
			        FROM document_type 
			        JOIN document_class ON document_type.document_class_id = document_class.id 
			        WHERE document_type.id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT document_type.id,document_type.code,document_type.name,document_class_id,document_type.active,
						   document_class.name AS 'document_class_name'
			        FROM document_type 
			        JOIN document_class ON document_type.document_class_id = document_class.id 
			        ORDER BY document_type.name";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

	public function create($data)
	{
		if($data) {
			$insert = $this->db->insert('document_type', $data);
			return ($insert == true) ? true : false;
		}
	}

	public function update($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('document_type', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('document_type');
			return ($delete == true) ? true : false;
		}
	}

	//---> Validate if the document_type is used in table Item_document_type

	public function checkIntegrity($id)
	{
		
		$sql = "SELECT * FROM document WHERE document_type_id = ?";
		$query = $this->db->query($sql, array($id));
		return $query->num_rows();
		
	}

}