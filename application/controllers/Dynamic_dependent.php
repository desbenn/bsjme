<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Dynamic_dependent extends Admin_Controller 
{
	public function __construct()
	{
		parent::__construct();
	}


 function fetch_clause()
 {
  if($this->input->post('standard_id'))
    {
     echo $this->model_dynamic_dependent->fetch_clause($this->input->post('standard_id'));
    }
 }

 function fetch_sub_clause()
 {
  if($this->input->post('clause_id'))
    {
     echo $this->model_dynamic_dependent->fetch_sub_clause($this->input->post('clause_id'));
    }
 }

 function fetch_program()
 {
  if($this->input->post('standard_id'))
  {
   echo $this->model_dynamic_dependent->fetch_program($this->input->post('program_id'));
  }
 }

 function fetch_phase()
 {
  if($this->input->post('program_id'))
    {
     echo $this->model_dynamic_dependent->fetch_phase($this->input->post('program_id'));
    }
  }



  function fetch_status()
 {
  if($this->input->post('phase_id'))
    {
     echo $this->model_dynamic_dependent->fetch_status($this->input->post('phase_id'));
    }  
  }



}

?>
