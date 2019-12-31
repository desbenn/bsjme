<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Post extends Admin_Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->not_logged_in();

        $this->data['page_title'] = 'News';
    }



    //--> Redirects to the manage post page

	public function index()
	{
        if(!in_array('viewPost', $this->permission)) {
            redirect('dashboard', 'refresh');
        }

		$this->render_template('post/index', $this->data);
	}


    //--> It fetches the post data from the post table
    //    This function is called from the datatable ajax function

	public function fetchPostData()
	{
		$result = array('data' => array());

        $data = $this->model_post->getPostData();

		foreach ($data as $key => $value) {

            $category_data = $this->model_category->getCategoryData($value['category_id']);

            $buttons = '';

            if(in_array('updatePost', $this->permission)) {
                $buttons .= '<a href="'.base_url('post/update/'.$value['id']).'" class="btn btn-default"><i class="fa fa-pencil"></i></a>';}

            if(in_array('deletePost', $this->permission)) {
                $buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-target="#removeModal"><i class="fa fa-trash"></i></button>';}

			$active = ($value['active'] == 1) ? '<span class="label label-success">Active</span>' : '<span class="label label-warning">Inactive</span>';

            $client_visibility = ($value['client_visibility'] == 1) ? '<span class="label label-success">Visible</span>' : '<span class="label label-warning">Non Visible</span>';
            
			$result['data'][$key] = array(
			    $category_data['name'],
				$value['post_title'],
                $client_visibility,
				$value['date_from'],
				$value['date_to'],
				$value['posted_by'],
				$active,
				$buttons
			);
		} // /foreach

		echo json_encode($result);
	}


   //--> If the validation is not true (not valid), then it redirects to the create page.
   //    If the validation for each input field is valid then it inserts the data into the database
   //    and it sends the operation message into the session flashdata and display on the manage post page

	public function create()
	{
		if(!in_array('createPost', $this->permission)) {
            redirect('dashboard', 'refresh');
        }

        $this->form_validation->set_rules('category', 'Category', 'trim|required');
        $this->form_validation->set_rules('post_title', 'Title', 'trim|required');
		$this->form_validation->set_rules('post_text', 'Text', 'trim|required');
		$this->form_validation->set_rules('date_from', 'Date from', 'trim|required');
		$this->form_validation->set_rules('date_to', 'Date to', 'trim|required');
		$this->form_validation->set_rules('posted_by', 'Posted by', 'trim|required');
        $this->form_validation->set_error_delimiters('<p class="alert alert-warning">','</p>');


        if ($this->form_validation->run() == TRUE) {
            //--> true case, we are creating the post - everything is valid

            //--> Upload of image

            $config['upload_path'] = './upload/posts';
            $config['allowed_types'] = 'gif|jpg|png|pdf|xls|xlsx|docx|doc|pptx';
            $config['max_size'] = '4000';

            $this->load->library('upload', $config);


            if ( ! $this->upload->do_upload('post_image')) {
                if ($this->upload->data('file_name') == ''){$post_image = 'noimage.jpg';}
                else {$msg_error = 'This type of document is not allowed or the document is too large.';
                      $this->session->set_flashdata('warning', $msg_error);
                      redirect('post/update/'.$this->session->post_id, 'refresh');}
            } else {
                //--->  Upload the document
                $data = array('upload_data' => $this->upload->data());
                $post_image = $this->upload->data('file_name');
            }

            //--> Insert of the post

            $slug = url_title($this->input->post('post_title'));

          	$data = array(
                'category_id' => $this->input->post('category'),
        		'post_title' => $this->input->post('post_title'),
				'post_text' => $this->input->post('post_text'),
        		'date_from' => $this->input->post('date_from'),
				'date_to' => $this->input->post('date_to'),
                'doc_type' => $this->upload->data('file_type'),
                'post_slug' => $slug,
        		'posted_by' => $this->input->post('posted_by'),
        		'client_visibility' => $this->input->post('client_visibility'),
        		'active' => $this->input->post('active'),
                'post_image' => $post_image,
				'updated_by' => $this->session->user_id,
        	);

        	$create = $this->model_post->create($data);

            if($create == false) {
                $msg_error = 'Error occurred';
                $this->session->set_flashdata('error', $msg_error);
                redirect('post/create', 'refresh');}
            else {
                //The create return the client_id created if it's successful
                $post_id = $create;
                redirect('post/update/'.$post_id, 'refresh');}

        }
        else {
            //--> false case, we are preparing the drop-down list for the encoding of the post
            //    and opening the insert page

            $this->data['category'] = $this->model_category->getActiveCategory();

            $this->render_template('post/create', $this->data);
        }
	}




    //--> If the validation is not true (not valid), then it redirects to the edit post page
    //    If the validation is true (valid) then it updates the data into the database
    //    and it sends the operation message into the session flashdata and display on the manage post page

	public function update($post_id)
	{
        if(!in_array('updatePost', $this->permission)) {
            redirect('dashboard', 'refresh');}

        if(!$post_id) {redirect('dashboard', 'refresh');}

        $this->form_validation->set_rules('category', 'Category', 'trim|required');
        $this->form_validation->set_rules('post_title', 'Title', 'trim|required');
		$this->form_validation->set_rules('post_text', 'Text', 'trim|required');
		$this->form_validation->set_rules('date_from', 'Date from', 'trim|required');
		$this->form_validation->set_rules('date_to', 'Date to', 'trim|required');
		$this->form_validation->set_rules('posted_by', 'Posted by', 'trim|required');
        $this->form_validation->set_error_delimiters('<p class="alert alert-warning">','</p>');

        //--->  Validation of the form
        if ($this->form_validation->run() == TRUE) {
            // true case

            //--> Upload of image (find a solution to delete the other image??)

            $config['upload_path'] = './upload/posts';
            $config['allowed_types'] = 'gif|jpg|png|pdf|xls|xlsx|docx|doc|pptx';
            $config['max_size'] = '4000';

            $this->load->library('upload', $config);

            if ( ! $this->upload->do_upload('new_image')) {
                //If no change in the image we keep the last image
                $post_image = $this->input->post('post_image');
                $doc_type = $this->input->post('doc_type');
            } else {
                if ($this->input->post('post_image') <> 'noimage.jpg') {
                    // Delete the old document, but keep noimage.jpg as the default image
                    // if the user don't give any image
                    $doc_link = '/upload/posts/'.$this->input->post('post_image');
                    unlink(FCPATH . $doc_link); }
                //--->  Upload the document
                $data = array('upload_data' => $this->upload->data());
                $post_image = $this->upload->data('file_name');
                $doc_type = $this->upload->data('file_type');
            }
            //--> Insert of the post

            $slug = url_title($this->input->post('post_title'));

            $data = array(
                'category_id' => $this->input->post('category'),
        		'post_title' => $this->input->post('post_title'),
                'post_slug' => $slug,
        		'post_text' => $this->input->post('post_text'),
        		'date_from' => $this->input->post('date_from'),
        		'date_to' => $this->input->post('date_to'),
                'doc_type' => $doc_type,
				'posted_by' => $this->input->post('posted_by'),
                'client_visibility' => $this->input->post('client_visibility'),
                'active' => $this->input->post('active'),
                'post_image' => $post_image,
                'updated_by' => $this->session->user_id,
		        	);

            $update = $this->model_post->update($data, $post_id);

            if($update == true) {
                $msg_error = 'Successfully updated';
                $this->session->set_flashdata('success', $msg_error);
                redirect('post/', 'refresh');}
            else {
                $msg_error = 'Error occurred';
                $this->session->set_flashdata('error', $msg_error);
                redirect('post/update/'.$post_id, 'refresh');}
        }
        else {
            //---> false case, we prepare the drop-down list and fill the form for update

            $this->data['category'] = $this->model_category->getActiveCategory();

            $post_data = $this->model_post->getPostData($post_id);
            $this->data['post_data'] = $post_data;
            $this->render_template('post/edit', $this->data);
        }
	}



    //--> It removes the data from the database
    //    and it returns the response into the json format

	public function remove()
	{
        if(!in_array('deletePost', $this->permission)) {
            redirect('dashboard', 'refresh');}

        $post_id = $this->input->post('post_id');

       $response = '';
       $response = array();

        if($post_id) {

            //---> Validate if the information is used in post table
            $total_document = $this->model_post->checkIntegrity($post_id);
            //---> If no post have this information, we can delete
            if ($total_document == 0) {
                //--> Get the name of the document for deleting the document on the directory
                //    We don't delete noimage.jpg, it's the default when no image is given
                $document_data = $this->model_post->getPostData($post_id);
                if ($document_data['post_image'] <> 'noimage.jpg') {
                    // Delete the document
                    $doc_link = '/upload/posts/'.$document_data['post_image'];
                    unlink(FCPATH . $doc_link);}
                $delete = $this->model_post->remove($post_id);
                if($delete == true) {
                    $response['success'] = true;
                    $response['messages'] = 'Successfully deleted';}
                else {
                    $response['success'] = false;
                    $response['messages'] = 'Error in the database while deleting the information';}
                }

            else {
                //---> There is at least one document attached to the post
                $response['success'] = false;
                $response['messages'] = 'You must delete the documents attached before deleting the post.';}

        }
        else {
            $response['success'] = false;
            $response['messages'] = 'Refresh the page again';}

        echo json_encode($response);
    }



    public function view($offset = 0){

            //pagination config

            $config['base_url'] = base_url() . 'post/view';
            $config['total_rows'] = $this->model_post->countTotalPost();
            $config['per_page'] = 3;
            $config['uri_segment'] = 3;

            $config['full_tag_open'] = "<ul class='pagination'>";
            $config['full_tag_close'] = '</ul>';
            $config['num_tag_open'] = '<li>';
            $config['num_tag_close'] = '</li>';
            $config['cur_tag_open'] = '<li class="active"><a href="#">';
            $config['cur_tag_close'] = '</a></li>';
            $config['prev_tag_open'] = '<li>';
            $config['prev_tag_close'] = '</li>';
            $config['first_tag_open'] = '<li>';
            $config['first_tag_close'] = '</li>';
            $config['last_tag_open'] = '<li>';
            $config['last_tag_close'] = '</li>';

            $config['prev_link'] = '<i class="fa fa-long-arrow-left"></i>';
            $config['prev_tag_open'] = '<li>';
            $config['prev_tag_close'] = '</li>';


            $config['next_link'] = '<i class="fa fa-long-arrow-right"></i>';
            $config['next_tag_open'] = '<li>';
            $config['next_tag_close'] = '</li>';

            $config['attributes'] = array('class' => 'pagination-link');

            //Init pagination
            $this->pagination->initialize($config);

            $post_data = $this->model_post->get_posts(FALSE, $config['per_page'], $offset);
            $this->data['post_data'] = $post_data;
            $this->render_template('post/view', $this->data);


        }


    public function view_post($post_id)
    {
        if(!in_array('viewPost', $this->permission)) {
            redirect('dashboard', 'refresh');}

        if(!$post_id) {redirect('dashboard', 'refresh');}

        $post_data = $this->model_post->getPostData($post_id);
        $this->data['post_data'] = $post_data;
        $this->render_template('post/view_post', $this->data);

    }


    //-------------------------------------   DOCUMENT ------------------------------------------------------


    //--> It fetches the document data from the document table
    //    This function is called from the datatable ajax function

    public function fetchPostDocument($id)
    {
        $result = array('data' => array());

        $data = $this->model_post->getPostDocument($id);

        foreach ($data as $key => $value) {

            $link = base_url('upload/posts/'.$value['doc_name']);
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
                $value['doc_size'],
                $buttons
            );
        } // /foreach

        echo json_encode($result);
    }

    //--> It fetches the document data from the document table
    //    This function is called from the datatable ajax function

    public function fetchPostDocumentView($id)
    {
        $result = array('data' => array());

        $data = $this->model_post->getPostDocument($id);

        foreach ($data as $key => $value) {

            $link = base_url('upload/posts/'.$value['doc_name']);
            $doc_link = '<a href="'.$link.'" target="_blank" >'.($value['doc_name']).'</a>';

            $buttons = '';
            if(in_array('viewDocument', $this->permission)) {
                $buttons .= '<a href="'.$link.'" target="_blank" class="btn btn-default"><i class="fa fa-search"></i></a>';
            }

            $result['data'][$key] = array(
                $doc_link,
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

        $config['upload_path'] = './upload/posts/';
        $config['allowed_types'] = 'gif|jpg|png|pdf|xls|xlsx|docx|doc|pptx';
        $config['max_size'] = '4000';

        $this->load->library('upload', $config);

        if ( ! $this->upload->do_upload('post_document')){
            $msg_error = 'This type of document is not allowed or the document is too large.';
            $this->session->set_flashdata('warning', $msg_error);
            redirect('post/update/'.$this->session->post_id, 'refresh');
            }
        else
            {
            //---> Create the document in the table document

            $data = array(
                'post_id' => $this->session->post_id,
                'doc_size' => $this->upload->data('file_size'),
                'doc_type' => $this->upload->data('file_type'),
                'doc_name' => $this->upload->data('file_name'),
                'document_type_id' => 6,
                'updated_by' => $this->session->user_id,
            );

            $create = $this->model_post->createDocument($data);

            if($create == true) {
                //--->  Upload the document
                $data = array('upload_data' => $this->upload->data());
                redirect('post/update/'.$this->session->post_id, 'Refresh');}
            else {
                $msg_error = 'Error occurred';
                $this->session->set_flashdata('error', $msg_error);
                redirect('post/', 'refresh');}


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
            $document_data = $this->model_post->getDocument($document_id);
            $doc_link = '/upload/posts/'.$document_data['doc_name'];
            unlink(FCPATH . $doc_link);
            //--> Delete the document in the document table
            $delete = $this->model_post->removeDocument($document_id);
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


}
?>