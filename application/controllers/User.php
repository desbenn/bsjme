<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class User extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'User';

	}


	public function index()
	{
		if(!in_array('viewUser', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$this->render_template('user/index', $this->data);
	}


	//--> It retrieve the specific user information via a user id
	//    and returns the data in json format

	public function fetchUserDataById($id)
	{
		if($id) {
			$data = $this->model_user->getUserData($id);
			echo json_encode($data);
		}
	}

	public function fetchProfileData()
	{
		$data = $this->model_profile->getProfileData();
		echo json_encode($data);

	}


	//--> It retrieves all the user data from the database
	//    This function is called from the datatable ajax function
	//    The data is return based on the json format.

	public function fetchUserData()
	{
		$result = array('data' => array());

		$data = $this->model_user->getUserData();

		foreach ($data as $key => $value) {

			$profile_data = $this->model_profile->getProfileData($value['profile_id']);

			$buttons = '';
			$username = $value['username'];

			if(in_array('updateUser', $this->permission)) {
				$buttons .= '<button type="button" class="btn btn-default" onclick="editFunc('.$value['id'].')" data-toggle="modal" data-target="#editModal"><i class="fa fa-pencil"></i></button>';
				$username ='  <a data-target="#editModal" onclick="editFunc('.$value['id'].')" data-toggle="modal" href="#editModal">'.$value['name'].'</a>';
			}

			if(in_array('deleteUser', $this->permission)) {
				$buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-target="#removeModal"><i class="fa fa-trash"></i></button>';
			}

			$active = ($value['active'] == 1) ? '<span class="label label-success">Active</span>' : '<span class="label label-warning">Inactive</span>';


			$result['data'][$key] = array(
				$username,
				$value['email'],
				$value['name'],
				$value['phone'],
				$profile_data['name'].' ('.$value['profile_id'].')',
				$active,
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
		if(!in_array('createUser', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = array();

		$this->form_validation->set_rules('username', 'Username', 'trim|required|min_length[5]|max_length[12]|is_unique[user.username]');
		$this->form_validation->set_rules('email', 'Email', 'trim|required');
		$this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[5]');
		$this->form_validation->set_rules('cpassword', 'Confirm Password', 'trim|required|matches[password]');
		$this->form_validation->set_rules('name', 'Name', 'trim|required');

		$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

        if ($this->form_validation->run() == TRUE) {
        	$password = $this->password_hash($this->input->post('password'));
        	$data = array(
        		'username' => $this->input->post('username'),
        		'password' => $password,
        		'profile_id' => $this->input->post('profile'),
        		'email' => $this->input->post('email'),
        		'name' => $this->input->post('name'),
        		'phone' => $this->input->post('phone'),
        		'active' => $this->input->post('active'),
        		'updated_by' => $this->session->user_id,
        	);

        	$create = $this->model_user->create($data);
        	if($create == true) {
        		$response['success'] = true;
        		$response['messages'] = 'Successfully created';
        	}
        	else {
        		$response['success'] = false;
        		$response['messages'] = 'Error in the database while creating the information';
        	}
        }
        else {
        	$response['success'] = false;
        	foreach ($_POST as $key => $value) {
        		$response['messages'][$key] = form_error($key);
        	}
        }

        echo json_encode($response);
	}


	public function createUserClient($client_id)
	{
		if(!in_array('createUser', $this->permission)) {redirect('dashboard', 'refresh');}

		$response = array();

		//--> Get the information from the client entry

		$client_data = $this->model_client->getClientDataById($client_id);

		//--> Verify if the user already exists.  If yes, we send a message of warning, else we create

		$total_user = $this->model_user->getUsername($client_data['trn']);

        if ($total_user == 0) {

	        $password_temp = 'bsj'.$client_data['trn'];
	    	$password = $this->password_hash($password_temp);

	    	$data = array(
	    		'username' => $client_data['trn'],
	    		'password' => $password,
	    		'profile_id' => 4,    //for profile client
	    		'email' => $client_data['email'],
	    		'name' => $client_data['client_name'],
	    		'phone' => $client_data['phone'],
	    		'active' => 1,
	    		'updated_by' => $this->session->user_id,
	    	);

	    	$create = $this->model_user->create($data);

	    	if($create == true) {
	    		$msg_error = 'The user have been created.';
                $this->session->set_flashdata('success', $msg_error);
	    		redirect('consultation/update/'.$this->session->consultation_id."?tab=consultation", 'refresh');
	    	}
	    	else {
	    		$response['success'] = false;
	    		$response['messages'] = 'Error in the database while creating the user.';
	    	}
	    } else {
	    	$msg_error = 'A user with this TRN already exists.';
            $this->session->set_flashdata('warning', $msg_error);
            redirect('consultation/update/'.$this->session->consultation_id."?tab=consultation", 'refresh');
    	
	    }	
        
        echo json_encode($response);
	}




	public function password_hash($pass = '')
	{
		if($pass) {
			$password = password_hash($pass, PASSWORD_DEFAULT);
			return $password;
		}
	}


   //--> If the validation is not true (not valid), then it provides the validation error on the json format
   //    If the validation for each input is valid then it updates the data into the database and
   //    returns an appropriate message in the json format.

	public function update($id)
	{
		if(!in_array('updateUser', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$response = array();

		if($id) {

			// We have an update without changing the password
	        if(empty($this->input->post('edit_password')))
        		{
        		$this->form_validation->set_rules('edit_username', 'Username', 'trim|required|min_length[5]|max_length[12]');
				$this->form_validation->set_rules('edit_email', 'Email', 'trim|required');
				$this->form_validation->set_rules('edit_name', 'Name', 'trim|required');
				$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

        		if ($this->form_validation->run() == TRUE) {
		        	$data = array(
		        		'username' => $this->input->post('edit_username'),
		        		'profile_id' => $this->input->post('edit_profile'),
		        		'email' => $this->input->post('edit_email'),
		        		'name' => $this->input->post('edit_name'),
		        		'phone' => $this->input->post('edit_phone'),
		        		'active' => $this->input->post('edit_active'),
		        		'updated_by' => $this->session->user_id,
		        	);

			        $update = $this->model_user->update($data, $id);

		        	if($update == true) {
		        		$response['success'] = true;
		        		$response['messages'] = 'Successfully updated';
		        		}
		        	else {
		        		$response['success'] = false;
		        		$response['messages'] = 'Error in the database while updating the information';
		        		}
	        		}  //validation is true
		        else   //validation is false
		        	{
		        	$response['success'] = false;
		        	foreach ($_POST as $key => $value) {
		        		$response['messages'][$key] = form_error($key);}
		        	}
		        }  //end if we have an update without password

            else  //we have an update with the password included
            	{
		        	$this->form_validation->set_rules('edit_username', 'Username', 'trim|required|min_length[5]|max_length[12]');
					$this->form_validation->set_rules('edit_email', 'Email', 'trim|required');
					$this->form_validation->set_rules('edit_name', 'Name', 'trim|required');
		        	$this->form_validation->set_rules('edit_password', 'Password', 'trim|required|min_length[6]');
					$this->form_validation->set_rules('edit_cpassword', 'Confirm Password', 'trim|required|matches[edit_password]');
					$this->form_validation->set_error_delimiters('<p class="text-danger">','</p>');

					if($this->form_validation->run() == TRUE) {

						$password = $this->password_hash($this->input->post('edit_password'));

						$data = array(
			        		'username' => $this->input->post('edit_username'),
			        		'profile_id' => $this->input->post('edit_profile'),
			        		'email' => $this->input->post('edit_email'),
			        		'name' => $this->input->post('edit_name'),
			        		'phone' => $this->input->post('edit_phone'),
			        		'active' => $this->input->post('edit_active'),
			        		'password' => $password,
			        		'updated_by' => $this->session->user_id,
			        	);

			        	$update = $this->model_user->update($data, $id);

			        	if($update == true) {
			        		$response['success'] = true;
			        		$response['messages'] = 'Successfully updated';
			        		}
			        	else {
			        		$response['success'] = false;
			        		$response['messages'] = 'Error in the database while updating the information';
			        		}
					} // form validation is true for update with password
				else  //Validation is false and we send messages of errors
					{
					$response['success'] = false;
		        	foreach ($_POST as $key => $value) {
		        		$response['messages'][$key] = form_error($key);}
					}
				} // if password to update
			} // if we have an ID

		echo json_encode($response);
	}



	public function remove()
	{
		if(!in_array('deleteUser', $this->permission)) {
			redirect('dashboard', 'refresh');
		}

		$user_id = $this->input->post('user_id');

		$response = '';
		$response = array();

		if($user_id) {
			$delete = $this->model_user->remove($user_id);
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



//--------------------------------------------- My User --------------------------------------->

    public function my_user()
    {
        if(!in_array('viewMyUser', $this->permission)) {redirect('dashboard', 'refresh');}

        $id = $this->session->userdata('user_id');

        if($id) {
            $this->form_validation->set_rules('email', 'Email', 'trim|required');
            $this->form_validation->set_rules('name', 'Name', 'trim|required');


            if ($this->form_validation->run() == TRUE) {
                // true case
                if(empty($this->input->post('password'))) {
                    $data = array(
                        'email' => $this->input->post('email'),
                        'name' => $this->input->post('name'),
                        'phone' => $this->input->post('phone'),
                    );

                    $update = $this->model_user->update($data, $id);
                    if($update == true) {
                        $msg_error = 'Successfully updated';
                        $this->session->set_flashdata('success', $msg_error);
                        redirect('user/my_user/', 'refresh');
                    }
                    else {
                        $msg_error = 'Error occurred';
                        $this->session->set_flashdata('error', $msg_error);
                        redirect('user/my_user/', 'refresh');
                    }
                }
                else {
                    $this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[6]');
                    $this->form_validation->set_rules('cpassword', 'Confirm Password', 'trim|required|matches[password]');

                    if($this->form_validation->run() == TRUE) {

                        $password = $this->model_user->password_hash($this->input->post('password'));

                        $data = array(
                            'password' => $password,
                            'email' => $this->input->post('email'),
                            'name' => $this->input->post('name'),
                            'phone' => $this->input->post('phone'),
                            'updated_by' => $this->session->user_id,
                        );

                        $update = $this->model_user->update($data, $id);
                        if($update == true) {
                            $msg_error = 'Successfully updated';
                            $this->session->set_flashdata('success', $msg_error);
                            redirect('user/my_user/', 'refresh');
                        }
                        else {
                            $msg_error = 'Error occurred';
                            $this->session->set_flashdata('error', $msg_error);
                            redirect('user/my_user/', 'refresh');
                        }
                    }
                    else {
                        // false case
                        $user_data = $this->model_user->getUserData($id);
                        $this->data['user_data'] = $user_data;

                        $this->render_template('user/my_user', $this->data);
                    }

                }
            }
            else {
                // false case
                $user_data = $this->model_user->getUserData($id);
                $this->data['user_data'] = $user_data;

                $this->render_template('user/my_user', $this->data);
            }
        }
    }   

	

}