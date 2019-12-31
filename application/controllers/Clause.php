<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Clause extends Admin_Controller 
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Clause';

	}


	//--> Redirects to the manage clause page

	public function index()
	{

		if(!in_array('viewClause', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$this->render_template('clause/index', $this->data);	
	}	


	//-->  For creation of drop-down list 

	public function fetchActiveClause() 
	{
		$data = $this->model_clause->getActiveClause();
		echo json_encode($data);

	}




	//--> It checks if it gets the clause id and retrieves
	//    the clause information from the clause model and 
	//    returns the data into json format. 
	//    This function is invoked from the view page.
	
	public function fetchClauseDataById($id) 
	{
		if($id) {
			$data = $this->model_clause->getClauseData($id);
			echo json_encode($data);
		}

		return false;
	}

	
	//--> Fetches the clause value from the clause table 
	//    This function is called from the datatable ajax function
	
	public function fetchClauseData()
	{
		$result = array('data' => array());

		$data = $this->model_clause->getClauseData(); 

		foreach ($data as $key => $value) {

			$buttons = '';

			if(in_array('updateClause', $this->permission)) {
				$buttons .= '<button type="button" class="btn btn-default" onclick="editFunc('.$value['id'].')" data-toggle="modal" data-target="#editModal"><i class="fa fa-pencil"></i></button>';
			}

			if(in_array('deleteClause', $this->permission)) {
				$buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-target="#removeModal"><i class="fa fa-trash"></i></button>';
			}
				

			$active = ($value['active'] == 1) ? '<span class="label label-success">'.'Active'.'</span>' : '<span class="label label-warning">'.'Inactive'.'</span>';

			$result['data'][$key] = array(
				$value['name'],
				$value['code'],
				$value['standard_name'],				
				$active,
				$buttons
			);
		} // /foreach

		echo json_encode($result);
	}

	
	//--> It checks the clause form validation 
	//    and if the validation is true (valid) then it inserts the data into the database 
	//    and returns the json format operation messages
	
	public function create()
	{
		if(!in_array('createClause', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = array();

		$this->form_validation->set_rules('clause_name', 'Name', 'trim|required');
		$this->form_validation->set_rules('clause_code', 'Code', 'trim|required');
		$this->form_validation->set_rules('standard', 'Standard', 'trim|required');		
		$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

        if ($this->form_validation->run() == TRUE) {
        	$data = array(
        		'code' => $this->input->post('clause_code'),
        		'name' => $this->input->post('clause_name'),
        		'standard_id' => $this->input->post('standard'),        		
        		'active' => $this->input->post('active'),	
        	);

        	$create = $this->model_clause->create($data);
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

	
	//--> It checks the clause form validation 
	//    and if the validation is true (valid) then it updates the data into the database 
	//    and returns the json format operation messages
	
	public function update($id)
	{

		if(!in_array('updateClause', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = '';
		$response = array();

		if($id) {
			$this->form_validation->set_rules('edit_clause_name', 'Name', 'trim|required');			
			$this->form_validation->set_rules('edit_standard', 'Standard', 'trim|required');
			$this->form_validation->set_rules('edit_clause_code', 'Code', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

	        if ($this->form_validation->run() == TRUE) {
	        	$data = array(
	        		'code' => $this->input->post('edit_clause_code'),
	        		'name' => $this->input->post('edit_clause_name'),
	        		'standard_id' => $this->input->post('edit_standard'),	        			
	        		'active' => $this->input->post('edit_active'),	
	        	);

	        	$update = $this->model_clause->update($data, $id);
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

	
	//--> It removes the clause information from the database 
	//    and returns the json format operation messages
	
	public function remove()
	{
		if(!in_array('deleteClause', $this->permission)) {
			redirect('dashboard', 'refresh');}
		
		$clause_id = $this->input->post('clause_id');

        $response = '';
		$response = array();

		if($clause_id) {
			//---> Validate if the information is used in another table
			$total_used = $this->model_clause->checkIntegrity($clause_id);
			//---> If no table has this information, we can delete
            if ($total_used == 0) {        
				$delete = $this->model_clause->remove($clause_id);
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