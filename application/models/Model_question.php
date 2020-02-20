<?php 

class Model_question extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	
	public function getQuestionData($id = null)
	{
		if($id) {
			$sql = "SELECT question.id,choice,question,remark,upload_document,
			            sub_clause_id,sub_clause.name AS 'sub_clause_name',
			            sub_clause.code AS 'sub_clause_code',
			            clause.id AS 'clause_id',clause.code AS 'clause_code',clause.name AS 'clause_name',
						standard.id AS 'standard_id',standard.name AS 'standard_name',
						question_type.name AS 'question_type_name',question_type_id,question.active
		 	FROM question
			      JOIN sub_clause ON question.sub_clause_id = sub_clause.id 
				  JOIN clause ON sub_clause.clause_id = clause.id
				  JOIN standard ON clause.standard_id = standard.id
				  JOIN question_type ON question.question_type_id = question_type.id
			WHERE question.id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT question.id,choice,question,remark,upload_document,
			            sub_clause_id,sub_clause.name AS 'sub_clause_name',
			            sub_clause.code AS 'sub_clause_code',
			            clause.id AS 'clause_id',clause.code AS 'clause_code',clause.name AS 'clause_name',
						standard.id AS 'standard_id',standard.name AS 'standard_name',
						question_type.name AS 'question_type_name',question_type_id,question.active
		 	FROM question
			      JOIN sub_clause ON question.sub_clause_id = sub_clause.id 
				  JOIN clause ON sub_clause.clause_id = clause.id
				  JOIN standard ON clause.standard_id = standard.id
				  JOIN question_type ON question.question_type_id = question_type.id
			ORDER BY standard.name,clause.code,sub_clause.code,question ASC";
		$query = $this->db->query($sql);
		return $query->result_array();
	}



	public function getActiveQuestionType()
	{
		$sql = "SELECT * FROM question_type WHERE active = ? ORDER BY name ASC";
		$query = $this->db->query($sql, array(1));
		return $query->result_array();
	}

	

	

	// get the option question data
	public function getOptionData($question_id = null)
	{
		if(!$question_id) {
			return false;
		}

		$sql = "SELECT *
		 		FROM question_option 					
				WHERE question_id = ?";
		$query = $this->db->query($sql, array($question_id));
		return $query->result_array();
	}


	// get the option question data
	public function getQuestionOptionDataById($id = null)
	{
		if(!$id) {return false;}

		$sql = "SELECT question_option.id
				FROM question_option 
				WHERE id = ?";
		$query = $this->db->query($sql, array($id));
		return $query->row_array();
	}



	public function create($data)
	{
            
		$insert = $this->db->insert('question', $data);
		$question_id = $this->db->insert_id();
		return ($question_id) ? $question_id : false;
	}



	public function update($data,$id)
	{
		if($id) {	

            $this->db->where('id', $id);
			$update = $this->db->update('question', $data);
			return ($update == true) ? true : false;
		}

	}


    public function password_hash($pass = '')
	{
		if($pass) {
			$password = password_hash($pass, PASSWORD_DEFAULT);
			return $password;
		}
	}	


	public function update_question_option($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('question_option', $data);
			return ($update == true) ? true : false;
		}
	}

	

	public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('question');

			$this->db->where('question_id', $id);
			$delete_option = $this->db->delete('question_option');

			return ($delete == true && $delete_option) ? true : false;

		}
	}



}