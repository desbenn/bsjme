<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Registration extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();
	}


    //--> It only redirects to the registration page page

	public function register()
	{
		$data=array();
		$data['county'] = $this->model_county->getActiveCounty();
		$data['parish'] = $this->model_parish->getActiveParish();
		$data['requirement']= $this->model_requirement->getRequirementData();
		var_dump($data);
		$this->load->view('registration/index', $data);
	}
	
}

?>