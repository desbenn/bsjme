<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class migration_add_time_to_date extends CI_Migration {
	//CHANGE DATA TYPE OF date_from COLUMN OF post TO DATETIME
	//back to DATE to keep the example for future use
	public function up()
	{
		$fields = array(
			'date_from' => array(
				'type' => 'DATE'
			),
		);

		$this->dbforge->modify_column('post', $fields);
	}

	//REVERT CHANGES
	public function down()
	{
		$fields = array(
			'date_from' => array(
				'type' => 'DATE'
			),
		);

		$this->dbforge->modify_column('post', $fields);
	}

}