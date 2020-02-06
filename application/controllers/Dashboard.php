<?php

class Dashboard extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'BSJME';

	}


	//--> Redirects to the manage property page
	//    It passes the total consultation, total paid activity, total user, and total parish information
	//    into the frontend.

	public function index()
	{
		$year_selected = date('Y');
		if($this->input->post('year')) 
		{
			$year_selected = $this->input->post('year');
		}
		$this->data['total_consultation'] = $this->model_consultation->countTotalConsultation($year_selected);
		$this->data['total_client'] = $this->model_client->countTotalClient();
		$this->data['total_post'] = $this->model_post->countTotalPost();
		$this->data['select_year'] = $year_selected;
		
		if($this->agent->is_mobile())
		{
			$this->render_template('mobile/dashboard/index', $this->data);
		}
		else
		{
			$this->render_template('dashboard', $this->data);
		}
	}
}