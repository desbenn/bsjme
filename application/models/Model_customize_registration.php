<?php 

class Model_customize_registration extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	public function getCustomizationData()
	{
        $sql = "SELECT * FROM `registration_customization`";
        $query = $this->db->query($sql);
		return $query->result_array();
	}



	public function create($data)
	{
            
		$insert = $this->db->insert('registration_customization', $data);
		return ($insert) ? $insert : false;
	}

	public function update($data)
	{
        $update = $this->db->update('registration_customization', $data);
        return ($update == true) ? true : false;
	}



}