<?php 

class Model_auth extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}


	//-->	This function checks if the username exists in the database

	public function check_username($username) 
	{
		if($username) {
			$sql = 'SELECT * FROM user WHERE username = ?';
			$query = $this->db->query($sql, array($username));
			$result = $query->num_rows();
			return ($result == 1) ? true : false;
		}

		return false;
	}


	//-->	This function checks if the username and password matches with the database

	public function login($username, $password) {
		if($username && $password) {
			$sql = "SELECT user.*
					FROM user 
					WHERE username = ?";
			$query = $this->db->query($sql, array($username));

			if($query->num_rows() == 1) {
				$result = $query->row_array();

				$hash_password = password_verify($password, $result['password']);
				if($hash_password === true) {
					return $result;	
				}
				else {
					return false;
				}

				
			} else {
				return false;
			}
		}
	}
}