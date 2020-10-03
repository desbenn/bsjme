<?php

class Model_internal_cost_plan extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
    }
	
	public function getInternalCostPlanDataByTaId($id=null)
	{
		if($id){
			$sql = "SELECT internal_cost_plan.*,billing_item.type as 'budget_type', billing_item.name as 'item_name',(SELECT name FROM user where internal_cost_plan.updated_by=user.id) as 'updated'  
			FROM internal_cost_plan
			LEFT JOIN billing_item on internal_cost_plan.billing_item_id = billing_item.id
			where ta_id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->result_array();
		}
		
	}

	public function getInternalCostPlanItem($id = null)
	{
		if($id) {
			$sql = "SELECT * FROM internal_cost_plan where id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT * FROM internal_cost_plan";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

    public function create($data)
	{
		if($data) {
			$insert = $this->db->insert('internal_cost_plan', $data);
			return ($insert == true) ? true : false;
		}
	}

	public function remove($id)
	{

		if($id) {
			
			// delete the internal cost plan item
			$this->db->where('id', $id);
			$delete = $this->db->delete('internal_cost_plan');
		    return ($delete == true) ? true : false;

		}
	}

	
}