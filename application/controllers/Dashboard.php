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
	//    It passes the total required into the frontend.

	public function index()
	{
		$year_selected = date('Y');

		if($this->input->post('year')) 
		{
			$year_selected = $this->input->post('year');
		}


		//---> Keep the year selected in a session variable to use eventually in the interactive map
		
		$this->session->unset_userdata('year_selected'); 

        if(empty($this->session->userdata('year_selected'))) {
                $data = array('year_selected' => $year_selected);
                $this->session->set_userdata($data);
            }


		$this->data['total_client_pending'] = $this->model_client->countTotalClient(3);   //Pending client client.active = 3
		$this->data['total_consultation'] = $this->model_consultation->countTotalConsultation($year_selected);
		$this->data['total_client'] = $this->model_client->countTotalClient(1);           //Active client client.active = 1
		$this->data['total_post'] = $this->model_post->countTotalPost();
		$this->data['select_year'] = $year_selected;


		//--> Total consultation for every county in the interactive map  

        $this->data['total_consultation_county_1370'] =  $this->model_consultation->countTotalConsultationByCounty($year_selected,'1370');  
        $this->data['total_consultation_county_1371'] =  $this->model_consultation->countTotalConsultationByCounty($year_selected,'1371'); 
        $this->data['total_consultation_county_1372'] =  $this->model_consultation->countTotalConsultationByCounty($year_selected,'1372'); 
        $this->data['total_consultation_county_1373'] =  $this->model_consultation->countTotalConsultationByCounty($year_selected,'1373'); 
        $this->data['total_consultation_county_1374'] =  $this->model_consultation->countTotalConsultationByCounty($year_selected,'1374'); 
        $this->data['total_consultation_county_1375'] =  $this->model_consultation->countTotalConsultationByCounty($year_selected,'1375'); 
        $this->data['total_consultation_county_1376'] =  $this->model_consultation->countTotalConsultationByCounty($year_selected,'1376'); 
        $this->data['total_consultation_county_1377'] =  $this->model_consultation->countTotalConsultationByCounty($year_selected,'1377'); 
        $this->data['total_consultation_county_1378'] =  $this->model_consultation->countTotalConsultationByCounty($year_selected,'1378'); 
        $this->data['total_consultation_county_1379'] =  $this->model_consultation->countTotalConsultationByCounty($year_selected,'1379'); 
        $this->data['total_consultation_county_1380'] =  $this->model_consultation->countTotalConsultationByCounty($year_selected,'1380'); 
        $this->data['total_consultation_county_1381'] =  $this->model_consultation->countTotalConsultationByCounty($year_selected,'1381'); 
        $this->data['total_consultation_county_1382'] =  $this->model_consultation->countTotalConsultationByCounty($year_selected,'1382'); 
        $this->data['total_consultation_county_1383'] =  $this->model_consultation->countTotalConsultationByCounty($year_selected,'1383');

		
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