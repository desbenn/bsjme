<?php 

class Model_program extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	
	public function getProgramData($id = null)
	{
		if($id) {
			$sql = "SELECT program.*,		            
			            clause.id AS 'clause_id',clause.code AS 'clause_code',clause.name AS 'clause_name',
						standard.id AS 'standard_id',standard.name AS 'standard_name'
		 	FROM program
			      LEFT JOIN clause ON program.clause_id = clause.id
				  LEFT JOIN standard ON program.standard_id = standard.id
			WHERE program.id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT program.*,				            
			            clause.id AS 'clause_id',clause.code AS 'clause_code',clause.name AS 'clause_name',
						standard.id AS 'standard_id',standard.name AS 'standard_name'
		 	FROM program
				  LEFT JOIN clause ON program.clause_id = clause.id
				  LEFT JOIN standard ON program.standard_id = standard.id
			ORDER BY standard.name,clause.code,program.name ASC";
		$query = $this->db->query($sql);
		return $query->result_array();
	}



	public function getActiveProgram()
	{
		$sql = "SELECT * FROM program WHERE active = ? ORDER BY name ASC";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}
	
	
	// get the phase program data
	public function getProgramPhaseData($program_id)
	{

		$sql = "SELECT phase_id AS 'id',program_id,name,sequence
				FROM program_phase 
					 JOIN phase ON program_phase.phase_id = phase.id
				WHERE program_id = ?
				ORDER BY sequence";
		$query = $this->db->query($sql, array($program_id));
		return $query->result_array();
	}


	// get the phase program data
	public function getProgramPhaseDataById($id = null)
	{
		if(!$id) {return false;}

		$sql = "SELECT program_phase.id,sequence
				FROM program_phase 
				WHERE id = ?";
		$query = $this->db->query($sql, array($id));
		return $query->row_array();
	}




	public function create($data)
	{
            
		$insert = $this->db->insert('program', $data);
		$program_id = $this->db->insert_id();
		return ($program_id) ? $program_id : false;
	}



	public function update($data,$id)
	{
		if($id) {	

            $this->db->where('id', $id);
			$update = $this->db->update('program', $data);
			return ($update == true) ? true : false;
		}

	}

	public function update_program_phase($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('program_phase', $data);
			return ($update == true) ? true : false;
		}
	}

	

	public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('program');

			$this->db->where('program_id', $id);
			$delete_phase = $this->db->delete('program_phase');

			return ($delete == true && $delete_phase) ? true : false;

		}
	}


	//---> Validate if the program is used in table Consultation
	public function checkIntegrity($id)
	{

		$num_rows = 0;
		
		$sql = "SELECT * FROM consultation WHERE program_id = ?";
		$query = $this->db->query($sql, array($id));
		$num_rows = $num_rows + $query->num_rows();

		$sql = "SELECT * FROM program_phase WHERE program_id = ?";
		$query = $this->db->query($sql, array($id));
		$num_rows = $num_rows + $query->num_rows();

		return $num_rows;

	}



}