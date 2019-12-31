<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Sector extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Sector';

	}


	//--> Redirects to the manage sector page

	public function index()
	{

		if(!in_array('viewSector', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$this->render_template('sector/index', $this->data);
	}


	//--> It checks if it gets the sector id and retreives
	//    the sector information from the sector model and
	//    returns the data into json format.
	//    This function is invoked from the view page.

	public function fetchSectorDataById($id)
	{
		if($id) {
			$data = $this->model_sector->getSectorData($id);
			echo json_encode($data);
		}

		return false;
	}


	//--> Fetches the sector value from the sector table
	//    This function is called from the datatable ajax function

	public function fetchSectorData()
	{
		$result = array('data' => array());

		$data = $this->model_sector->getSectorData();

		foreach ($data as $key => $value) {

			$buttons = '';

			if(in_array('updateSector', $this->permission)) {
				$buttons .= '<button type="button" class="btn btn-default" onclick="editFunc('.$value['id'].')" data-toggle="modal" data-target="#editModal"><i class="fa fa-pencil"></i></button>';
			}

			if(in_array('deleteSector', $this->permission)) {
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


	//--> It checks the sector form validation
	//    and if the validation is true (valid) then it inserts the data into the database
	//    and returns the json format operation messages

	public function create()
	{
		if(!in_array('createSector', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = array();

		$this->form_validation->set_rules('sector_name', 'Name', 'trim|required');



$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

        if ($this->form_validation->run() == TRUE) {
        	$data = array(
        		'name' => $this->input->post('sector_name'),
        		'active' => $this->input->post('active'),
        	);

        	$create = $this->model_sector->create($data);
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


	//--> It checks the sector form validation
	//    and if the validation is true (valid) then it updates the data into the database
	//    and returns the json format operation messages

	public function update($id)
	{

		if(!in_array('updateSector', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = '';
		$response = array();

		if($id) {
			$this->form_validation->set_rules('edit_sector_name', 'Name', 'trim|required');



$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

	        if ($this->form_validation->run() == TRUE) {
	        	$data = array(
	        		'name' => $this->input->post('edit_sector_name'),
	        		'active' => $this->input->post('edit_active'),
	        	);

	        	$update = $this->model_sector->update($data, $id);
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


	//--> It removes the sector information from the database
	//    and returns the json format operation messages

	public function remove()
	{
		if(!in_array('deleteSector', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$sector_id = $this->input->post('sector_id');

		$response = array();

		if($sector_id) {
			//---> Validate if the information is used in client table
			$total_client = $this->model_sector->checkIntegrity($sector_id);
			//---> If no client have this information, we can delete
            if ($total_client == 0) {
				$delete = $this->model_sector->remove($sector_id);
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