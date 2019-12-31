<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Support_type extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();
		$this->data['page_title'] = 'Support Type';
	}


	//-->  Redirects to the manage support_type page

	public function index()
	{

		if(!in_array('viewSupportType', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$this->render_template('support_type/index', $this->data);
	}

	//-->  For creation of drop-down list

	public function fetchActiveSupportType()
	{
		$data = $this->model_support_type->getActiveSupportType();
		echo json_encode($data);

	}


	//--> It checks if it gets the support_type id and retreives
	//    the support_type information from the support_type model and
	//    returns the data into json format.
	//    This function is invoked from the view page.

	public function fetchSupportTypeDataById($id)
	{
		if($id) {
			$data = $this->model_support_type->getSupportTypeData($id);
			echo json_encode($data);
		}

		return false;
	}


	//-->  Fetches the support_type value from the support_type table
	// this function is called from the datatable ajax function

	public function fetchSupportTypeData()
	{
		$result = array('data' => array());

		$data = $this->model_support_type->getSupportTypeData();

		foreach ($data as $key => $value) {

			$buttons = '';

			if(in_array('updateSupportType', $this->permission)) {
				$buttons .= '<button type="button" class="btn btn-default" onclick="editFunc('.$value['id'].')" data-toggle="modal" data-target="#editModal"><i class="fa fa-pencil"></i></button>';
			}

			if(in_array('deleteSupportType', $this->permission)) {
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


	public function create()
	{
		if(!in_array('createSupportType', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = array();

		$this->form_validation->set_rules('support_type_name', 'Name', 'trim|required');
		$this->form_validation->set_rules('support_type_code', 'Code', 'trim|required');
		$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

        if ($this->form_validation->run() == TRUE) {
        	$data = array(
        		'code' => $this->input->post('support_type_code'),
        		'name' => $this->input->post('support_type_name'),
        		'active' => $this->input->post('active'),
        	);

        	$create = $this->model_support_type->create($data);
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


	//-->  Checks the support_type form validation
	//     and if the validation is successfully then it updates the data into the database
	//     and returns the json format operation messages

	public function update($id)
	{

		if(!in_array('updateSupportType', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = array();

		if($id) {
			$this->form_validation->set_rules('edit_support_type_name', 'Name', 'trim|required');
			$this->form_validation->set_rules('edit_support_type_code', 'Code', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

	        if ($this->form_validation->run() == TRUE) {
	        	$data = array(
	        		'code' => $this->input->post('edit_support_type_code'),
	        		'name' => $this->input->post('edit_support_type_name'),
	        		'active' => $this->input->post('edit_active'),
	        	);

	        	$update = $this->model_support_type->update($data, $id);
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


	//-->  Removes the support_type information from the database
	//     and returns the json format operation messages

	public function remove()
	{
		if(!in_array('deleteSupportType', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$support_type_id = $this->input->post('support_type_id');

		$response = '';
		$response = array();

		if($support_type_id) {
			//---> Validate if the information is used in other table
			$total_used = $this->model_support_type->checkIntegrity($support_type_id);
			//---> If not used, we can delete
            if ($total_used == 0) {
				$delete = $this->model_support_type->remove($support_type_id);
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
				$response['messages'] = 'At least one support uses this information.  You cannot delete.';}

		}
		else {
			$response['success'] = false;
			$response['messages'] = 'Refresh the page again';}

		echo json_encode($response);
	}

}