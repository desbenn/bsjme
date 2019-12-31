<?php
class Migrate extends CI_Controller {

	// TO LOAD MIGRATION: just access the visit "http://yoursite.com/migrate"

	public function index()
	{
		//LOAD MIGRATION CLASS
		$this->load->library('migration');

		if (!$this->migration->current())
		{
			echo 'Error' . $this->migration->error_string();
		}
		else
		{
			echo 'Migrations ran successfully!';
		}
	}

}