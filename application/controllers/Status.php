<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Status extends Admin_Controller 
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Status';

	}


	//--> Redirects to the manage status page

	public function index()
	{

		if(!in_array('viewStatus', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$this->render_template('status/index', $this->data);	
	}	


	//-->  For creation of drop-down list 

	public function fetchActiveStatus() 
	{
		$data = $this->model_status->getActiveStatus();
		echo json_encode($data);

	}




	//--> It checks if it gets the status id and retrieves
	//    the status information from the status model and 
	//    returns the data into json format. 
	//    This function is invoked from the view page.
	
	public function fetchStatusDataById($id) 
	{
		if($id) {
			$data = $this->model_status->getStatusData($id);
			echo json_encode($data);
		}

		return false;
	}

	
	//--> Fetches the status value from the status table 
	//    This function is called from the datatable ajax function
	
	public function fetchStatusData()
	{
		$result = array('data' => array());

		$data = $this->model_status->getStatusData(); 

		foreach ($data as $key => $value) {

			$buttons = '';

			if(in_array('updateStatus', $this->permission)) {
				$buttons .= '<button type="button" class="btn btn-default" onclick="editFunc('.$value['id'].')" data-toggle="modal" data-target="#editModal"><i class="fa fa-pencil"></i></button>';
				$name='  <a data-target="#editModal" onclick="editFunc('.$value['id'].')" data-toggle="modal" href="#editModal">'.$value['status_name'].'</a>';
			}

			if(in_array('deleteStatus', $this->permission)) {
				$buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-target="#removeModal"><i class="fa fa-trash"></i></button>';
			}
				

			$active = ($value['active'] == 1) ? '<span class="label label-success">'.'Active'.'</span>' : '<span class="label label-warning">'.'Inactive'.'</span>';

			$result['data'][$key] = array(
				$value['phase_code'],
				$value['code'],
				$name,				
				$active,
				$buttons
			);
		} // /foreach

		echo json_encode($result);
	}

	
	//--> It checks the status form validation 
	//    and if the validation is true (valid) then it inserts the data into the database 
	//    and returns the json format operation messages
	
	public function create()
	{
		if(!in_array('createStatus', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = array();

		$this->form_validation->set_rules('status_name', 'Name', 'trim|required');
		$this->form_validation->set_rules('status_code', 'Code', 'trim|required');
		$this->form_validation->set_rules('phase', 'Phase', 'trim|required');		
		$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

        if ($this->form_validation->run() == TRUE) {
        	$data = array(
        		'code' => $this->input->post('status_code'),
        		'name' => $this->input->post('status_name'),
        		'phase_id' => $this->input->post('phase'),        		
        		'active' => $this->input->post('active'),	
        	);

        	$create = $this->model_status->create($data);
        	if($create == true) {
        		$response['success'] = true;
        		$response['messages'] ='Successfully created';
        	}
        	else {
        		$response['success'] = false;
        		$response['messages'] = 'Error in the database while creating the information';			
        	}
        }
        else {
        	$response['success'] = false;
        	foreach ($_POST as $key => $value) {
        		$response['messages'][$key] = form_error($key);
        	}
        }

        echo json_encode($response);
	}

	
	//--> It checks the status form validation 
	//    and if the validation is true (valid) then it updates the data into the database 
	//    and returns the json format operation messages
	
	public function update($id)
	{

		if(!in_array('updateStatus', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = '';
		$response = array();

		if($id) {
			$this->form_validation->set_rules('edit_status_name', 'Name', 'trim|required');			
			$this->form_validation->set_rules('edit_phase', 'Phase', 'trim|required');
			$this->form_validation->set_rules('edit_status_code', 'Code', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

	        if ($this->form_validation->run() == TRUE) {
	        	$data = array(
	        		'code' => $this->input->post('edit_status_code'),
	        		'name' => $this->input->post('edit_status_name'),
	        		'phase_id' => $this->input->post('edit_phase'),	        			
	        		'active' => $this->input->post('edit_active'),	
	        	);

	        	$update = $this->model_status->update($data, $id);
	        	if($update == true) {
	        		$response['success'] = true;
	        		$response['messages'] = 'Successfully updated';
	        	}
	        	else {
	        		$response['success'] = false;
	        		$response['messages'] = 'Error in the database while updating the information';			
	        	}
	        }
	        else {
	        	$response['success'] = false;
	        	foreach ($_POST as $key => $value) {
	        		$response['messages'][$key] = form_error($key);
	        	}
	        }
		}
		else {
			$response['success'] = false;
    		$response['messages'] = 'Error please refresh the page again';
		}

		echo json_encode($response);
	}

	
	//--> It removes the status information from the database 
	//    and returns the json format operation messages
	
	public function remove()
	{
		if(!in_array('deleteStatus', $this->permission)) {
			redirect('dashboard', 'refresh');}
		
		$status_id = $this->input->post('status_id');

        $response = '';
		$response = array();

		if($status_id) {
			//---> Validate if the information is used in another table
			$total_used = $this->model_status->checkIntegrity($status_id);
			//---> If no table has this information, we can delete
            if ($total_used == 0) {        
				$delete = $this->model_status->remove($status_id);
				if($delete == true) {
					$response['success'] = true;
					$response['messages'] = 'Successfully deleted';}
				else {
					$response['success'] = false;
					$response['messages'] ='Error in the database while deleting the information';}
				}

			else {
				//---> There is at least one license having this information
				$response['success'] = false;
				$response['messages'] = 'At least one item uses this information.  You cannot delete.';}

		}
		else {
			$response['success'] = false;
			$response['messages'] = 'Refresh the page again';}

		echo json_encode($response);
	}

}