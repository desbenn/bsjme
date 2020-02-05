<?php

class Model_answer extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
    }
    
    public function retrieveAnswer($id=null)
    {
      if($id)
      {
        $sql = "SELECT * FROM `answer` where id='$id'";
        $query = $this->db->query($sql, array($id));
        return $query->row_array();
      }
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

    public function ifExist($consultationId, $questionId)
    {
      $sql = "SELECT * FROM `answer` WHERE `question_id`='$questionId' AND `consultation_id`='$consultationId'";
      $query = $this->db->query($sql);
      $row = $query->row_array();
      if($row!=null)
      {
        return $row['id'];
      }
      else
      {
        return false;
      }
    }
}