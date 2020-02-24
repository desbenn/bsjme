<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Program extends Admin_Controller 
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Program';
        
	}

	public function index()
	{
        if(!in_array('viewProgram', $this->permission)) {redirect('dashboard', 'refresh');}

		$this->render_template('program/index', $this->data);	
	}



    public function fetchProgramDataById($id) 
    {
        if($id) {
            $data = $this->model_program->getProgramData($id);
            echo json_encode($data);
        }

        return false;
    }


	public function fetchProgramData()
	{
		$result = array('data' => array());

		$data = $this->model_program->getProgramData();

		foreach ($data as $key => $value) {

			$buttons = '';
            $name = $value['name'];

			if(in_array('updateProgram', $this->permission)) {
                $buttons .= '<a href="'.base_url('program/update/'.$value['id']).'" class="btn btn-default"><i class="fa fa-pencil"></i></a>';
                $name = '<a href="'.base_url('program/update/'.$value['id']).'">'.$value['name'].'</a>';
            }

            if(in_array('deleteProgram', $this->permission)) { 
                $buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-target="#removeModal"><i class="fa fa-trash"></i></button>';
            }

			$result['data'][$key] = array(	
                $name,		
                $value['code'],
				$value['standard_name'],
				$value['clause_code'],                
				$buttons
			);
		} // /foreach

		echo json_encode($result);
	}	


	public function create()
	{
		if(!in_array('createProgram', $this->permission)) {redirect('dashboard', 'refresh');}
        $this->form_validation->set_rules('name', 'Program name', 'trim|required');
        $this->form_validation->set_error_delimiters('<p class="alert alert-warning">','</p>');


        if ($this->form_validation->run() == TRUE) { 
		
            $data = array(
                'active' => $this->input->post('active'),
                'name' => $this->input->post('name'),
                'code' => $this->input->post('code'),
                'standard_id' => $this->input->post('standard'),
                'clause_id' => $this->input->post('clause'),
                'remark' => $this->input->post('remark'),
                'updated_date' => date('Y-m-d H:i:s'),      
                'updated_by' => $this->session->user_id,
            );  
            
            $program_id = $this->model_program->create($data);
            
            if($program_id) {

                $count_phase = count($this->input->post('phase'));
                for($x = 0; $x < $count_phase; $x++) {
                    $phase = array(
                        'program_id' => $program_id,
                        'phase_id' => $this->input->post('phase')[$x],
                        'sequence' => $this->input->post('sequence')[$x],
                    );

                    $this->db->insert('program_phase', $phase);
                }
                   

                $this->session->set_flashdata('success', 'Successfully created');
                redirect('program/', 'refresh');
            }
            else {
                $this->session->set_flashdata('errors', 'Error occurred!!');
                redirect('program/', 'refresh');
            }

        }
        else {
            // false case 
            $this->data['standard'] = $this->model_dynamic_dependent->fetch_standard();     	
			$this->data['phase'] = $this->model_phase->getActivePhase();  

            $this->render_template('program/create', $this->data);
        }	
	}

    

	public function update($program_id)
	{      
        if(!in_array('updateProgram', $this->permission)) {redirect('dashboard', 'refresh');}

        if(!$program_id) {redirect('dashboard', 'refresh');}

        $this->form_validation->set_rules('name', 'Program name', 'trim|required');
        $this->form_validation->set_error_delimiters('<p class="alert alert-warning">','</p>');

        if ($this->form_validation->run() == TRUE) {

                $data = array(
                    'active' => $this->input->post('active'),                    
                    'name' => $this->input->post('name'),
                    'code' => $this->input->post('code'),
                    'standard_id' => $this->input->post('standard'),
                    'clause_id' => $this->input->post('clause'),
                    'remark' => $this->input->post('remark'),
                    'updated_date' => date('Y-m-d H:i:s'),      
                    'updated_by' => $this->session->user_id,
                );
          

            $update = $this->model_program->update($data,$program_id);
            
            if($update == true) {

                // First remove all the phase data 
                $this->db->where('program_id', $program_id);
                $this->db->delete('program_phase');

                // and create again the phase with the right data
                $count_phase = count($this->input->post('phase'));

                for($x = 0; $x < $count_phase; $x++) {
                    $phase = array(
                        'program_id' => $program_id,
                        'phase_id' => $this->input->post('phase')[$x], 
                        'sequence' => $this->input->post('sequence')[$x],          
                    );
                    $this->db->insert('program_phase', $phase);
                }

                $this->session->set_flashdata('success', 'Successfully updated');
                redirect('program/', 'refresh');
            }
            else {
                $this->session->set_flashdata('errors', 'Error occurred!!');
                redirect('program/', 'refresh');
            }
        }
        else {
            
            $this->data['standard'] = $this->model_standard->getActiveStandard();   
            $this->data['clause'] = $this->model_clause->getActiveClause();    
			$this->data['phase'] = $this->model_phase->getActivePhase();			
            
			$result = array();
            $program_data = $this->model_program->getProgramData($program_id);

            $result['program'] = $program_data;
            $program_phase = $this->model_program->getProgramPhaseData($program_data['id']);

            foreach($program_phase as $k => $v) {
                $result['program_phase'][] = $v;
           }

            $this->data['program_data'] = $result;
            $this->render_template('program/edit', $this->data); 
        }   
	}


	public function remove()
	{
        if(!in_array('deleteProgram', $this->permission)) {redirect('dashboard', 'refresh');}
        
        $program_id = $this->input->post('program_id');

        $response = array();

        if($program_id) {
            //---> Validate if the information is used in consultation table
            $total_rows = $this->model_program->checkIntegrity($program_id);
            //---> If no consultation have this information, we can delete
            if ($total_rows == 0) {
                $delete = $this->model_program->remove($program_id);
                if($delete == true) {
                    $response['success'] = true;
                    $response['messages'] = 'Successfully deleted';}
                else {
                    $response['success'] = false;
                    $response['messages'] = 'Error in the database while deleting the information';}
                }

            else {
                //---> There is at least one consultation having this information
                $response['success'] = false;
                $response['messages'] = 'At least one client uses this information.  You cannot delete.';}

        }
        else {
            $response['success'] = false;
            $response['messages'] = 'Refresh the page again';}

        echo json_encode($response);
    }


}