<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Inquiry extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Inquiry';
	}


	public function index()
	{
		if(!in_array('viewInquiry', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$this->render_template('inquiry/index', $this->data);
	}


	//--> It retrieve the specific inquiry information via a inquiry id
	//    and returns the data in json format

	public function fetchInquiryDataById($id)
	{
		if($id) {
			$data = $this->model_inquiry->getInquiryData($id);
			echo json_encode($data);
		}
	}


	//--> It Fetches the inquiry data from the inquiry table

    public function fetchInquiryClient($id)
    {
        $result = array('data' => array());

        $data = $this->model_inquiry->getInquiryClient($id);

        foreach ($data as $key => $value) {

        	$support_type_data = $this->model_support_type->getSupportTypeData($value['support_type_id']);
        	$inquiry_type_data = $this->model_inquiry_type->getInquiryTypeData($value['inquiry_type_id']);

            $buttons = '';

            if(in_array('updateInquiry', $this->permission)) {
               $buttons .= '<button type="button" class="btn btn-default" onclick="editInquiry('.$value['id'].')" data-toggle="modal" data-target="#editModalInquiry"><i class="fa fa-pencil"></i></button>';
            }

            if(in_array('deleteInquiry', $this->permission)) {
                $buttons .= ' <button type="button" class="btn btn-default" onclick="removeInquiry('.$value['id'].')" data-toggle="modal" data-target="#removeModalInquiry"><i class="fa fa-trash"></i></button>';
            }

            $result['data'][$key] = array(
                $inquiry_type_data['name'],
                $support_type_data['name'],
                $value['request'],
                $value['feedback'],
                $value['answered_by'],
				$value['inquiry_date'],
                $buttons
            );
        } // /foreach

        echo json_encode($result);
    }



	//--> If the validation is not true (not valid), then it provides the validation error on the json format
    //    If the validation for each input is valid then it inserts the data into the database and
    //    returns the appropriate message in the json format.

	public function create()
	{
		if(!in_array('createInquiry', $this->permission)) {redirect('dashboard', 'refresh');}

		$response = array();

		$this->form_validation->set_rules('inquiry_type', 'Inquiry Type', 'trim|required');
		$this->form_validation->set_rules('support_type', 'Support Type', 'trim|required');
		$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

        if ($this->form_validation->run() == TRUE) {
        	$data = array(
        		'client_id' => $this->session->client_id,
        		'inquiry_type_id' => $this->input->post('inquiry_type'),
        		'support_type_id' => $this->input->post('support_type'),
        		'request' => $this->input->post('request'),
        		'feedback' => $this->input->post('feedback'),
        		'inquiry_date' => $this->input->post('inquiry_date'),
        		'answered_by' => $this->input->post('answered_by'),
        	);

        	$create = $this->model_inquiry->create($data);

        	if($create == true)
        		{$response['success'] = true;
        		$response['messages'] = 'Successfully created';}
        	else
        		{$response['success'] = false;
        		$response['messages'] = 'Error in the database while creating the information';}

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
		if(!in_array('updateInquiry', $this->permission)) {redirect('dashboard', 'refresh');}

		$response = array();

		if($id) {

			$this->form_validation->set_rules('edit_inquiry_type', 'Inquiry Type', 'trim|required');
			$this->form_validation->set_rules('edit_support_type', 'Support Type', 'trim|required');
			$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

	        if ($this->form_validation->run() == TRUE) {

				$data = array(
	        		'inquiry_type_id' => $this->input->post('edit_inquiry_type'),
	        		'support_type_id' => $this->input->post('edit_support_type'),
	        		'request' => $this->input->post('edit_request'),
	        		'feedback' => $this->input->post('edit_feedback'),
	        		'inquiry_date' => $this->input->post('edit_inquiry_date'),
	        		'answered_by' => $this->input->post('edit_answered_by'),
				);

		        $update = $this->model_inquiry->update($data, $id);

	        	if($update == true)
	        		{$response['success'] = true;
	        		$response['messages'] = 'Successfully updated';}
	        	else
	        		{$response['success'] = false;
	        		$response['messages'] = 'Error in the database while updating the information';}
	        	}  //end form validation is true
	        else   //form validation is false
	        	{$response['successa'] = false;
	        	foreach ($_POST as $key => $value) {$response['messages'][$key] = form_error($key);}
	            }
		}  //else no id
		else {
			$response['successb'] = false;
    		$response['messages'] = 'Error please refresh the page again';
		}

		echo json_encode($response);
	}




	public function remove()
	{
		if(!in_array('deleteInquiry', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$inquiry_id = $this->input->post('inquiry_id');

		$response = '';
		$response = array();

		if($inquiry_id) {
			$delete = $this->model_inquiry->remove($inquiry_id);
			if($delete == true) {
				$response['success'] = true;
				$response['messages'] = 'Successfully deleted';}
			else {
				$response['success'] = false;
				$response['messages'] = 'Error in the database while deleting the information';
			}
		}
		else {
			$response['success'] = false;
			$response['messages'] = 'Refresh the page again';
		}

		echo json_encode($response);
	}


}