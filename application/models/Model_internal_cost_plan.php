<?php

class Model_internal_cost_plan extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
    }
    
    public function create($data)
	{
		if($data) {
			$insert = $this->db->insert('internal_cost_plan', $data);
			return ($insert == true) ? true : false;
		}
	}

	
}