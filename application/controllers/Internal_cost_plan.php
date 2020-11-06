<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Internal_cost_plan extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Internal Cost Plan';
	}


	public function index()
	{
		if(!in_array('viewInternalCostPlan', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$this->render_template('internal_cost_plan/index', $this->data);
	}


	//--> It retrieve the specific internal cost plan information via a internal cost plan id
	//    and returns the data in json format

	public function fetchInternalCostPlanDataById($id)
	{
		$result = array('data' => array());
		$data = $this->model_internal_cost_plan->getInternalCostPlanDataByTaId($id);
		foreach($data as $key => $value){
			// $billing_item_data = $this->model_billing->getBillingData();
			$buttons = '';
			if(in_array('updateInternalCostPlan', $this->permission)) {
				$buttons .= '<a href="'.base_url('internal_cost_plan/update/'.$value['id']).'" class="btn btn-default"><i class="fa fa-pencil"></i></a>';
			}
			if(in_array('deleteInternalCostPlan', $this->permission)) {
                $buttons .= ' <button type="button" class="btn btn-default" onclick="removeInternalCostPlan('.$value['id'].')" data-toggle="modal" data-target="#removeModalInternalCostPlan"><i class="fa fa-trash"></i></button>';
			}
			$budget_type='';
			if($value['budget_type']==0){
				$budget_type="Revenue";
			}else{
				$budget_type="Expense";
			}
			$result['data'][$key]=array(
				$budget_type,
				$value['item_name'],
				$value['p_amount'],
				$value['a_amount'],
				$value['updated'],
				$value['date_updated'],
				$buttons
			);
		}
		
		// var_dump($data);
		echo json_encode($result);
	}

	public function fetchInternalCostPlanItemById($id)
	{
		if($id) {
			$result = array('data' => array());
			$internal_cost_plan_item = $this->model_internal_cost_plan->getInternalCostPlanItem($id);
			
			//this is to get the information for the specific billing item
			$billing_item_data = $this->model_billing->getBillingData($internal_cost_plan_item['billing_item_id']);
			$result=array(
				'intenral_cost_plan_item'=>$internal_cost_plan_item['id'],
				'billing_item_id'=>$billing_item_data['id'],
				'billing_item_name'=>$billing_item_data['name'],
				'budget_type'=>$billing_item_data['type'],
				'billing_item_cost'=>$billing_item_data['cost'],
				'p_amount'=>$internal_cost_plan_item['p_amount'],
				'a_amount'=>$internal_cost_plan_item['a_amount']
				
			);
			echo json_encode($result);
		}
	}


	// //--> It Fetches the internal cost plan data from the internal cost plan table

    // public function fetchInternalCostPlanClient($id)
    // {
    //     $result = array('data' => array());

    //     $data = $this->model_inquiry->getInquiryClient($id);

    //     foreach ($data as $key => $value) {

    //     	$support_type_data = $this->model_support_type->getSupportTypeData($value['support_type_id']);
    //     	$inquiry_type_data = $this->model_inquiry_type->getInquiryTypeData($value['inquiry_type_id']);

    //         $buttons = '';
    //         $request = $value['request'];

    //         if(in_array('updateInquiry', $this->permission)) {
    //            $buttons .= '<button type="button" class="btn btn-default" onclick="editInquiry('.$value['id'].')" data-toggle="modal" data-target="#editModalInquiry"><i class="fa fa-pencil"></i></button>';
    //            $request='  <a data-target="#editModalInquiry" onclick="editInquiry('.$value['id'].')" data-toggle="modal" href="#editModalInquiry">'.$value['request'].'</a>';
    //         }

    //         if(in_array('deleteInquiry', $this->permission)) {
    //             $buttons .= ' <button type="button" class="btn btn-default" onclick="removeInquiry('.$value['id'].')" data-toggle="modal" data-target="#removeModalInquiry"><i class="fa fa-trash"></i></button>';
    //         }

    //         $result['data'][$key] = array(
    //         	$request,
    //             $inquiry_type_data['name'],
    //             $support_type_data['name'],                
    //             $value['feedback'],
    //             $value['answered_by'],
	// 			$value['inquiry_date'],
    //             $buttons
    //         );
    //     } // /foreach

    //     echo json_encode($result);
    // }



	//--> If the validation is not true (not valid), then it provides the validation error on the json format
    //    If the validation for each input is valid then it inserts the data into the database and
    //    returns the appropriate message in the json format.

	public function create()
	{
		if(!in_array('createInternalCostPlan', $this->permission)) {redirect('dashboard', 'refresh');}

		$response = array();

		$this->form_validation->set_rules('budget_type', 'Budget Type', 'trim|required');
		$this->form_validation->set_rules('item_name', 'Item', 'trim|required');
		$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

        if ($this->form_validation->run() == TRUE) {
        	$data = array(
                'ta_id' => $this->session->technical_advice_id,
        		'client_id' => $this->session->client_id,
        		'billing_item_id' => $this->input->post('item_name'),
        		'p_amount' => $this->input->post('p_amount'),
        		'a_amount' => $this->input->post('a_amount'),
        		'date_updated' => $this->input->post('date_updated'),
        		'updated_by' => $this->session->user_id,
        	);
        	$create = $this->model_internal_cost_plan->create($data);
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
		if(!in_array('updateInternalCostPlan', $this->permission)) {redirect('dashboard', 'refresh');}

        if(!$id) {redirect('dashboard', 'refresh');}
		$this->form_validation->set_rules('edit_billing_item', 'Item', 'trim|required');
        $this->form_validation->set_error_delimiters('<p class="alert alert-warning">','</p>');

		if ($this->form_validation->run() == TRUE) 
		{

                $data = array(
					'ta_id' => $this->session->technical_advice_id,
					'client_id' => $this->session->client_id,
					'billing_item_id' => $this->input->post('edit_billing_item'),
					'p_amount' => $this->input->post('edit_p_amount'),
					'a_amount' => $this->input->post('edit_a_amount'),
					'date_updated' => date('Y-m-d'),
					'updated_by' => $this->session->user_id,
				);          

			$update = $this->model_internal_cost_plan->update($data,$id);
			if($update==true){
				$this->session->set_flashdata('success', 'Successfully updated');
                redirect('technical_advice/update/'.$this->session->technical_advice_id, 'refresh');
			}
			else{
				$this->session->set_flashdata('errors', 'Error occurred!!');
                redirect('technical_advice/update/'.$this->session->technical_advice_id, 'refresh');
			}            
		}		
		else 
		{          		
			$this->data['billing_item'] = $this->model_billing->getBillingData();
			$this->data['icp_item_data']=$this->model_internal_cost_plan->getInternalCostPlanItem($id);           

            
            $this->render_template('internal_cost_plan/edit', $this->data); 
        }   
	}




	public function remove()
	{
		if(!in_array('deleteInternalCostPlan', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$icp_id = $this->input->post('icp_id');

		$response = '';
		$response = array();

		if($icp_id) {
			$delete = $this->model_internal_cost_plan->remove($icp_id);
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