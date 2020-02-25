<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Question extends Admin_Controller 
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Question';
        
	}

	public function index()
	{
        if(!in_array('viewQuestion', $this->permission)) {redirect('dashboard', 'refresh');}

		$this->render_template('question/index', $this->data);	
	}



    public function fetchQuestionDataById($id) 
    {
        if($id) {
            $data = $this->model_question->getQuestionData($id);
            echo json_encode($data);
        }

        return false;
    }


	public function fetchQuestionData()
	{
		$result = array('data' => array());

		$data = $this->model_question->getQuestionData();

		foreach ($data as $key => $value) {

			$buttons = '';
            $question = $value['question'];


			if(in_array('updateQuestion', $this->permission)) {
                $buttons .= '<a href="'.base_url('question/update/'.$value['id']).'" class="btn btn-default"><i class="fa fa-pencil"></i></a>';
                $question = '<a href="'.base_url('question/update/'.$value['id']).'">'.$value['question'].'</a>';
            }

            if(in_array('deleteQuestion', $this->permission)) { 
                $buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-target="#removeModal"><i class="fa fa-trash"></i></button>';
            }

			$result['data'][$key] = array(			
				$value['standard_name'],
				$value['clause_code'],
				$value['sub_clause_code'].' - '.$value['sub_clause_name'],
                $question,
				$value['question_type_name'],
				$buttons
			);
		} // /foreach

		echo json_encode($result);
	}	


	public function create()
	{
		if(!in_array('createQuestion', $this->permission)) {redirect('dashboard', 'refresh');}
        $this->form_validation->set_rules('question', 'Question', 'trim|required');
        $this->form_validation->set_error_delimiters('<p class="alert alert-warning">','</p>');


        if ($this->form_validation->run() == TRUE) { 
		
            $data = array(
                'active' => $this->input->post('active'),
                'choice' => $this->input->post('choice'),
                'upload_document' => $this->input->post('upload_document'),
                'sub_clause_id' => $this->input->post('sub_clause'),
                'question' => $this->input->post('question'),
                'remark' => $this->input->post('remark'),
                'question_type_id' => $this->input->post('question_type'),
                'updated_date' => date('Y-m-d H:i:s'),      
                'updated_by' => $this->session->user_id,
            );  
            
            $question_id = $this->model_question->create($data);
            
            if($question_id) {

                if (!empty($this->input->post('option'))) {
                    $count_option = count($this->input->post('option'));
                    for($x = 0; $x < $count_option; $x++) {
                        $option = array(
                            'question_id' => $question_id,
                            'option_desc' => $this->input->post('option')[$x],
                        );

                        $this->db->insert('question_option', $option);
                    }
                }    

                $this->session->set_flashdata('success', 'Successfully created');
                redirect('question/', 'refresh');
            }
            else {
                $this->session->set_flashdata('errors', 'Error occurred!!');
                redirect('question/', 'refresh');
            }

        }
        else {
            // false case 
            $this->data['standard'] = $this->model_dynamic_dependent->fetch_standard();     	
			$this->data['question_type'] = $this->model_question->getActiveQuestionType();  	

            $this->render_template('question/create', $this->data);
        }	
	}

    

	public function update($question_id)
	{      
        if(!in_array('updateQuestion', $this->permission)) {redirect('dashboard', 'refresh');}

        if(!$question_id) {redirect('dashboard', 'refresh');}

        $this->form_validation->set_rules('question', 'Question', 'trim|required'); 
        $this->form_validation->set_error_delimiters('<p class="alert alert-warning">','</p>');

        if ($this->form_validation->run() == TRUE) {

                $data = array(
                    'active' => $this->input->post('active'),
                    'choice' => $this->input->post('choice'),
                    'sub_clause_id' => $this->input->post('sub_clause'),
                    'upload_document' => $this->input->post('upload_document'),
                    'question' => $this->input->post('question'),
                    'remark' => $this->input->post('remark'),
                    'question_type_id' => $this->input->post('question_type'),
                    'updated_date' => date('Y-m-d H:i:s'),      
                    'updated_by' => $this->session->user_id,
                );
          

            $update = $this->model_question->update($data,$question_id);
            
            if($update == true) {

                // First remove all the option data 
                $this->db->where('question_id', $question_id);
                $this->db->delete('question_option');

                // and create again the option with the right data

                 if (!empty($this->input->post('option'))) {
                    $count_option = count($this->input->post('option'));               
                     for($x = 0; $x < $count_option; $x++) 
                     {
                        $option = array(
                            'question_id' => $question_id,
                            'option_desc' => $this->input->post('option')[$x]           
                    );
                    $this->db->insert('question_option', $option);
                    }                
                }

                $this->session->set_flashdata('success', 'Successfully updated');
                redirect('question/', 'refresh');
            }
            else {
                $this->session->set_flashdata('errors', 'Error occurred!!');
                redirect('question/', 'refresh');
            }
        }
        else {
            
            $this->data['standard'] = $this->model_standard->getActiveStandard();   
            $this->data['clause'] = $this->model_clause->getActiveClause();             
            $this->data['sub_clause'] = $this->model_sub_clause->getActiveSubClause();           
            $this->data['question_type'] = $this->model_question->getActiveQuestionType();  

            $result = array();
            $question_data = $this->model_question->getQuestionData($question_id);
            $result['question'] = $question_data;

            $question_option = $this->model_question->getOptionData($question_data['id']);

            foreach($question_option as $k => $v) {
                $result['question_option'][] = $v;
           }

            $this->data['question_data'] = $result;
            $this->render_template('question/edit', $this->data); 
        }   
	}


	public function remove()
	{
        if(!in_array('deleteQuestion', $this->permission)) {redirect('dashboard', 'refresh');}
        
        $question_id = $this->input->post('question_id');

        $response = array();

        if($question_id) {
            $delete = $this->model_question->remove($question_id);
            if($delete == true) {
                $response['success'] = true;
                $response['messages'] = "Successfully removed"; 
            }
            else {
                $response['success'] = false;
                $response['messages'] = "Error in the database while removing the question information";
            }
        }
        else {
            $response['success'] = false;
            $response['messages'] = "Refresh the page again!!";
        }

        echo json_encode($response);
	}


 


 //---------------------------------------------- Question option ----------------------------------------------->

    //-->  For creation of drop-down list 

    public function fetchQuestionOption($question_id) 
    {
        $data = $this->model_question->getQuestionOptionData($question_id);
        echo json_encode($data);

    }   


    public function fetchQuestionOptionDataById($id) 
    {
        if($id) {
            $data = $this->model_question->getQuestionOptionDataById($id);
            echo json_encode($data);
        }

        return false;
    }


 

}