<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Billing extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Billing Item';
	}


	public function index()
	{
		if(!in_array('viewBilling', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$this->render_template('billing/index', $this->data);
	}


	//--> It retrieve the specific billing information via a billing id
	//    and returns the data in json format

	public function fetchBillingDataById($id)
	{
		if($id) {
			$data = $this->model_billing->getBillingData($id);
			echo json_encode($data);
		}
	}


	//--> It retrieves all the billing data from the database
	//    This function is called from the datatable ajax function
	//    The data is return based on the json format.

	public function fetchBillingData()
	{
		$result = array('data' => array());

		$data = $this->model_billing->getBillingData();

		foreach ($data as $key => $value) {

			$buttons = '';

			if(in_array('updateBilling', $this->permission)) {
				$buttons = '<button type="button" class="btn btn-default" onclick="editFunc('.$value['id'].')" data-toggle="modal" data-target="#editModal"><i class="fa fa-pencil"></i></button>';
			}

			if(in_array('deleteBilling', $this->permission)) {
				$buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-target="#removeModal"><i class="fa fa-trash"></i></button>';
			}

			$type = ($value['type'] == 0) ? 'Revenue' : 'Expense';

			$result['data'][$key] = array(
				$value['name'],
				$value['cost'],
				$type,
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
		if(!in_array('createBilling', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = array();

		$this->form_validation->set_rules('billing_name', 'Name', 'trim|required');
		$this->form_validation->set_rules('item_cost', 'Item Cost', 'trim|required');
		$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

        if ($this->form_validation->run() == TRUE) {
        	$data = array(
        		'name' => $this->input->post('billing_name'),
        		'description' => $this->input->post('billing_description'),
                'type' => $this->input->post('billing_type'),
                'cost' => $this->input->post('item_cost'),
        	);

        	$create = $this->model_billing->createItem($data);
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
		if(!in_array('updateBilling', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = array();

		if($id) {
			$this->form_validation->set_rules('edit_billing_name', 'Name', 'trim|required');
			$this->form_validation->set_rules('edit_billing_type', 'Code', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

	        if ($this->form_validation->run() == TRUE) {
	        	$data = array(
                    'name' => $this->input->post('edit_billing_name'),
                    'description' => $this->input->post('edit_billing_description'),	        		
                    'type' => $this->input->post('edit_billing_type'),
                    'cost' => $this->input->post('edit_item_cost'),
	        	);

	        	$update = $this->model_city->update($data, $id);
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


	//--> If checks if the city id is provided on the function, if not then an appropriate message
	//    is return on the json format
    //    If the validation is true (valid) then it removes the data into the database and returns an appropriate
    //    message in the json format.

	public function remove()
	{
		if(!in_array('deleteBilling', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$billing_item_id = $this->input->post('billing_item_id');

		$response = '';
		$response = array();

		if($billing_item_id) {
			// //---> Validate if the information is used in client table
			// $total_client = $this->model_billing->checkIntegrity($billing_item_id);
			// //---> If no client have this information, we can delete
            // if ($total_client == 0) {
			// 	$delete = $this->model_billing->remove($billing_item_id);
			// 	if($delete == true) {
			// 		$response['success'] = true;
			// 		$response['messages'] = 'Successfully deleted';}
			// 	else {
			// 		$response['success'] = false;
			// 		$response['messages'] = 'Error in the database while deleting the information';}
			// 	}

			// else {
			// 	//---> There is at least one client having this information
			// 	$response['success'] = false;
            // 	$response['messages'] = 'At least one client uses this information.  You cannot delete.';}
            $delete = $this->model_billing->remove($billing_item_id);
            if($delete == true) 
            {
                $response['success'] = true;
                $response['messages'] = 'Successfully deleted';}
            else 
            {
                $response['success'] = false;
                $response['messages'] = 'Error in the database while deleting the information';
            }

		}
		else {
			$response['success'] = false;
			$response['messages'] = 'Refresh the page again';}

		echo json_encode($response);
	}

	public function fetchBillingInfo()
	{
		$data=$this->model_billing->getBillingData();
		echo json_encode($data);
	}

}