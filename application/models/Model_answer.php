<?php

class Model_answer extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
    }
    

    public function retrieve_answer()
    {

    }

    public function create($data)
    {
      $insert = $this->db->insert('answer', $data);
      return ($insert) ? $insert : false;
    }

    public function update($data, $id)
    {
      if($data && $id) 
      {
			  $this->db->where('id', $id);
			  $update = $this->db->update('answer', $data);
			  return ($update == true) ? true : false;
		  }
    }

    public function ifExist($trn, $consultationId, $questionId)
    {
      $sql = "SELECT * FROM `answer` WHERE `question_id`='$questionId' AND `user_id`='$trn' AND `consultation_id`='$consultationId'";
      $query = $this->db->query($sql);
      if($query->row_array()!=null)
      {
        return true;
      }
      else
      {
        return false;
      }
    }
}