<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Activity extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Activity';

	}


	//--> Redirects to the manage activity page

	public function index()
	{

		if(!in_array('viewActivity', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$this->render_template('activity/index', $this->data);
	}


	//--> It checks if it gets the activity id and retrieves
	//    the activity information from the activity model and
	//    returns the data into json format.
	//    This function is invoked from the view page.

	public function fetchActivityDataById($id)
	{
		if($id) {
			$data = $this->model_activity->getActivityData($id);
			echo json_encode($data);
		}

		return false;
	}


	//--> Fetches the activity value from the activity table
	//    This function is called from the datatable ajax function

	public function fetchActivityData()
	{
		$result = array('data' => array());

		$data = $this->model_activity->getActivityData();

		foreach ($data as $key => $value) {

			$buttons = '';

			if(in_array('updateActivity', $this->permission)) {
				$buttons .= '<button type="button" class="btn btn-default" onclick="editFunc('.$value['id'].')" data-toggle="modal" data-target="#editModal"><i class="fa fa-pencil"></i></button>';
			}

			if(in_array('deleteActivity', $this->permission)) {
				$buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-target="#removeModal"><i class="fa fa-trash"></i></button>';
			}


			$active = ($value['active'] == 1) ? '<span class="label label-success">Active</span>' : '<span class="label label-warning">Inactive</span>';

			$result['data'][$key] = array(
				$value['name'],
				$active,
				$buttons
			);
		} // /foreach

		echo json_encode($result);
	}


	//--> It checks the activity form validation
	//    and if the validation is true (valid) then it inserts the data into the database
	//    and returns the json format operation messages

	public function create()
	{
		if(!in_array('createActivity', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = array();

		$this->form_validation->set_rules('activity_name', 'Name', 'trim|required');
		$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

        if ($this->form_validation->run() == TRUE) {
        	$data = array(
        		'name' => $this->input->post('activity_name'),
        		'active' => $this->input->post('active'),
        	);

        	$create = $this->model_activity->create($data);
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


	//--> It checks the activity form validation
	//    and if the validation is true (valid) then it updates the data into the database
	//    and returns the json format operation messages

	public function update($id)
	{

		if(!in_array('updateActivity', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = '';
		$response = array();

		if($id) {
			$this->form_validation->set_rules('edit_activity_name', 'Name', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

	        if ($this->form_validation->run() == TRUE) {
	        	$data = array(
	        		'name' => $this->input->post('edit_activity_name'),
	        		'active' => $this->input->post('edit_active'),
	        	);

	        	$update = $this->model_activity->update($data, $id);
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


	//--> It removes the activity information from the database
	//    and returns the json format operation messages

	public function remove()
	{
		if(!in_array('deleteActivity', $this->permission)) {
			redirect('dashboard', 'refresh');}

		$activity_id = $this->input->post('activity_id');

        $response = '';
		$response = array();

		if($activity_id) {
			//---> Validate if the information is used in post table
			$total_post = $this->model_activity->checkIntegrity($activity_id);
			//---> If no post have this information, we can delete
            if ($total_post == 0) {
				$delete = $this->model_activity->remove($activity_id);
				if($delete == true) {
					$response['success'] = true;
					$response['messages'] = 'Successfully deleted';}
				else {
					$response['success'] = false;
					$response['messages'] = 'Error in the database while deleting the information';}
				}

			else {
				//---> There is at least one consultation having this information
				$response['success'] = false;
				$response['messages'] = 'At least one post uses this information.  You cannot delete.';}

		}
		else {
			$response['success'] = false;
			$response['messages'] = 'Refresh the page again';}

		echo json_encode($response);
	}

}