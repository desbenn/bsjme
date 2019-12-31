<?php

class Model_profile extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	public function getProfileData($id = null)
	{
		if($id) {
			$sql = "SELECT * FROM profile WHERE id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT * FROM profile WHERE id != ?";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}

	public function create($data = '')
	{
		$create = $this->db->insert('profile', $data);
		return ($create == true) ? true : false;
	}

	public function update($data, $id)
	{
		$this->db->where('id', $id);
		$update = $this->db->update('profile', $data);
		return ($update == true) ? true : false;
	}

	public function remove($id)
	{
		$this->db->where('id', $id);
		$delete = $this->db->delete('profile');
		return ($delete == true) ? true : false;
	}


	//---> Validate if the profile is used by one user
	public function checkIntegrity($id)
	{
		$sql = "SELECT * FROM user WHERE profile_id = ?";
		$query = $this->db->query($sql, array($id));
		return $query->num_rows();

	}

	public function getUserProfileByUserId($user_id)
	{
		$sql = "SELECT * FROM user
		JOIN profile ON profile.id = user.profile_id
		WHERE user.id = ?";
		$query = $this->db->query($sql, array($user_id));
		$result = $query->row_array();

		return $result;

	}
}