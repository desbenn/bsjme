<?php 

class Model_clause extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}



	//--> Get active information
	public function getActiveClause()
	{
		$sql = "SELECT clause.id,clause.code,clause.name,standard_id,
						standard.name AS 'standard_name'
		 FROM clause
		      JOIN standard ON clause.standard_id = standard.id 
		 WHERE clause.active = ?";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}



	//--> Get the clause data
	public function getClauseData($id = null)
	{
		if($id) {
			$sql = "SELECT clause.id,clause.code,clause.name,standard_id,clause.active,
						   standard.name AS 'standard_name'
			        FROM clause 
			        JOIN standard ON clause.standard_id = standard.id 
			        WHERE clause.id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT clause.id,clause.code,clause.name,standard_id,clause.active,
						   standard.name AS 'standard_name'
			        FROM clause 
			        JOIN standard ON clause.standard_id = standard.id 
			        ORDER BY clause.name";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

	public function create($data)
	{
		if($data) {
			$insert = $this->db->insert('clause', $data);
			return ($insert == true) ? true : false;
		}
	}

	public function update($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('clause', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('clause');
			return ($delete == true) ? true : false;
		}
	}

	//---> Validate if the clause is used in table Item_clause

	public function checkIntegrity($id)
	{
		
		$num_rows = 0;
		
		/*$sql = "SELECT * FROM standard WHERE clause_id = ?";
		$query = $this->db->query($sql, array($id));
		return $query->num_rows();

		$sql = "SELECT * FROM asset_clause WHERE clause_id = ?";
		$query = $this->db->query($sql, array($id));
		$num_rows = $num_rows + $query->num_rows();*/

		return $num_rows;
		
	}

}