<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Technical_advice extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Technical Advice';
        //$this->data['active_tab'] =  $this->input->get('tab') ?: 'technicalAdvice';
        $this->log_module = 'Technical Advice';

	}


    //--> It only redirects to the manage technical advice page

	public function index()
	{
        if(!in_array('viewTechnicalAdvice', $this->permission)) 
        {
            redirect('dashboard', 'refresh');
        } 

        $this->data['consultant'] = $this->model_user->getActiveConsultant(); 
        $this->data['activity'] = $this->model_activity->getActiveActivity(); 

		$this->render_template('technical_advice/index', $this->data);
    }  
    
    //--> It fetches the technical advice data from the technical advice table
    //    This function is called from the datatable ajax function

	public function fetchTechnicalAdviceData()
	{
        
		$result = array('data' => array());

       
        //--> For the Profile Consultant, we read only the consultation where they are consultant

        if ($this->session->profile == 3) {
            $consultant = $this->session->user_id;
        } 
        else {
            $consultant = $this->input->get('consultant') ?: NULL; 
        }

        if ($consultant <> "all") {
            $consultant = '"'.$consultant.'"';
        }

        $activity = $this->input->get('activity') ?: NULL;

        //--> If the profile is a reader only, he can see all the consultations
        //    but will have only access to the print of the consultation
        if ($this->session->profile == 6) {
            $consultant = 'all';
        }
        

        //--> If the Profile is a Client, we must read only the consultation of the client
        //    The client trn is the username given to the client to access the system  
        //    If not we will read all the consultation depending on the security given (consultant or coordinator) 

        if ($this->session->profile == 4) {  
           $trn = "'".$this->session->username."'";
           $data = $this->model_technical_advice->getTechnicalAdviceByClient($trn);
        } else {
            
            $data = $this->model_technical_advice->getTechnicalAdviceByConsultant($consultant,$activity);
        }    
        
        foreach ($data as $key => $value) 
        {
            //Retrieve client information such as client name/ business name
            $client_data = $this->model_client->getClientDataById($value['client_id']);   
                     
            //--> Prepare the list of consultants to view in the datatable

            $consultant = json_decode($value['consultant_id']);
            
            $consultant_list = '';
           //--> Get the name of each consultant
            if (!$consultant == null) 
            {
                foreach($consultant as $k=>$v)
                {
                    $consultant_data = $this->model_user->getConsultantData($consultant[$k]);
                    $consultant_list = $consultant_list.' '.$consultant_data['name'];
                }
            }                   

            //$technical_advice_no = $value['id'];  

            $buttons = '';

            if(in_array('updateTechnicalAdvice', $this->permission)) 
            {
                $buttons .= '<a href="'.base_url('technical_advice/update/'.$value['id']).'" class="btn btn-default"><i class="fa fa-pencil"></i></a>';
            }
            if(in_array('deleteTechnicalAdvice', $this->permission)) 
            {
                $buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-target="#removeModal"><i class="fa fa-trash"></i></button>';
            }

            if(in_array('viewTechnicalAdvice', $this->permission)) 
            {                
                $buttons .= '<a href="'.base_url('technical_advice/timeline/'.$value['id']).'" class="btn btn-default"><i class="fa fa-clock-o"></i></a>';
                $buttons .= '<a href="'.base_url('report_consultation/REP0I/'.$value['id']).'" target="_blank"  class="btn btn-default"><i class="fa fa-print"></i></a>';
            }

            $activity = '';            

            switch ($value['activity_id']) 
            {
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

			$result['data'][$key] = array(
                $client_data['company_name'],
                $consultant_list,
                $activity,
                $value['date_created'],
				$buttons
            );
		} // /foreach
		echo json_encode($result);
    }
    
    public function remove()
    {
        if(!in_array('deleteTechnicalAdvice', $this->permission)) {
            redirect('dashboard', 'refresh');
        }

        $ta_id = $this->input->post('ta_id');

        $response = '';
        $response = array();

        if($ta_id) {
            //--> Get the old data before deleting
            //$old_data = $this->model_technical_advice->getTechnicalAdviceData($ta_id);
            $delete = $this->model_technical_advice->remove($ta_id);
            if($delete == true) {
                $response['success'] = true;
                $response['messages'] = 'Successfully deleted';
                //--> Log Action
                //  $this->model_log->create(array(
                //     'user_id' => $this->session->user_id,
                //     'module' => $this->log_module,
                //     'action' => 'Delete',
                //     'subject_id' => $ta_id,
                //     'client_id' => null,
                //     'consultation_id' => null,
                //     'ta_id' => $ta_id,
                //     'remark' => 'Delete Technical Advice '.$client_id,
                //     'attributes' => $old_data
                // ));
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

}

?>