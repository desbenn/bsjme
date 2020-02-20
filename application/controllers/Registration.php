<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Registration extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();
	}


    //--> It only redirects to the registration page page

	public function registration()
	{
		$data=array();
		$this->load->view('registration/index', $data);
	}
	
}

?>