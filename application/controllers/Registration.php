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
		$this->form_validation->set_rules('trn', 'TRN', 'trim|required');
		$this->form_validation->set_rules('companyName', 'Company Name', 'trim|required');
		$this->form_validation->set_rules('clientName', 'Client Name', 'trim|required');
		$this->form_validation->set_rules('companyCounty', 'County', 'trim|required');
		$this->form_validation->set_rules('companyParish', 'Parish', 'trim|required');
		$this->form_validation->set_rules('companyCity', 'City', 'trim|required');
		$this->form_validation->set_rules('companyNumber', 'Contact Number', 'trim|required');
		$this->form_validation->set_rules('companyEmail', 'Email', 'trim|required');
		$this->form_validation->set_error_delimiters('<p class="alert alert-warning">','</p>');

		if($this->form_validation->run() == TRUE)
		{
			$data=array(
				'trn' => $this->input->post('trn'),
				'company_name' => $this->input->post('companyName'),
				'client_name' => $this->input->post('clientName'),
				'contact_name' => $this->input->post('clientName'),
				'address' => $this->input->post('companyAddress'),
				'county_id' => $this->input->post('companyCounty'),
				'parish_id' => $this->input->post('companyParish'),
				'city_id' => $this->input->post('companyCity'),
				'phone' => $this->input->post('companyNumber'),
				'email' => $this->input->post('companyEmail'),
				'website' => $this->input->post('companyWebsite'),
				'activity_id' => 3,
				'directory' => $this->input->post('trn'),
				'attempt' => 0
			);
			
		}
		
		$data=array();
		$data['county'] = $this->model_county->getActiveCounty();
		$data['parish'] = $this->model_parish->getActiveParish();
		$data['requirement']= $this->model_requirement->getRequirementData();
		$data['standard']= $this->model_standard->getActiveStandard();
		$this->load->view('registration/index', $data);
	}
	
}

?>