<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Phase extends Admin_Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->not_logged_in();

        $this->data['page_title'] = 'News';
    }



    //--> Redirects to the manage phase page

	public function index()
	{
        if(!in_array('viewPhase', $this->permission)) {
            redirect('dashboard', 'refresh');
        }

		$this->render_template('phase/index', $this->data);
	}


    //--> It fetches the phase data from the phase table
    //    This function is called from the datatable ajax function

	public function fetchPhaseData()
	{
		$result = array('data' => array());

        $data = $this->model_phase->getPhaseData();

		foreach ($data as $key => $value) {

            $buttons = '';

            if(in_array('updatePhase', $this->permission)) {
                $buttons .= '<a href="'.base_url('phase/update/'.$value['id']).'" class="btn btn-default"><i class="fa fa-pencil"></i></a>';}

            if(in_array('deletePhase', $this->permission)) {
                $buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-target="#removeModal"><i class="fa fa-trash"></i></button>';}

			$active = ($value['active'] == 1) ? '<span class="label label-success">Active</span>' : '<span class="label label-warning">Inactive</span>';

            $icon = '<img src="'.base_url('/upload/images/'.$value['icon']).'" alt="'.$value['icon'].'" class="img-circle" width="50" height="50" />';
            
			$result['data'][$key] = array(
                $icon,
			    $value['name'],
				$value['code'],
               	$value['remark'],                
				$active,
				$buttons
			);
		} // /foreach

		echo json_encode($result);
	}


   //--> If the validation is not true (not valid), then it redirects to the create page.
   //    If the validation for each input field is valid then it inserts the data into the database
   //    and it sends the operation message into the session flashdata and display on the manage phase page

	public function create()
	{
		if(!in_array('createPhase', $this->permission)) {
            redirect('dashboard', 'refresh');
        }

        $this->form_validation->set_rules('name', 'Phase name', 'trim|required');
		$this->form_validation->set_rules('code', 'Code', 'trim|required');
        $this->form_validation->set_error_delimiters('<p class="alert alert-warning">','</p>');


        if ($this->form_validation->run() == TRUE) {
            //--> true case, we are creating the phase - everything is valid

            //--> Upload of image

            $config['upload_path'] = './upload/images';
            $config['allowed_types'] = 'gif|jpg|png|pdf|xls|xlsx|docx|ico|doc|pptx';
            $config['max_size'] = '4000';

            $this->load->library('upload', $config);


            if ( ! $this->upload->do_upload('icon')) {
                if ($this->upload->data('file_name') == ''){$icon = 'noimage.jpg';}
                else {$msg_error = 'This type of document is not allowed or the document is too large.';
                      $this->session->set_flashdata('warning', $msg_error);
                      redirect('phase/update/'.$this->session->phase_id, 'refresh');}
            } else {
                //--->  Upload the document
                $data = array('upload_data' => $this->upload->data());
                $icon = $this->upload->data('file_name');
            }

            //--> Insert of the phase

          	$data = array(
        		'name' => $this->input->post('name'),
				'remark' => $this->input->post('remark'),
        		'code' => $this->input->post('code'),
        		'active' => $this->input->post('active'),
                'icon' => $icon,
                'icon_type' => $this->upload->data('file_type'),
				'updated_by' => $this->session->user_id,
        	);

        	$create = $this->model_phase->create($data);

            if($create == false) {
                $msg_error = 'Error occurred';
                $this->session->set_flashdata('error', $msg_error);
                redirect('phase/create', 'refresh');}
            else {
                //The create return the client_id created if it's successful
                $phase_id = $create;
                redirect('phase/update/'.$phase_id, 'refresh');}

        }
        else {
            //--> false case, we are preparing the drop-down list for the encoding of the phase
            //    and opening the insert page

            $this->render_template('phase/create', $this->data);
        }
	}




    //--> If the validation is not true (not valid), then it redirects to the edit phase page
    //    If the validation is true (valid) then it updates the data into the database
    //    and it sends the operation message into the session flashdata and display on the manage phase page

	public function update($phase_id)
	{
        if(!in_array('updatePhase', $this->permission)) {
            redirect('dashboard', 'refresh');}

        if(!$phase_id) {redirect('dashboard', 'refresh');}

        $this->form_validation->set_rules('name', 'Phase name', 'trim|required');
        $this->form_validation->set_rules('code', 'Code', 'trim|required');
        $this->form_validation->set_error_delimiters('<p class="alert alert-warning">','</p>');

        //--->  Validation of the form
        if ($this->form_validation->run() == TRUE) {
            // true case

            //--> Upload of image (find a solution to delete the other image??)

            $config['upload_path'] = './upload/images';
            $config['allowed_types'] = 'gif|jpg|png|pdf|xls|xlsx|docx|doc|pptx';
            $config['max_size'] = '4000';

            $this->load->library('upload', $config);

            if ( ! $this->upload->do_upload('new_image')) {
                //If no change in the image we keep the last image
                $icon = $this->input->post('icon');
                $icon_type = $this->input->post('icon_type');
            } else {
                // This method should be revised generate an error
                /*if ($this->input->post('icon') <> 'noimage.jpg') {
                    // Delete the old document, but keep noimage.jpg as the default image
                    // if the user don't give any image
                    $doc_link = '/upload/images/'.$this->input->post('icon');
                    unlink(FCPATH . $doc_link); }*/
                //--->  Upload the document
                $data = array('upload_data' => $this->upload->data());
                $icon = $this->upload->data('file_name');
                $icon_type = $this->upload->data('file_type');
            }
            //--> Insert of the phase

            $data = array(
                'name' => $this->input->post('name'),
                'remark' => $this->input->post('remark'),
                'code' => $this->input->post('code'),
                'active' => $this->input->post('active'),
                'icon' => $icon,
                'icon_type' => $this->upload->data('file_type'),
                'updated_date' => date('Y-m-d H:i:s'),
                'updated_by' => $this->session->user_id,
		        	);

            $update = $this->model_phase->update($data, $phase_id);

            if($update == true) {
                $msg_error = 'Successfully updated';
                $this->session->set_flashdata('success', $msg_error);
                redirect('phase/', 'refresh');}
            else {
                $msg_error = 'Error occurred';
                $this->session->set_flashdata('error', $msg_error);
                redirect('phase/update/'.$phase_id, 'refresh');}
        }
        else {
            //---> false case, we prepare the drop-down list and fill the form for update

            $this->data['category'] = $this->model_category->getActiveCategory();

            $phase_data = $this->model_phase->getPhaseData($phase_id);
            $this->data['phase_data'] = $phase_data;
            $this->render_template('phase/edit', $this->data);
        }
	}


   //--> If checks if the phase id is provided on the function, if not then an appropriate message
    //    is return on the json format
    //    If the validation is true (valid) then it removes the data into the database and returns an appropriate
    //    message in the json format.

    public function remove()
    {
        if(!in_array('deletePhase', $this->permission)) {
            redirect('dashboard', 'refresh');
        }

        $phase_id = $this->input->post('phase_id');

        $response = '';
        $response = array();

        if($phase_id) {
            //---> Validate if the information is used in other tables
            $total_used = $this->model_phase->checkIntegrity($phase_id);
            //---> If no client have this information, we can delete
            if ($total_used == 0) {
                $delete = $this->model_phase->remove($phase_id);
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