<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Setting extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->data['page_title'] = 'Settings';
	}

	public function index()
	{
		$this->render_template('setting/index',$this->data);
	}
}


