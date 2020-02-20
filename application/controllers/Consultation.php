<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Consultation extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Consultation';
        $this->data['active_tab'] = $this->input->get('tab') ?? 'consultation';

	}


    //--> Redirects to the manage consultation page

	public function index()
	{
        if(!in_array('viewConsultation', $this->permission)) {
            redirect('dashboard', 'refresh');
        }

        $this->data['consultant'] = $this->model_user->getActiveConsultant(); 
		$this->render_template('consultation/index', $this->data);
	}


    //--> It fetches the consultation data from the consultation table
    //    This function is called from the datatable ajax function

	public function fetchConsultationData()
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
           $data = $this->model_consultation->getConsultationByClient($trn);
        } else {
            $data = $this->model_consultation->getConsultationByConsultant($consultant);
        }        

		foreach ($data as $key => $value) {

            $phase_data = $this->model_phase->getPhaseData($value['phase_id']);
            $status_data = $this->model_status->getStatusData($value['status_id']);
            $client_data = $this->model_client->getClientDataById($value['client_id']);            
            $sector_data = $this->model_sector->getSectorData($value['sector_id']);

            //--> Prepare the list of consultants to view in the datatable

            $consultant = json_decode($value['consultant_id']);
            $consultant_list = '';
           // Get the name of each consultant
            if (!$consultant == null) {
                foreach($consultant as $k=>$v){
                       $consultant_data = $this->model_user->getConsultantData($consultant[$k]);
                       $consultant_list = $consultant_list.' '.$consultant_data['name'];
                   }
            }       


            $buttons = '';

            $consultation_no = $value['consultation_no'];  

            if(in_array('updateConsultation', $this->permission) || in_array('viewConsultation', $this->permission)) {
                $buttons .= '<a href="'.base_url('consultation/update/'.$value['id']).'" class="btn btn-default"><i class="fa fa-pencil"></i></a>';
                $consultation_no = '<a href="'.base_url('consultation/update/'.$value['id']).'">'.$value['consultation_no'].'</a>';}

            if(in_array('deleteConsultation', $this->permission)) {
                $buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-standard="#removeModal"><i class="fa fa-trash"></i></button>';}

            if(in_array('viewConsultation', $this->permission)) {
                $buttons .= '<a href="'.base_url('report_consultation/REP0I/'.$value['id']).'" target="_blank"  class="btn btn-default"><i class="fa fa-print"></i></a>';}

			$result['data'][$key] = array(
				$consultation_no,
				$value['description'],
                $client_data['company_name'],
                $consultant_list,
                $sector_data['name'],
                $phase_data['code'],
				$status_data['status_name'],
				$buttons
			);
		} // /foreach

		echo json_encode($result);
	}


   //--> If the validation is not true (not valid), then it redirects to the create page.
   //    If the validation for each input field is valid then it inserts the data into the database
   //    and it sends the operation message into the session flashdata and display on the manage consultation page

	public function create()
	{
		if(!in_array('createConsultation', $this->permission)) {
            redirect('dashboard', 'refresh');
        }

        $this->form_validation->set_rules('client', 'Client/Company', 'trim|required');
        $this->form_validation->set_rules('standard', 'Standard', 'trim|required');
        $this->form_validation->set_rules('consultation_no', 'Consultation No', 'trim|required');
		$this->form_validation->set_rules('description', 'Description', 'trim|required');
        $this->form_validation->set_rules('date_creation', 'Date creation', 'trim|required');
        $this->form_validation->set_rules('sector', 'Sector', 'trim|required');
        $this->form_validation->set_rules('phase', 'Phase', 'trim|required');
        $this->form_validation->set_rules('status', 'Status', 'trim|required');  
        $this->form_validation->set_error_delimiters('<p class="alert alert-warning">','</p>');

        if ($this->form_validation->run() == TRUE) {
            // true case, we are creating the consultation - everything is valid
          	$data = array(
                'board_meeting_time_period' => $this->input->post('board_meeting_time_period'),
                'business_process' => $this->input->post('business_process'), 
                'clause_id' => $this->input->post('clause'), 
                'client_id' => $this->input->post('client'), 
                'consultant_id' => json_encode($this->input->post('consultant')),
                'consultation_no' => $this->input->post('consultation_no'),                
                'date_creation' => $this->input->post('date_creation'),
                'description' => $this->input->post('description'),
                'exemption' => $this->input->post('exemption'),
                'management_review_time' => $this->input->post('management_review_time'),               
                'phase_id' => $this->input->post('phase'),
                'remark' => $this->input->post('remark'),
                'sector_id' => $this->input->post('sector'),
                'standard_id' => $this->input->post('standard'),
                'status_id' => $this->input->post('status'),
                'updated_by' => $this->session->user_id,

        	);

        	$create = $this->model_consultation->create($data);

        	if($create == false) {
                $msg_error = 'Error occurred';
                $this->session->set_flashdata('error', $msg_error);
                redirect('consultation/create', 'refresh');}
            else {
                 //The create return the consultation_id created if it's successful
                $consultation_id = $create;
                redirect('consultation/update/'.$consultation_id, 'refresh');}

        }

        //--> We are in the preparation of the form and we prepare
        //    the drop-down list needed in the create form

        $this->data['standard'] = $this->model_dynamic_dependent->fetch_standard();  
		$this->data['phase'] = $this->model_phase->getActivePhase();
        $this->data['status'] = $this->model_status->getActiveStatus();
        $this->data['client'] = $this->model_client->getActiveClientData();
        $this->data['consultant'] = $this->model_user->getActiveConsultant();
		$this->data['sector'] = $this->model_sector->getActiveSector();

        if($this->agent->is_mobile())
        {
            $this->render_template('mobile/consultation/create', $this->data);
        }
        else
        {
            $this->render_template('consultation/create', $this->data);
        }
	}


    public function date_check()
    {
        if ($this->input->post('date_end') < $this->input->post('date_creation') )
            {$this->form_validation->set_message('date_check', 'The date End should be greater or equal to the date Begin.');
            return FALSE;
            }
        else
            {return TRUE;}
    }




    //--> If the validation is not true (not valid), then it redirects to the edit consultation page
    //    If the validation is true (valid) then it updates the data into the database
    //    and it sends the operation message into the session flashdata and display on the manage consultation page

	public function update($consultation_id)
	{

        //--> the profile having viewConsultation can see the information but cannot update
        
        if(!in_array('updateConsultation', $this->permission) AND !in_array('viewConsultation', $this->permission)) {
            redirect('dashboard', 'refresh');}

        if(!$consultation_id) {redirect('dashboard', 'refresh');}

        $this->form_validation->set_rules('client', 'Client/Company', 'trim|required');
        $this->form_validation->set_rules('standard', 'Standard', 'trim|required');
        $this->form_validation->set_rules('consultation_no', 'Consultation No', 'trim|required');
        $this->form_validation->set_rules('description', 'Description', 'trim|required');
        $this->form_validation->set_rules('date_creation', 'Date creation', 'trim|required');
        $this->form_validation->set_rules('sector', 'Sector', 'trim|required');
        $this->form_validation->set_rules('phase', 'Phase', 'trim|required');
        $this->form_validation->set_rules('status', 'Status', 'trim|required');  
        $this->form_validation->set_error_delimiters('<p class="alert alert-warning">','</p>');

        //--->  Validation of the form
        if ($this->form_validation->run() == TRUE) {
            // true case
            $data = array(
                'board_meeting_time_period' => $this->input->post('board_meeting_time_period'),
                'business_process' => $this->input->post('business_process'), 
                'clause_id' => $this->input->post('clause'), 
                'client_id' => $this->input->post('client'), 
                'consultant_id' => json_encode($this->input->post('consultant')),
                'consultation_no' => $this->input->post('consultation_no'),                
                'date_creation' => $this->input->post('date_creation'),
                'description' => $this->input->post('description'),
                'exemption' => $this->input->post('exemption'),
                'management_review_time' => $this->input->post('management_review_time'),               
                'phase_id' => $this->input->post('phase'),
                'remark' => $this->input->post('remark'),
                'sector_id' => $this->input->post('sector'),
                'standard_id' => $this->input->post('standard'),
                'status_id' => $this->input->post('status'),
                'updated_by' => $this->session->user_id,
            );

            $update = $this->model_consultation->update($data, $consultation_id);

            if($update == true) {
                //$msg_error = 'Successfully updated';
                //$this->session->set_flashdata('success', $msg_error);
                redirect('consultation/update/'.$consultation_id."?tab=consultation", 'refresh');
            }
            else {
                $msg_error = 'Error occurred';
                $this->session->set_flashdata('error', $msg_error);
                redirect('consultation/update/'.$consultation_id, 'refresh');}
        }

        //--> We are in edit of the form, preparation of the drop down list
        //    and reading of the consultation data

        $this->data['standard'] = $this->model_standard->getActiveStandard();
        $this->data['clause'] = $this->model_clause->getActiveClause();
        $this->data['phase'] = $this->model_phase->getActivePhase();
        $this->data['status'] = $this->model_status->getActiveStatus();
        $this->data['client'] = $this->model_client->getActiveClientData();
        $this->data['consultant'] = $this->model_user->getActiveConsultant();
        $this->data['sector'] = $this->model_sector->getActiveSector(); 
        $this->data['document_type'] = $this->model_document_type->getActiveDocumentType(); 
        $this->data['document_class'] = $this->model_document_class->getActiveDocumentClass(); 

        $consultation_data = $this->model_consultation->getConsultationData($consultation_id);
        $this->data['consultation_data'] = $consultation_data;
        if($this->agent->is_mobile())
        {
            $this->render_template('mobile/consultation/edit', $this->data);
        }
        else{            
            $this->render_template('consultation/edit', $this->data);
        }

	}



    //--> It removes the data from the database
    //    and it returns the response into the json format

	public function remove()
	{
        if(!in_array('deleteConsultation', $this->permission)) {
            redirect('dashboard', 'refresh');}

        $consultation_id = $this->input->post('consultation_id');

        $response = '';
        $response = array();

        if($consultation_id) {
            //---> Validate if the information is used in other table
            $total_used = $this->model_consultation->checkIntegrity($consultation_id);
            //---> If not used, we can delete
            if ($total_used == 0) {
                $delete = $this->model_consultation->remove($consultation_id);
                if($delete == true) {
                    $response['success'] = true;
                    $response['messages'] = 'Successfully deleted';}
                else {
                    $response['success'] = false;
                    $response['messages'] = 'Error in the database while deleting the information';}
                }

            else {
                //---> There is at least one document and we will ask to delete the document first
                $response['success'] = false;
                $response['messages'] = 'At least one document is attached to this consultation.  Delete the document manually first.';}

        }
        else {
            $response['success'] = false;
            $response['messages'] = 'Refresh the page again';}

        echo json_encode($response);

	}




    //--> It fetches the consultation data from the consultation table
    //    This function is called from the datatable ajax function

    public function fetchConsultationClient($id)
    {
        $result = array('data' => array());

        $data = $this->model_consultation->getConsultationClient($id);

        foreach ($data as $key => $value) {

            $phase_data = $this->model_phase->getPhaseData($value['phase_id']);
            $status_data = $this->model_status->getStatusData($value['status_id']);
            $client_data = $this->model_client->getClientDataById($value['client_id']);            
            $sector_data = $this->model_sector->getSectorData($value['sector_id']);
            $standard_data = $this->model_standard->getStandardData($value['standard_id']);

            //--> Prepare the list of consultants to view in the datatable

            $consultant = json_decode($value['consultant_id']);
            $consultant_list = '';
           // Get the name of each consultant
            if (!$consultant == null) {
                foreach($consultant as $k=>$v){
                       $consultant_data = $this->model_user->getConsultantData($consultant[$k]);
                       $consultant_list = $consultant_list.' '.$consultant_data['name'];
                   }
            }       


            $buttons = '';

            $consultation_no = $value['consultation_no'];

            if(in_array('updateConsultation', $this->permission)) {
                $buttons .= '<a href="'.base_url('consultation/update/'.$value['id']).'" class="btn btn-default"><i class="fa fa-pencil"></i></a>';
                $consultation_no = '<a href="'.base_url('consultation/update/'.$value['id']).'">'.$value['consultation_no'].'</a>';}

            if(in_array('deleteConsultation', $this->permission)) {
                $buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-standard="#removeModal"><i class="fa fa-trash"></i></button>';}

            if(in_array('viewConsultation', $this->permission)) {
                $buttons .= '<a href="'.base_url('report_consultation/REP0I/'.$value['id']).'" target="_blank"  class="btn btn-default"><i class="fa fa-print"></i></a>';}

            $result['data'][$key] = array(
                $consultation_no,
                $value['description'],
                $standard_data['name'],
                $consultant_list,
                $sector_data['name'],
                $phase_data['code'],
                $status_data['status_name'],
                $value['date_creation'],
                $buttons
            );
        } // /foreach

        echo json_encode($result);
    }



//-----------------------------------------------------------------------------------------------------
//--                                                                                                 --
//--                                        D O C U M E N T                                          --
//--                                                                                                 --
//-----------------------------------------------------------------------------------------------------


    //--> It fetches the document data from the document table
    //    This function is called from the datatable ajax function

    public function fetchConsultationDocument($id)
    {
        $result = array('data' => array());

        $data = $this->model_consultation->getConsultationDocument($id);

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
                $value['doc_size'],
                $buttons
            );
        } // /foreach

        echo json_encode($result);
    }



    //    This function is invoked from another function to upload the documents into the assets folder
    //    of the client

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

        if ( ! $this->upload->do_upload('consultation_document')){
            $msg_error = 'This type of document is not allowed or the document is too large.';
            $this->session->set_flashdata('warning', $msg_error);
            redirect('client/update/'.$this->session->client_id, 'refresh');
            }
        else
            {
            //---> Create the document in the table document

            $data = array(
                'client_id' => $this->session->client_id,
                'consultation_id' => $this->session->consultation_id,
                'doc_size' => $this->upload->data('file_size'),
                'doc_type' => $this->upload->data('file_type'),
                'doc_name' => $this->upload->data('file_name'),
                'document_type_id' => $this->input->post('document_type'),
                'document_class_id' => $this->input->post('document_class'),
                'updated_by' => $this->session->user_id,
            );

            $create = $this->model_consultation->createDocument($data);

            if($create == true) {
                //--->  Upload the document
                $data = array('upload_data' => $this->upload->data());
                redirect('consultation/update/'.$this->session->consultation_id."?tab=document", 'refresh');
            }
            else {
                $msg_error = 'Error occurred';
                $this->session->set_flashdata('error', $msg_error);
                redirect('consultation/', 'refresh');
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
            $document_data = $this->model_consultation->getDocument($document_id);
            $doc_link = '/upload/documents/'.$document_data['directory'].'/'.$document_data['doc_name'];
            unlink(FCPATH . $doc_link);
            //--> Delete the document in the document table
            $delete = $this->model_consultation->removeDocument($document_id);
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

    //-----------------------------------------------------------------------------------------------------
    //--                                                                                                 --
    //--                                        Q U E S T I O N                                          --
    //--                                                                                                 --
    //-----------------------------------------------------------------------------------------------------


    public function captureQuestion($phase=null,$standardId=null)
    {
        if($phase==null && $standardId==null)
        {redirect('dashboard', 'refresh');}
        if($this->form_validation->run() == TRUE)
        {
            echo "Form Submitted";
        }
        else
        {
            $result = array();
            $question_data = $this->model_question->getConsultationQuestion($standardId,$phase);
            
            if($question_data!=null)
            {
                $result['status']="ok";
                $result['question'] = $question_data;
                for($i=0; $i<count($result['question']); $i++)
                {
                    $question_option=$this->model_question->getOptionData($result['question'][$i]['questionId']);
                    if($question_option!=null)
                    {
                        foreach($question_option as $k => $v) 
                        {
                            $result['question_option'][] = $v;
                        }
                    }
                }         
            }
            else
            {
                $result['status']="err";
                echo "No data captured from database";
            }
        }
        echo json_encode($result);
    }

    public function answerQuestion($question_id, $consultationId)
    {
        $this->form_validation->set_rules('response[]', ' ', 'trim|required');
        $this->form_validation->set_error_delimiters('<p class="alert alert-warning">','</p>');   
        if ($this->form_validation->run() == TRUE) 
        {
            $count_response = count($this->input->post('response'));
            $response = array();
            $trn=$this->session->username;
            for($x = 0; $x < $count_response; $x++) 
            {
                array_push($response,$this->input->post('response')[$x]);
            }  
            $data = array(
                'question_id' => $question_id,
                'user_id' =>  $trn,
                'consultation_id' => $consultationId,
                'answer' => json_encode($response),
                'updated_by' => $trn);
            
            //gets an ID of response if it exist, false if it does not exist
            $ifExist = $this->model_answer->ifExist($consultationId, $question_id);

            //check to see if a record of this question has already been answered by this user
            // if true then it will be updated else it will be created
            if($ifExist!=false) 
            {
                $success = $this->model_answer->update($data, $ifExist);
                if($success)
                {
                    $this->session->set_flashdata('success', 'Successfully updated');
                    redirect('consultation/update/'.$consultationId, 'refresh');
                }
                else
                {
                    $this->session->set_flashdata('errors', 'Error occurred!!');
                    redirect('consultation/update/'.$consultationId, 'refresh');
                }
            }
            else //create a record (response)
            {
                $success = $this->model_answer->create($data);
                if($success)
                {
                    $this->session->set_flashdata('success', 'Successfully created');
                    redirect('consultation/update/'.$consultationId, 'refresh');
                }
                else
                {
                    $this->session->set_flashdata('errors', 'Error occurred!!');
                    redirect('consultation/update/'.$consultationId, 'refresh');
                }
            }
        }
        else 
        {   
            $result = array();
            $ifExist = $this->model_answer->ifExist($consultationId, $question_id);
            if($ifExist)
            {
                $response_data = $this->model_answer->retrieveAnswer($ifExist);
                $response = json_decode($response_data['answer'],true);
                foreach($response as $k => $v)
                {
                    $result['question_response'][] = $v;
                }
            }
            $this->data['consultationId'] = $consultationId;            
            $question_data = $this->model_question->getQuestionData($question_id);
            $result['question'] = $question_data;
            $question_option = $this->model_question->getOptionData($question_data['id']);
            if($question_option!=null)
            {
                foreach($question_option as $k => $v) 
                {
                    $result['question_option'][] = $v;
                }
            }            
            $this->data['question_data'] = $result;
            $this->render_template('response/edit', $this->data); 
        }  
    }

    public function fetchQuestionData($phase=null,$standard_id=null, $consultation_id=null)
    {
        $result = array('data' => array());
        $data = $this->model_consultation->getConsultationQuestion($standard_id,$phase);
        foreach($data as $key => $value){
            $buttons = '';
            $buttons .= '<a href="'.base_url('consultation/answerQuestion/'.$value['question_id'].'/'.$consultation_id).'"class="btn btn-default"><i class="fa fa-pencil"></i></a>';
            $result['data'][$key] = array(
                $value['question_id'],
                $value['question'],
                $buttons
            );
        }
        echo json_encode($result);
    }

}

?>