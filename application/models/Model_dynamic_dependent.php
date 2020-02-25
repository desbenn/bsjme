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



 function fetch_program()
 {
  $this->db->order_by("name", "ASC");
  $query = $this->db->get("program");
  return $query->result();
 }




function fetch_phase($program_id)
 {

  $this->db->select('phase.id,code,name,sequence');
  $this->db->from('program_phase');
  $this->db->join('phase', 'program_phase.phase_id = phase.id');
  $this->db->where('program_id', $program_id);
  $this->db->order_by('sequence', 'ASC');
  $query = $this->db->get();
  $output = '<option value="">Select Phase</option>';
  foreach($query->result() as $row)
  {
   $output .= '<option value="'.$row->id.'">'.$row->name.'</option>';
  }
  return $output;
 }



 function fetch_status($phase_id)
 {
  $this->db->where('phase_id', $phase_id);
  $this->db->order_by('name', 'ASC');
  $query = $this->db->get('status');
  $output = '<option value="">Select Status</option>';
  foreach($query->result() as $row)
  {
   $output .= '<option value="'.$row->id.'">'.$row->name.'</option>';
  }
  return $output;
 }

}

?>