<?php

class Model_post extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}


	public function getPostData($id = null)
	{
		if($id) {
			$sql = "SELECT post.*,post.id,name
			FROM post
			LEFT JOIN category ON post.category_id = category.id
			WHERE post.id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT * FROM post ORDER BY id DESC";
		$query = $this->db->query($sql);
		return $query->result_array();
	}


	//--> This function is for the page News.  We show the posts that are active
	//    and the today's date is between date_from and date_to of the post
	public function get_posts($post_slug = FALSE, $limit = FALSE, $offset = FALSE){

		if($limit){
			$this->db->limit($limit, $offset);
		}
		if($post_slug === FALSE){
			$this->db->select('post.*,post.id AS post_id,name');
			$this->db->order_by('post.id', 'DESC');
			$this->db->join('category','category.id = post.category_id');
			$this->db->where('post.active',1);
			$this->db->where('date_from <=', date('Y-m-d'));
			$this->db->where('date_to >=', date('Y-m-d'));
			$query = $this->db->get('post');
			return $query->result_array();
		}

		$query = $this->db->get_where('post',array('post_slug' => $post_slug));
		return $query->row_array();

		}


	public function create($data)
	{
		if($data) {
			$insert = $this->db->insert('post', $data);
			$insert_id = $this->db->insert_id();
			return ($insert == true) ? $insert_id : false;
		}

	}


	public function update($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('post', $data);
			return ($update == true) ? true : false;
		}
	}

	public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('post');
			return ($delete == true) ? true : false;
		}
	}


	public function getPostCategory($id = null)
	{
		$sql = "SELECT * FROM post WHERE category_id = ?";
		$query = $this->db->query($sql, array($id));
		return $query->result_array();

	}


	public function createDocument($data)
	{
		if($data) {
			$insert = $this->db->insert('document', $data);
			return ($insert == true) ? true : false;
		}
	}

	public function removeDocument($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('document');
			return ($delete == true) ? true : false;
		}
	}


	public function getDocument($id = null)
	{
		$sql = "SELECT document.*
		FROM document
		WHERE document.id = ?";
		$query = $this->db->query($sql, array($id));
		return $query->row_array();

	}


	public function getPostDocument($post_id)
	{

		//only document type related to post (type = 6)

		$sql = "SELECT *
		FROM document
		WHERE post_id = ? AND document_type_id = 6";
		$query = $this->db->query($sql, array($post_id));
		return $query->result_array();


	}



	//--> Used for counting the post active and with the dates interval
	//    Used for the pagination of the News page
	public function countTotalPost()
	{

		$sql = "SELECT *
			    FROM post
			    WHERE active = 1
			    AND CURDATE() BETWEEN date_from and date_to";
		$query = $this->db->query($sql);
		return $query->num_rows();
	}


		//---> Validate if the category is used in table post
	public function checkIntegrity($post_id)
	{
		$sql = "SELECT * FROM document WHERE post_id = ?";
		$query = $this->db->query($sql, array($post_id));
		return $query->num_rows();

	}


}