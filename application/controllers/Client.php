<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Client extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Client';
        $this->data['active_tab'] = $this->input->get('tab') ?? 'client';

	}


    //--> It only redirects to the manage client page

	public function index()
	{
        if(!in_array('viewClient', $this->permission)) {redirect('dashboard', 'refresh');} 

        $this->data['consultant'] = $this->model_user->getActiveConsultant(); 
		$this->render_template('client/index', $this->data);
	}


    //-->  It Fetches the client data from the client table
    //     this function is called from the datatable ajax function

	public function fetchClientData()
	{
		$result = array('data' => array());

        //--> For the Profile Consultant, we read only the consultation where they are consultant

        if ($this->session->profile == 3) {
            $consultant = $this->session->user_id;
        } 
        else {
            $consultant = $this->input->get('consultant') ?? NULL; 
        }

        if ($consultant <> "all") {
            $consultant = '"'.$consultant.'"';
        }


        //--> If the Profile is a Client, we must read only the consultation of the client
        //    The client trn is the username given to the client to access the system
        //    If not we will read all the consultation depending on the security given (consultant or coordinator)

        if ($this->session->profile == 4) {
           $trn = "'".$this->session->username."'";
           $data = $this->model_client->getClientByClient($trn);
        } else {
            $data = $this->model_client->getClientByConsultant($consultant);
        }


        foreach ($data as $key => $value)
        {

            $company_name = $value['company_name'];

            $buttons = '';

            if(in_array('updateClient', $this->permission) || in_array('viewClient', $this->permission)) {
                $buttons .= '<a href="'.base_url('client/update/'.$value['id']).'" class="btn btn-default"><i class="fa fa-pencil"></i></a>';
                $company_name = '<a href="'.base_url('client/update/'.$value['id']).'">'.$value['company_name'].'</a>';}

            if(in_array('deleteClient', $this->permission)) {
                $buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-target="#removeModal"><i class="fa fa-trash"></i></button>';}

            if(in_array('viewClient', $this->permission)) {
                $buttons .= '<a href="'.base_url('report_client/REP0C/'.$value['id']).'"target="_blank" class="btn btn-default"><i class="fa fa-print"></i></a>';}

            $activity = $value['activity_name'];      

            switch ($value['activity_id']) {
                case '1':
                      $activity = '<span class="label label-success">'.$value['activity_name'].'</span>';
                      break;
                case '2':
                      $activity = '<span class="label label-warning">'.$value['activity_name'].'</span>';
                      break;
                case '3':
                      $activity = '<span class="label label-danger">'.$value['activity_name'].'</span>';
                      break;

            }

            //$active = ($value['active'] == 1) ? '<span class="label label-success">Active</span>' : '<span class="label label-warning">Inactive</span>';

			$result['data'][$key] = array(
				$company_name,
				$value['trn'],
                $value['client_name'],  
                $activity,
				$buttons
			);

            // For conversion only, to delete after conversion
            // This will create directory for all companies
            $path = "./upload/documents/".$value['trn'];
            if(!is_dir($path))  {mkdir($path,0755,TRUE);}

		} // /foreach

		echo json_encode($result);
	}



    public function fetchClientRequirement($id)
    {
        $result = array('data' => array());
        $data = $this->model_client->getClientRequirement($id);
        foreach($data as $key => $value)
        {
            
            $result['data'][$key] = array(
                $value['question'],
                $value['answer']
            );
        }

        echo json_encode($result);
    }




    //-->  If the validation is not valid, then it redirects to the create page.
    //     If the validation for each input field is valid then it inserts the data into the database
    //     It send the operation message into the session flashdata and display on the manage client page

    public function create()
    {
        if(!in_array('createClient', $this->permission)) {redirect('dashboard', 'refresh');}

        $this->form_validation->set_rules('activity', 'Activity', 'trim|required');
        $this->form_validation->set_rules('trn', 'TRN', 'trim|required|is_unique[client.trn]');
        $this->form_validation->set_rules('company_name', 'Company Name', 'trim|required');
        $this->form_validation->set_rules('client_name', 'Client Name', 'trim|required');
        $this->form_validation->set_rules('address', 'Address', 'trim|required');
        $this->form_validation->set_rules('email', 'Email', 'trim|required');
        $this->form_validation->set_rules('address', 'Address', 'trim|required');
        $this->form_validation->set_rules('county', 'County', 'trim|required');
        $this->form_validation->set_rules('parish', 'Parish', 'trim|required');
        $this->form_validation->set_error_delimiters('<p class="alert alert-warning">','</p>');

        if ($this->form_validation->run() == TRUE) {
            // True case, we create the new client
            $data = array(
                'activity_id' => $this->input->post('activity'),
                'address' => $this->input->post('address'),
                'city_id' => $this->input->post('city'),
                'client_name' => $this->input->post('client_name'),
                'company_name' => $this->input->post('company_name'),
                'contact_name' => $this->input->post('contact_name'),
                'trn' => $this->input->post('trn'),
                'county_id' => $this->input->post('county'),
                'director_name' => $this->input->post('director_name'),
                'directory' => $this->input->post('trn'),
                'district' => $this->input->post('district'),
                'email' => $this->input->post('email'),
                'mobile' => $this->input->post('mobile'),
                'parish_id' => $this->input->post('parish'),
                'phone' => $this->input->post('phone'),
                'postal_box' => $this->input->post('postal_box'),
                'postal_code' => $this->input->post('postal_code'),
                'remark' => $this->input->post('remark'),
                'website' => $this->input->post('website'),
                'updated_by' => $this->session->user_id,
            );

            $create = $this->model_client->create($data);

            if($create == false) {
                $msg_error = 'Error occurred';
                $this->session->set_flashdata('error', $msg_error);
                redirect('client/create', 'refresh');}
            else {
                //---> Create the directory for deposit of documents-->
                $path = "./upload/documents/".$this->input->post('trn');
                //---> Create the folder if it does not exists
                if(!is_dir($path))  {mkdir($path,0755,TRUE);}
                //The create return the client_id created if it's successful
                $client_id = $create;
                redirect('client/update/'.$client_id, 'refresh');}

        }

        //--> We are in the preparation of the form and we prepare the drop-down list needed in the create form

        $this->data['activity'] = $this->model_activity->getActiveActivity();
        $this->data['county'] = $this->model_county->getActiveCounty();
        $this->data['city'] = $this->model_city->getActiveCity();
        $this->data['parish'] = $this->model_parish->getActiveParish();

        $this->render_template('client/create', $this->data);

    }



    //--> If the validation is not valid, then it redirects to the edit client page
    //    If the validation is successful then it updates the data into the database
    //    and it send the operation message into the session flashdata and display on the manage client page

    public function update($client_id)
    {
        if(!in_array('updateClient', $this->permission) AND !in_array('viewClient', $this->permission)) {
            redirect('dashboard', 'refresh');}

        if(!$client_id) {redirect('dashboard', 'refresh');}

        $this->form_validation->set_rules('activity', 'Activity', 'trim|required');
        $this->form_validation->set_rules('trn', 'TRN', 'trim|required');
        $this->form_validation->set_rules('company_name', 'Company Name', 'trim|required');
        $this->form_validation->set_rules('client_name', 'Client Name', 'trim|required');
        $this->form_validation->set_rules('address', 'Address', 'trim|required');
        $this->form_validation->set_rules('email', 'Email', 'trim|required');
        $this->form_validation->set_rules('county', 'County', 'trim|required');
        $this->form_validation->set_rules('parish', 'Parish', 'trim|required');
        $this->form_validation->set_error_delimiters('<p class="alert alert-warning">','</p>');


        if ($this->form_validation->run() == TRUE) {


            //--> The directory where the documents are uploaded is the
            //    same as client register id.  If the user change the
            //    client register id, we must rename the directory

            if ($this->input->post('directory') !=  $this->input->post('trn'))
                {$old_path = "./upload/documents/".$this->input->post('directory');
                 $new_path = "./upload/documents/".$this->input->post('trn');
                 rename($old_path, $new_path);
                 //??? rename also the username of the user client
                }

            $data = array(
                'activity_id' => $this->input->post('activity'),
                'address' => $this->input->post('address'),
                'city_id' => $this->input->post('city'),
                'company_name' => $this->input->post('company_name'),
                'client_name' => $this->input->post('client_name'),
                'contact_name' => $this->input->post('contact_name'),
                'trn' => $this->input->post('trn'),
                'county_id' => $this->input->post('county'),
                'director_name' => $this->input->post('director_name'),
                'directory' => $this->input->post('trn'),
                'district' => $this->input->post('district'),
                'email' => $this->input->post('email'),
                'mobile' => $this->input->post('mobile'),
                'parish_id' => $this->input->post('parish'),
                'phone' => $this->input->post('phone'),
                'postal_box' => $this->input->post('postal_box'),
                'postal_code' => $this->input->post('postal_code'),
                'remark' => $this->input->post('remark'),
                'website' => $this->input->post('website'),
                'updated_date' => date('Y-m-d H:i:s'),
                'updated_by' => $this->session->user_id,
            );

            $update = $this->model_client->update($data, $client_id);

            if($update == true) {
                $msg_error = 'Successfully updated';
                $this->session->set_flashdata('success', $msg_error);
                redirect('client/', 'refresh');}
            else {
                $msg_error = 'Error occurred';
                $this->session->set_flashdata('error', $msg_error);
                redirect('client/update/'.$client_id, 'refresh');}
        }

        //--> We are in edit of the form, preparation of the drop down list
        //    and reading of the client data

        $this->data['activity'] = $this->model_activity->getActiveActivity();
        $this->data['county'] = $this->model_county->getActiveCounty();
        $this->data['city'] = $this->model_city->getActiveCity();
        $this->data['parish'] = $this->model_parish->getActiveParish();
        $this->data['document_type'] = $this->model_document_type->getActiveDocumentType(); 
        $this->data['document_class'] = $this->model_document_class->getActiveDocumentClass();


        $client_data = $this->model_client->getClientDataById($client_id);
        $this->data['client_data'] = $client_data;
        $this->render_template('client/edit', $this->data);

    }


    public function remove()
    {
        if(!in_array('deleteClient', $this->permission)) {
            redirect('dashboard', 'refresh');
        }

        $client_id = $this->input->post('client_id');

        $response = '';
        $response = array();

        if($client_id) {
            $delete = $this->model_client->remove($client_id);
            if($delete == true) {
                $response['success'] = true;
                $response['messages'] = 'Successfully deleted';
            }
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






//-------------------------------------   DOCUMENT ------------------------------------------------------


    //--> It Fetches the document data from the document table
    //    this function is called from the datatable ajax function

    public function fetchClientDocument($id)
    {
        $result = array('data' => array());

        $data = $this->model_client->getClientDocument($id);

        foreach ($data as $key => $value) {

            $link = base_url('upload/documents/'.$value['directory'].'/'.$value['doc_name']);
            $doc_link = '<a href="'.$link.'" target="_blank" >'.($value['doc_name']).'</a>';

            $buttons = '';
            if(in_array('viewDocument', $this->permission)) {
                $buttons .= '<a href="'.$link.'" target="_blank" class="btn btn-default"><i class="fa fa-search"></i></a>';
            }


            if(in_array('deleteDocument', $this->permission)) {
                $buttons .= ' <button type="button" class="btn btn-default" onclick="removeDocument('.$value['id'].')" data-toggle="modal" data-target="#removeDocumentModal"><i class="fa fa-trash"></i></button>';
            }

            $result['data'][$key] = array(
                $doc_link,
                $value['document_type_name'],
                $value['document_class_name'],
                $value['consultation_no'],
                $buttons
            );
        } // /foreach

        echo json_encode($result);
    }

 


    //-->  This function is invoked from another function to upload the documents into the assets folder
    //     of the client

    public function uploadDocument()
    {

        if(!in_array('updateDocument', $this->permission)) {
            redirect('dashboard', 'refresh');
        }



        $directory = $this->session->directory;
        $config['upload_path'] = './'.$directory;
        $config['allowed_types'] = 'gif|jpg|png|pdf|xls|xlsx|docx|doc|pptx';
        $config['max_size'] = '4000';

        $this->load->library('upload', $config);

        if ( ! $this->upload->do_upload('client_document')) {
            $msg_error = 'This type of document is not allowed or the document is too large.';
            $this->session->set_flashdata('warning', $msg_error);
            redirect('client/update/'.$this->session->client_id."?tab=document", 'refresh');
            }
        else
            {
            //---> Create the document in the table document

            $doc_link = $directory.$this->upload->data('file_name');

            $data = array(
                'client_id' => $this->session->client_id,
                'doc_size' => $this->upload->data('file_size'),
                'doc_type' => $this->upload->data('file_type'),
                'doc_name' => $this->upload->data('file_name'),
                'document_type_id' => $this->input->post('document_type'),
                'document_class_id' => $this->input->post('document_class'),
                'updated_by' => $this->session->user_id,
            );

            $create = $this->model_client->createDocument($data);

            if($create == true) {
                //--->  Upload the document
                $data = array('upload_data' => $this->upload->data());
                redirect('client/update/'.$this->session->client_id."?tab=document", 'refresh');
            }
            else {
                $msg_error = 'Error occurred';
                $this->session->set_flashdata('error', $msg_error);
                redirect('client/', 'refresh');
            }


        }
    }



    public function removeDocument()
    {
        if(!in_array('deleteDocument', $this->permission)) {
            redirect('dashboard', 'refresh');
        }

        $document_id = $this->input->post('document_id');
        $response = array();

        if($document_id) {
            //--> Get the link of the document for deleting the document on the directory
            $document_data = $this->model_client->getDocument($document_id);
            $doc_link = '/upload/documents/'.$document_data['directory'].'/'.$document_data['doc_name'];
            unlink(FCPATH . $doc_link);
            //--> Delete the document in the document table
            $delete = $this->model_client->removeDocument($document_id);
            if($delete == true) {
                $response['success'] = true;
                $response['messages'] = 'Successfully deleted';
            }
            else
            {
                $response['success'] = false;
                $response['messages'] = 'Error in the database while deleting the information';
            }
        }
        else
        {
            $response['success'] = false;
            $response['messages'] = 'Refresh the page again';
        }

        echo json_encode($response);
    }

}

?>