<?php

class Model_billing extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
    }
    
    //--> Get the data
	public function getBillingData($id = null)
	{
		if($id) {
			$sql = "SELECT * FROM billing_item where id = ?";
			$query = $this->db->query($sql, array($id));
			return $query->row_array();
		}

		$sql = "SELECT * FROM billing_item";
		$query = $this->db->query($sql);
		return $query->result_array();
	}

	public function createItem($data)
	{
		if($data) {
			$insert = $this->db->insert('billing_item', $data);
			return ($insert == true) ? true : false;
		}
    }

    public function update($data, $id)
	{
		if($data && $id) {
			$this->db->where('id', $id);
			$update = $this->db->update('billing_item', $data);
			return ($update == true) ? true : false;
		}
    }
    
    public function remove($id)
	{
		if($id) {
			$this->db->where('id', $id);
			$delete = $this->db->delete('billing_item');
			return ($delete == true) ? true : false;
		}
	}
    


}