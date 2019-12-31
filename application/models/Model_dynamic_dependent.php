<?php 

class Model_dynamic_dependent extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}


 function fetch_standard()
 {
  $this->db->order_by("name", "ASC");
  $query = $this->db->get("standard");
  return $query->result();
 }



 function fetch_clause($standard_id)
 {
  $this->db->where('standard_id', $standard_id);
  $this->db->order_by('name', 'ASC');
  $query = $this->db->get('clause');
  $output = '<option value="">Select Clause</option>';
  foreach($query->result() as $row)
  {
   $output .= '<option value="'.$row->id.'">'.$row->name.'</option>';
  }
  return $output;
 }



 function fetch_sub_clause($clause_id)
 {
  $this->db->where('clause_id', $clause_id);
  $this->db->order_by('name', 'ASC');
  $query = $this->db->get('sub_clause');
  $output = '<option value="">Select Sub Clause</option>';
  foreach($query->result() as $row)
  {
   $output .= '<option value="'.$row->id.'">'.$row->code.' -'.$row->name.'</option>';
  }
  return $output;
 }
}

?>