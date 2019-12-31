<?php 

class Model_user extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	
	public function getUserData($id = null)
	{
		if($id) {
			$sql = "SELECT user.*,profile.name AS 'profile_name'
			FROM user 
			JOIN profile ON user.profile_id = profile.id
			WHERE user.id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT user.*,profile.name AS 'profile_name'
			FROM user 
			JOIN profile ON user.profile_id = profile.id
			ORDER BY name ASC";
		$query = $this->db->query($sql);
		return $query->result_array();
	}


	public function getActiveConsultant()
	{
		$sql = "SELECT * 
		FROM user 
		WHERE active = ? AND profile_id = 3
		ORDER BY name ASC";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}

	//--> Get the data of the table

	public function getConsultantData($id = null)
	{
		if($id) {
			$sql = "SELECT * FROM user WHERE id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT * FROM user";
		$query = $this->db->query($sql);
		return $query->result_array();
	}



	//--> Verify if the username already exists

	public function getUsername($username = null)
	{

		$sql = "SELECT * FROM user WHERE username = ?";
		$query = $this->db->query($sql, array($username));
		return $query->num_rows();

	}


	public function create($data)
	{
            
		$insert = $this->db->insert('user', $data);
		$user_id = $this->db->insert_id();
		return ($user_id) ? $user_id : false;
	}



	public function update($data,$id)
	{
		if($id) {	

            $this->db->where('id', $id);
			$update = $this->db->update('user', $data);
			return ($update == true) ? true : false;
		}

	}



	public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('user');

			return ($delete == true) ? true : false;

		}
	}

	public function countTotalUser()
	{
		$sql = "SELECT * FROM user";
		$query = $this->db->query($sql);
		return $query->num_rows();
	}


 


}