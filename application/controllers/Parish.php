<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Parish extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Parish';
	}


    //--> Redirects to the manage parish page

	public function index()
	{
		if(!in_array('viewParish', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$this->render_template('parish/index', $this->data);
	}


	//--> It retrieves the specific information from the key
	//    and returns the data in json format

	public function fetchParishDataById($id)
	{
		if($id) {
			$data = $this->model_parish->getParishData($id);
			echo json_encode($data);
		}
	}



	//--> For creation of drop-down list

	public function fetchActiveParish()
	{
		$data = $this->model_parish->getActiveParish();
		echo json_encode($data);

	}


	//--> It retrieves all the parish data from the database
	//    This function is called from the datatable ajax function
	//    The data is return based on the json format.

	public function fetchParishData()
	{
		$result = array('data' => array());

		$data = $this->model_parish->getParishData();

		foreach ($data as $key => $value) {

			$buttons = '';

			if(in_array('updateParish', $this->permission)) {
				$buttons = '<button type="button" class="btn btn-default" onclick="editFunc('.$value['id'].')" data-toggle="modal" data-target="#editModal"><i class="fa fa-pencil"></i></button>';
			}

			if(in_array('deleteParish', $this->permission)) {
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

	//--> If the validation is not true (not valid), then it provides the validation error on the json format
    //    If the validation for each input is valid then it creates the data into the database and
    //    returns an appropriate message in the json format.

	public function create()
	{
		if(!in_array('createParish', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = array();

		$this->form_validation->set_rules('parish_name', 'Name', 'trim|required');
		$this->form_validation->set_rules('parish_code', 'Code', 'trim|required');
		$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

        if ($this->form_validation->run() == TRUE) {
        	$data = array(
        		'code' => $this->input->post('parish_code'),
        		'name' => $this->input->post('parish_name'),
        		'active' => $this->input->post('active'),
        	);

        	$create = $this->model_parish->create($data);
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


	//--> If the validation is not true (not valid), then it provides the validation error on the json format
    //    If the validation for each input is valid then it updates the data into the database and
    //    returns an appropriate message in the json format.

	public function update($id)
	{
		if(!in_array('updateParish', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = array();

		if($id) {
			$this->form_validation->set_rules('edit_parish_name', 'Name', 'trim|required');
			$this->form_validation->set_rules('edit_parish_code', 'Code', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

	        if ($this->form_validation->run() == TRUE) {
	        	$data = array(
	        		'code' => $this->input->post('edit_parish_code'),
	        		'name' => $this->input->post('edit_parish_name'),
	        		'active' => $this->input->post('edit_active'),
	        	);

	        	$update = $this->model_parish->update($data, $id);
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


	//--> If checks if the parish id is provided on the function, if not then an appropriate message
	//    is return on the json format
    //    If the validation is true (valid) then it removes the data into the database and returns an appropriate
    //    message in the json format.

	public function remove()
	{
		if(!in_array('deleteParish', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$parish_id = $this->input->post('parish_id');

		$response = '';
		$response = array();

		if($parish_id) {
			//---> Validate if the information is used in client table
			$total_client = $this->model_parish->checkIntegrity($parish_id);
			//---> If no client have this information, we can delete
            if ($total_client == 0) {
				$delete = $this->model_parish->remove($parish_id);
				if($delete == true) {
					$response['success'] = true;
					$response['messages'] = 'Successfully deleted';}
				else {
					$response['success'] = false;
					$response['messages'] = 'Error in the database while deleting the information';}
				}

			else {
				//---> There is at least one client having this information
				$response['success'] = false;
				$response['messages'] = 'At least one client uses this information.  You cannot delete.';}

		}
		else {
			$response['success'] = false;
			$response['messages'] = 'Refresh the page again';}

		echo json_encode($response);
	}

}