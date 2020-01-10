<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Pending_Client extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Pending Client';

	}
    //--> It only redirects to the manage client page
	public function index()
	{
        if(!in_array('viewPendingClient', $this->permission)) {
			redirect('dashboard', 'refresh');} 

		$this->render_template('pending_client/index', $this->data);
	}

	public function fetchPendingClientData()
	{
		$result = array('data' => array());

		$data = $this->model_pending_client->getPendingClientData();

		foreach ($data as $key => $value) {

			$buttons = '';

			if(in_array('updatePendingClient', $this->permission)) {
                $buttons .= '<a href="'.base_url('pending_client/update/'.$value['id']).'" class="btn btn-default"><i class="fa fa-pencil"></i></a>';
            }

            if(in_array('deletePendingClient', $this->permission)) { 
                $buttons .= '<button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-target="#removeModal"><i class="fa fa-trash"></i></button>';
            }

			$result['data'][$key] = array(			
				$value['companyName'],
				$value['trn'],
				$value['clientName'],
				$value['attempts'],
				$value['active'],
				$buttons
			);
		} // /foreach

		echo json_encode($result);
	}

	public function remove()
	{
        if(!in_array('deletePendingClient', $this->permission)) {redirect('dashboard', 'refresh');}
        
        $pending_client_id = $this->input->post('pending_client_id');

        $response = array();

        if($pending_client_id) {
            $delete = $this->model_pending_client->remove($pending_client_id);
            if($delete == true) {
                $response['success'] = true;
                $response['messages'] = "Successfully removed"; 
            }
            else {
                $response['success'] = false;
                $response['messages'] = "Error in the database while removing the requirement information";
            }
        }
        else {
            $response['success'] = false;
            $response['messages'] = "Refresh the page again!!";
        }

        echo json_encode($response);
	}

}

?>