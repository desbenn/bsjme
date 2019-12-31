<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Standard extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();
		$this->data['page_title'] = 'Standard';
	}


	//-->  Redirects to the manage standard page

	public function index()
	{

		if(!in_array('viewStandard', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$this->render_template('standard/index', $this->data);
	}


	
	//-->  For creation of drop-down list 

	public function fetchActiveStandard() 
	{
		$data = $this->model_standard->getActiveStandard();
		echo json_encode($data);

	}


	//--> It checks if it gets the standard id and retreives
	//    the standard information from the standard model and
	//    returns the data into json format.
	//    This function is invoked from the view page.

	public function fetchStandardDataById($id)
	{
		if($id) {
			$data = $this->model_standard->getStandardData($id);
			echo json_encode($data);
		}

		return false;
	}


	//-->  Fetches the standard value from the standard table
	// this function is called from the datatable ajax function

	public function fetchStandardData()
	{
		$result = array('data' => array());

		$data = $this->model_standard->getStandardData();

		foreach ($data as $key => $value) {

			$buttons = '';

			if(in_array('updateStandard', $this->permission)) {
				$buttons .= '<button type="button" class="btn btn-default" onclick="editFunc('.$value['id'].')" data-toggle="modal" data-target="#editModal"><i class="fa fa-pencil"></i></button>';
			}

			if(in_array('deleteStandard', $this->permission)) {
				$buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-target="#removeModal"><i class="fa fa-trash"></i></button>';
			}


			$active = ($value['active'] == 1) ? '<span class="label label-success">Active</span>' : '<span class="label label-warning">Inactive</span>';

			$result['data'][$key] = array(
				$value['name'],
				$value['code'],
				$active,
				$buttons
			);
		} // /foreach

		echo json_encode($result);
	}


	//---> Checks the standard form validation
	//     and if the validation is successfully then it inserts the data into the database
	//     and returns the json format operation messages

	public function create()
	{
		if(!in_array('createStandard', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = array();

		$this->form_validation->set_rules('standard_name', 'Name', 'trim|required');
		$this->form_validation->set_rules('standard_code', 'Code', 'trim|required');
		$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

        if ($this->form_validation->run() == TRUE) {
        	$data = array(
        		'code' => $this->input->post('standard_code'),
        		'name' => $this->input->post('standard_name'),
        		'active' => $this->input->post('active'),
        	);

        	$create = $this->model_standard->create($data);
        	if($create == true) {
        		$response['success'] = true;
        		$response['messages'] = 'Successfully created';
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


	//-->  Checks the standard form validation
	//     and if the validation is successfully then it updates the data into the database
	//     and returns the json format operation messages

	public function update($id)
	{

		if(!in_array('updateStandard', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = array();

		if($id) {
			$this->form_validation->set_rules('edit_standard_name', 'Name', 'trim|required');
			$this->form_validation->set_rules('edit_standard_code', 'Code', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

	        if ($this->form_validation->run() == TRUE) {
	        	$data = array(
	        		'code' => $this->input->post('edit_standard_code'),
	        		'name' => $this->input->post('edit_standard_name'),
	        		'active' => $this->input->post('edit_active'),
	        	);

	        	$update = $this->model_standard->update($data, $id);
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


	//-->  Removes the standard information from the database
	//     and returns the json format operation messages

	public function remove()
	{
		if(!in_array('deleteStandard', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$standard_id = $this->input->post('standard_id');

		$response = '';
		$response = array();

		if($standard_id) {
			//---> Validate if the information is used in other table
			$total_used = $this->model_standard->checkIntegrity($standard_id);
			//---> If not used, we can delete
            if ($total_used == 0) {
				$delete = $this->model_standard->remove($standard_id);
				if($delete == true) {
					$response['success'] = true;
					$response['messages'] = 'Successfully deleted';}
				else {
					$response['success'] = false;
					$response['messages'] = 'Error in the database while deleting the information';}
				}

			else {
				//---> There is at least one table having this information
				$response['success'] = false;
				$response['messages'] = 'At least one consultation uses this information.  You cannot delete.';}

		}
		else {
			$response['success'] = false;
			$response['messages'] = 'Refresh the page again';}

		echo json_encode($response);
	}

}