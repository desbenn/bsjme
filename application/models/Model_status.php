<?php 

class Model_status extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}



	//--> Get active information
	public function getActiveStatus()
	{
		$sql = "SELECT DISTINCT status.id,status.code,status.name AS 'status_name',phase_id,
						phase.name AS 'phase_name'
		 FROM status
		      JOIN phase ON status.phase_id = phase.id 
		 WHERE status.active = ?";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}



	//--> Get the status data
	public function getStatusData($id = null)
	{
		if($id) {
			$sql = "SELECT status.id,status.code,status.name AS 'status_name',
						phase_id,status.active,phase.code AS 'phase_code',
						phase.name AS 'phase_name'						   
			        FROM status 
			        JOIN phase ON status.phase_id = phase.id 
			        WHERE status.id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT status.id,status.code,status.name AS 'status_name',
		               phase_id,status.active,phase.code AS 'phase_code',
		               phase.name AS 'phase_name'
			        FROM status 
			        JOIN phase ON status.phase_id = phase.id 
			        ORDER BY phase.code,status.code";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

	public function create($data)
	{
		if($data) {
			$insert = $this->db->insert('status', $data);
			return ($insert == true) ? true : false;
		}
	}

	public function update($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('status', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('status');
			return ($delete == true) ? true : false;
		}
	}

	//---> Validate if the status is used in other table

	public function checkIntegrity($id)
	{
		
		$num_rows = 0;
		
		$sql = "SELECT * FROM consultation WHERE status_id = ?";
		$query = $this->db->query($sql, array($id));
		$num_rows = $num_rows + $query->num_rows();

		return $num_rows;
		
	}

}