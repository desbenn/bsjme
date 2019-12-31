<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Documentation extends Admin_Controller  {

	public function __construct()
	{
		parent::__construct();
		$this->data['page_title'] = 'Documentation';
	}


	public function user_guide()
	{
		$this->render_template('documentation/user_guide',$this->data);
	}

	public function presentation()
	{
		$this->render_template('documentation/presentation',$this->data);
	}

	public function system_documentation()
	{
		$this->render_template('documentation/system_documentation',$this->data);
	}

	public function database_schema()
	{
		$this->render_template('documentation/database_schema',$this->data);
	}
}


