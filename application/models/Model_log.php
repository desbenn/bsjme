<?php

class Model_log extends CI_Model
{
	public function __construct()
	{
		parent::__construct();
	}

	public function create($data)
	{
		$log_data = array(
			'user_id' => $data['user_id'],
			'timestamp' => date('Y-m-d H:i:s'),
			'module' => $data['module'],
			'action' => $data['action'],
			'subject_id' => $data['subject_id'],
			'client_id' => $data['client_id'],
			'consultation_id' => $data['consultation_id'],
			'remark' => $data['remark'],
			'attributes' => serialize($data['attributes'])
		);

		$this->db->insert('log', $log_data);
	}

	public function timeline($id)
    {
        $sql = "SELECT * FROM log WHERE subject_id = ? ORDER BY timestamp DESC";
        $query = $this->db->query($sql, array($id));
        return $query->result_array();
    }


    public function timeline_client($id)
    {
        $sql = "SELECT log.*,(SELECT name FROM user WHERE log.user_id = user.id) AS 'updated_by'    
        FROM log 
        WHERE client_id = ? 
        ORDER BY timestamp DESC";
        $query = $this->db->query($sql, array($id));
        return $query->result_array();
    }


    public function timeline_consultation($id)
    {
        $sql = "SELECT log.*,(SELECT name FROM user WHERE log.user_id = user.id) AS 'updated_by'    
        FROM log 
        WHERE consultation_id = ? 
        ORDER BY timestamp DESC";
        $query = $this->db->query($sql, array($id));
        return $query->result_array();
    }

    
}

?>