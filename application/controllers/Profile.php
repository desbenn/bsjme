<?php

class profile extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Profile';

	}


	//--> It redirects to the manage profile page
	//    As well as the profile data is also been passed to display on the view page

	public function index()
	{

		if(!in_array('viewProfile', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$profile_data = $this->model_profile->getProfileData();
		$this->data['profile_data'] = $profile_data;

		$this->render_template('profile/index', $this->data);
	}



	public function fetchProfileData()
	{
		$result = array('data' => array());

		$data = $this->model_profile->getProfileData();

		foreach ($data as $key => $value) {

			$buttons = '';
			$name = $value['name'];

			if(in_array('updateProfile', $this->permission)) {
                $buttons .= '<a href="'.base_url('profile/update/'.$value['id']).'" class="btn btn-default"><i class="fa fa-pencil"></i></a>';
                $name = '<a href="'.base_url('profile/update/'.$value['id']).'">'.$value['name'].'</a>';
            }

            if(in_array('deleteProfile', $this->permission) and $value['protected'] <> 1) { 
                $buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-target="#removeModal"><i class="fa fa-trash"></i></button>';
            }

            if($value['protected'] == 1 ) {
               $protected = '<div class="form-profile"><input type="checkbox" name="protected" checked class="minimal" disabled="disabled"></div>'; 
            } else {
               $protected = '<input type="checkbox" name="protected" disabled="disabled">';	
            }

			$result['data'][$key] = array(			
				$name,
				$protected,
				$buttons
			);
		} // /foreach

		echo json_encode($result);
	}


	//--> If the validation is not true (not valid), then it redirects to the create page.
	//    If the validation for each input is true then it inserts the data into the database
	//    and it sends the operation message into the session flashdata and display on the manage profile page

	public function create()
	{

		if(!in_array('createProfile', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$this->form_validation->set_rules('name', 'Name', 'required');
		$this->form_validation->set_error_delimiters('<p class="alert alert-warning">','</p>');

        if ($this->form_validation->run() == TRUE) {
            // true case
            $permission = serialize($this->input->post('permission'));

        	$data = array(
        		'name' => $this->input->post('name'),
        		'permission' => $permission,
        		'protected' => $this->input->post('protected')
        	);

        	$create = $this->model_profile->create($data);

        	if($create == true) {
        		$msg_error = 'Successfully created';
        		$this->session->set_flashdata('success', $msg_error);
        		redirect('profile/', 'refresh');
        	}
        	else {
        		$msg_error = 'Error occurred';
                $this->session->set_flashdata('errors', $msg_error);
        		redirect('profile/create', 'refresh');
        	}
        }
        else {
            // false case
            $this->render_template('profile/create', $this->data);
        }
	}


	//--> If the validation is not true (not valid), then it redirects to the edit profile page
	//    If the validation is true (valid) then it updates the data into the database
	//    and it sends the operation message into the session flashdata and display on the manage profile page

	public function update($id = null)
	{

		if(!in_array('updateProfile', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		if($id) {

			$this->form_validation->set_rules('name', 'Name', 'required');
			$this->form_validation->set_error_delimiters('<p class="alert alert-warning">','</p>');

			if ($this->form_validation->run() == TRUE) {
	            // true case
	            $permission = serialize($this->input->post('permission'));

	        	$data = array(
	        		'name' => $this->input->post('name'),
	        		'permission' => $permission,
	        		'protected' => $this->input->post('protected')
	        	);

	        	$update = $this->model_profile->update($data, $id);

	        	if($update == true) {
	        		$msg_error = 'Successfully updated';
        		    $this->session->set_flashdata('success', $msg_error);
	        		redirect('profile/', 'refresh');
	        	}
	        	else {
	        		$msg_error = 'Error occurred';
                    $this->session->set_flashdata('errors', $msg_error);
	        		redirect('profile/edit/'.$id, 'refresh');
	        	}
	        }
	        else {
	            // false case
	            $profile_data = $this->model_profile->getProfileData($id);
				$this->data['profile_data'] = $profile_data;
				$this->render_template('profile/edit', $this->data);
	        }
		}
	}



	//--> It removes the status information from the database
	//    and returns the json format operation messages

	public function remove()
	{
		if(!in_array('deleteProfile', $this->permission)) {
			redirect('dashboard', 'refresh');}

		$profile_id = $this->input->post('profile_id');

        $response = '';
		$response = array();

		if($profile_id) {
			//---> Validate if the information is used in user table
			$total_user = $this->model_profile->checkIntegrity($profile_id);
			//---> If no user have this information, we can delete
            if ($total_user == 0) {
				$delete = $this->model_profile->remove($profile_id);
				if($delete == true) {
					$response['success'] = true;
					$response['messages'] = 'Successfully deleted';}
				else {
					$response['success'] = false;
					$response['messages'] = 'Error in the database while deleting the information';}
				}

			else {
				//---> There is at least one user having this information
				$response['success'] = false;
				$response['messages'] = 'At least one user have this profile.  You cannot delete.';}

		}
		else {
			$response['success'] = false;
			$response['messages'] = 'Refresh the page again';}

		echo json_encode($response);
	}

	

}