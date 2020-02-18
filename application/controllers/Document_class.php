<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Document_class extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();
		$this->data['page_title'] = 'Document Class';
	}


	//-->  Redirects to the manage document_class page

	public function index()
	{

		if(!in_array('viewDocumentClass', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$this->render_template('document_class/index', $this->data);
	}

	//-->  For creation of drop-down list

	public function fetchActiveDocumentClass()
	{
		$data = $this->model_document_class->getActiveDocumentClass();
		echo json_encode($data);

	}


	//--> It checks if it gets the document_class id and retreives
	//    the document_class information from the document_class model and
	//    returns the data into json format.
	//    This function is invoked from the view page.

	public function fetchDocumentClassDataById($id)
	{
		if($id) {
			$data = $this->model_document_class->getDocumentClassData($id);
			echo json_encode($data);
		}

		return false;
	}


	//-->  Fetches the document_class value from the document_class table
	// this function is called from the datatable ajax function

	public function fetchDocumentClassData()
	{
		$result = array('data' => array());

		$data = $this->model_document_class->getDocumentClassData();

		foreach ($data as $key => $value) {

			$buttons = '';

			if(in_array('updateDocumentClass', $this->permission)) {
				$buttons .= '<button type="button" class="btn btn-default" onclick="editFunc('.$value['id'].')" data-toggle="modal" data-target="#editModal"><i class="fa fa-pencil"></i></button>';
				$name='  <a data-target="#editModal" onclick="editFunc('.$value['id'].')" data-toggle="modal" href="#editModal">'.$value['name'].'</a>';
			}

			if(in_array('deleteDocumentClass', $this->permission)) {
				$buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-target="#removeModal"><i class="fa fa-trash"></i></button>';
			}


			$active = ($value['active'] == 1) ? '<span class="label label-success">Active</span>' : '<span class="label label-warning">Inactive</span>';

			$result['data'][$key] = array(
				$name,
				$value['code'],
				$active,
				$buttons
			);
		} // /foreach

		echo json_encode($result);
	}


	//---> Checks the document_class form validation
	//     and if the validation is successfully then it inserts the data into the database
	//     and returns the json format operation messages

	public function create()
	{
		if(!in_array('createDocumentClass', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = array();

		$this->form_validation->set_rules('document_class_name', 'Name', 'trim|required');
		$this->form_validation->set_rules('document_class_code', 'Code', 'trim|required');
		$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

        if ($this->form_validation->run() == TRUE) {
        	$data = array(
        		'code' => $this->input->post('document_class_code'),
        		'name' => $this->input->post('document_class_name'),
        		'active' => $this->input->post('active'),
        	);

        	$create = $this->model_document_class->create($data);
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


	//-->  Checks the document_class form validation
	//     and if the validation is successfully then it updates the data into the database
	//     and returns the json format operation messages

	public function update($id)
	{

		if(!in_array('updateDocumentClass', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = array();

		if($id) {
			$this->form_validation->set_rules('edit_document_class_name', 'Name', 'trim|required');
			$this->form_validation->set_rules('edit_document_class_code', 'Code', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

	        if ($this->form_validation->run() == TRUE) {
	        	$data = array(
	        		'code' => $this->input->post('edit_document_class_code'),
	        		'name' => $this->input->post('edit_document_class_name'),
	        		'active' => $this->input->post('edit_active'),
	        	);

	        	$update = $this->model_document_class->update($data, $id);
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


	//-->  Removes the document_class information from the database
	//     and returns the json format operation messages

	public function remove()
	{
		if(!in_array('deleteDocumentClass', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$document_class_id = $this->input->post('document_class_id');

		$response = '';
		$response = array();

		if($document_class_id) {
			//---> Validate if the information is used in other table
			$total_used = $this->model_document_class->checkIntegrity($document_class_id);
			//---> If not used, we can delete
            if ($total_used == 0) {
				$delete = $this->model_document_class->remove($document_class_id);
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
				$response['messages'] = 'At least one document uses this information.  You cannot delete.';}

		}
		else {
			$response['success'] = false;
			$response['messages'] = 'Refresh the page again';}

		echo json_encode($response);
	}

}