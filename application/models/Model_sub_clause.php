<?php 

class Model_sub_clause extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}


	//--> Get active information
	public function getActiveSubClause()
	{
		$sql = "SELECT sub_clause.id,sub_clause.code,sub_clause.name,clause_id,
						clause.name AS 'clause_name'
		 FROM sub_clause
		      JOIN clause ON sub_clause.clause_id = clause.id 
		 WHERE sub_clause.active = ?";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}



	//--> Get the sub_clause data
	public function getSubClauseData($id = null)
	{
		if($id) {
			$sql = "SELECT sub_clause.id,sub_clause.code,sub_clause.name,clause_id,sub_clause.active,
						   clause.code AS 'clause_code',standard.name as 'standard_name',
						   clause.name AS 'clause_name'
			        FROM sub_clause 
			        	 JOIN clause ON sub_clause.clause_id = clause.id 
			        	 JOIN standard ON clause.standard_id = standard.id
			        WHERE sub_clause.id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT sub_clause.id,sub_clause.code,sub_clause.name,clause_id,sub_clause.active,
						   clause.code AS 'clause_code',standard.name as 'standard_name',
						   clause.name AS 'clause_name'
			        FROM sub_clause 
			        	 JOIN clause ON sub_clause.clause_id = clause.id 
			        	 JOIN standard ON clause.standard_id = standard.id
			        ORDER BY sub_clause.name";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

	public function create($data)
	{
		if($data) {
			$insert = $this->db->insert('sub_clause', $data);
			return ($insert == true) ? true : false;
		}
	}

	public function update($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('sub_clause', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('sub_clause');
			return ($delete == true) ? true : false;
		}
	}

	//---> Validate if the sub_clause is used in table question

	public function checkIntegrity($id)
	{
				
		$sql = "SELECT * FROM question WHERE sub_clause_id = ?";
		$query = $this->db->query($sql, array($id));
		return $query->num_rows();

	}

}