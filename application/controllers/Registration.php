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
			$client_data=array(
				'trn' => $this->input->post('trn'),
				'company_name' => $this->input->post('companyName'),
				'client_name' => $this->input->post('clientName'),
				'contact_name' => $this->input->post('clientName'),
				'address' => $this->input->post('companyAddress'),
				'county_id' => $this->input->post('companyCounty'),
				'parish_id' => $this->input->post('companyParish'),
				'city_id' => $this->input->post('companyCity'),
				'objective' => $this->input->post('objective'),
				'phone' => $this->input->post('companyNumber'),
				'email' => $this->input->post('companyEmail'),
				'target' => $this->input->post('target'),
				'website' => $this->input->post('companyWebsite'),
				'activity_id' => 3,
				'directory' => $this->input->post('trn'),
				'attempt' => 1
			);
						
			$created_client = $this->model_client->create($client_data);
			if($created_client==false)
			{
				$msg_error = 'Error occurred';
				$this->session->set_flashdata('error', $msg_error);
				//page to be redirected to 
				redirect('registration/register');
			}
			else
			{
				$response_array=[];
				$question_array=[];
				$client_requirement_data=[];
				$successful;
				foreach($_POST as $key => $value)
				{
					if(is_numeric($key))
					{
						$client_requirement_data=array(
							'client_id' => $created_client,
							'requirement_id' => $key,
							'answer' => $value
						);	
						if($this->model_client->addClientRequirement($client_requirement_data))
						{
							$successful=true;
						}
						else
						{
							$successful=false;
							$msg_error = 'Error occurred';
							$this->session->set_flashdata('error', $msg_error);
							//page to be redirected to 
							redirect('registration/register');
						}
					}								
				}
				if($successful==true) //Nothing has gone wrong so time to save the document
				{
					//---> Create the directory for deposit of documents-->
					$path = "./upload/documents/".$this->input->post('trn');
					//---> Create the folder if it does not exists
					if(!is_dir($path))  
					{
						mkdir($path,0755,TRUE);
					}
					$config['upload_path'] = $path;
					$config['allowed_types'] = 'gif|jpg|png|pdf|xls|xlsx|docx|doc|pptx';
					$config['max_size'] = '4000';

					$this->load->library('upload', $config);
					if(!$this->upload->do_upload('committmentLetter'))
					{
						
					}
					else
					{
						//---> Create the document in the table document
						$data = array(
							'client_id' => $created_client,
							'doc_size' => $this->upload->data('file_size'),
							'doc_type' => $this->upload->data('file_type'),
							'doc_name' => $this->upload->data('file_name'),
							'document_type_id' => 6,
							'document_class_id' => 1,
							'updated_by' => $created_client
						);
						$create = $this->model_client->createDocument($data);
						if($create == true) 
						{
							//--->  Upload the document
							$data = array('upload_data' => $this->upload->data());
							redirect('registration/successful', 'refresh');
						}
						else 
						{
							$msg_error = 'Error occurred';
							$this->session->set_flashdata('error', $msg_error);
							redirect('registration/register');
						}
					}
				}
				else// error occured saving requirement question. not saving the document
				{
					$msg_error = 'Error occurred';
					$this->session->set_flashdata('error', $msg_error);
					//page to be redirected to					
					redirect('registration/register');
				}
			}				 
		}
		
		$data=array();
		$data['county'] = $this->model_county->getActiveCounty();
		$data['parish'] = $this->model_parish->getActiveParish();
		$data['city'] = $this->model_city->getActiveCity();
		$data['requirement']= $this->model_requirement->getRequirementData();
		$data['program']= $this->model_program->getActiveProgram();
		$this->load->view('registration/index', $data);
	}

	 public function successful()
	 {
		 $data=array();
		 $data['message'] = $this->model_customize_registration->getCustomizationData();
		 $this->load->view('registration/successful', $data);
	 }

	 public function customization()
	 {
		$this->data['page_title'] = 'Registration Customization';   
		$this->form_validation->set_rules('title', 'Title', 'trim|required');
		$this->form_validation->set_rules('body', 'Body', 'trim|required');
		$this->form_validation->set_error_delimiters('<p class="alert alert-warning">','</p>');
		
		if($this->form_validation->run() == TRUE)
		{
			$data = array(
				'title' => $this->input->post('title'), 
				'body' => $this->input->post('body')
			);
			$success;
			if(empty($this->model_customize_registration->getCustomizationData()))
			{
				$success=$this->model_customize_registration->create($data);
			}
			else
			{
				$success=$this->model_customize_registration->update($data);
			}
			if($success == true)
            {
                $this->session->set_flashdata('success', 'Successfully Updated!');
                redirect('registration/customization', 'refresh');
            }
            else
            {
                $this->session->set_flashdata('errors', 'Error occurred!!');
                redirect('registration/customization', 'refresh');
            }
		}

		$this->data['customization'] = $this->model_customize_registration->getCustomizationData();
		$this->render_template('registration/edit', $this->data);
	 }
	
}

?>