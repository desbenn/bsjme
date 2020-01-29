<?php

class Model_answer extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
    }
    

    public function retrieve_answer(){

    }

    public function create(){

    }

    public function update($data, $id){
        if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('answer', $data);
			return ($update == true) ? true : false;
		}
    }
}