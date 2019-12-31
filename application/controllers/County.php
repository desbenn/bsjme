<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class County extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'County';

	}


    //--> Redirects to the manage county page

	public function index()
	{
		if(!in_array('viewCounty', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$this->render_template('county/index', $this->data);
	}


	//--> It retrieve the specific county information via a county id
	//    and returns the data in json format

	public function fetchCountyDataById($id)
	{
		if($id) {
			$data = $this->model_county->getCountyData($id);
			echo json_encode($data);
		}
	}


	//--> It retrieves all the county data from the database
	//    This function is called from the datatable ajax function
	//    The data is return based on the json format.

	public function fetchCountyData()
	{
		$result = array('data' => array());

		$data = $this->model_county->getCountyData();

		foreach ($data as $key => $value) {

			$buttons = '';

			if(in_array('updateCounty', $this->permission)) {
				$buttons = '<button type="button" class="btn btn-default" onclick="editFunc('.$value['id'].')" data-toggle="modal" data-target="#editModal"><i class="fa fa-pencil"></i></button>';}

			if(in_array('deleteCounty', $this->permission)) {
				$buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-target="#removeModal"><i class="fa fa-trash"></i></button>';}

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
		if(!in_array('createCounty', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = array();

		$this->form_validation->set_rules('county_name', 'Name', 'trim|required');
		$this->form_validation->set_rules('county_code', 'Code', 'trim|required');
		$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

        if ($this->form_validation->run() == TRUE) {
        	$data = array(
        		'code' => $this->input->post('county_code'),
        		'name' => $this->input->post('county_name'),
        		'active' => $this->input->post('active'),
        	);

        	$create = $this->model_county->create($data);
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
		if(!in_array('updateCounty', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = array();

		if($id) {
			$this->form_validation->set_rules('edit_county_name', 'Name', 'trim|required');
			$this->form_validation->set_rules('edit_county_code', 'Code', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

	        if ($this->form_validation->run() == TRUE) {
	        	$data = array(
	        		'code' => $this->input->post('edit_county_code'),
	        		'name' => $this->input->post('edit_county_name'),
	        		'active' => $this->input->post('edit_active'),
	        	);

	        	$update = $this->model_county->update($data, $id);
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


	//--> If checks if the county id is provided on the function, if not then an appropriate message
	//    is return on the json format
    //    If the validation is true (valid) then it removes the data into the database and returns an appropriate
    //    message in the json format.

	public function remove()
	{
		if(!in_array('deleteCounty', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$county_id = $this->input->post('county_id');

		$response = '';
		$response = array();

		if($county_id) {
			//---> Validate if the information is used in client/consultation table
			$total_rows = $this->model_county->checkIntegrity($county_id);
			//---> If no client/consultation have this information, we can delete
            if ($total_rows == 0) {
				$delete = $this->model_county->remove($county_id);
				if($delete == true) {
					$response['success'] = true;
					$response['messages'] = 'Successfully deleted';}
				else {
					$response['success'] = false;
					$response['messages'] = 'Error in the database while deleting the information';}
				}

			else {
				//---> There is at least one client or consultation having this information
				$response['success'] = false;
				$response['messages'] = 'At least one client uses this information.  You cannot delete.';}

		}
		else {
			$response['success'] = false;
			$response['messages'] = 'Refresh the page again';}

		echo json_encode($response);
	}

}