<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Report extends Admin_Controller
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Reports';
	}



	public function index()
	{

		if(!in_array('viewReport', $this->permission)) {
            redirect('dashboard', 'refresh');
        }

        //--> The report uses flashdata session variable.  Flashdata are temporary variables
        //    that will be used only one time.

	    $this->session->set_flashdata('printdoc', 'no');

		if($this->input->post('report') == 'REP01') {
			$this->session->set_flashdata('printREP01', 'yes');
			$this->session->set_flashdata('printdoc', 'yes');
			$this->session->set_flashdata('county', $this->input->post('county'));
		    $this->session->set_flashdata('parish', $this->input->post('parish'));	    
		    
		}

		else if($this->input->post('report') == 'REP02') {
			$this->session->set_flashdata('printREP02', 'yes');
			$this->session->set_flashdata('printdoc', 'yes');
		    $this->session->set_flashdata('phase', $this->input->post('phase'));
		    $this->session->set_flashdata('status', $this->input->post('status'));
		    $this->session->set_flashdata('sector', $this->input->post('sector'));
		    $this->session->set_flashdata('consultant', $this->input->post('consultant'));
		    $this->session->set_flashdata('date_creation_from', $this->input->post('date_creation_from'));
		    $this->session->set_flashdata('date_creation_to', $this->input->post('date_creation_to'));
		    $this->session->set_flashdata('standard', $this->input->post('standard'));
		}

		else if($this->input->post('report') == 'REP03') {
			$this->session->set_flashdata('printREP03', 'yes');
			$this->session->set_flashdata('printdoc', 'yes');
		    $this->session->set_flashdata('parish', $this->input->post('parish'));
		    $this->session->set_flashdata('year', $this->input->post('year'));
		}
		else if($this->input->post('report') == 'REP04') {
			$this->session->set_flashdata('printREP04', 'yes');
			$this->session->set_flashdata('printdoc', 'yes');
		    $this->session->set_flashdata('date_from', $this->input->post('date_from'));
		    $this->session->set_flashdata('date_to', $this->input->post('date_to'));
		    $this->session->set_flashdata('inquiry_type', $this->input->post('inquiry_type'));
		    $this->session->set_flashdata('support_type', $this->input->post('support_type'));
		}
		else if($this->input->post('report') == 'REP05') {
			$this->session->set_flashdata('printREP05', 'yes');
			$this->session->set_flashdata('printdoc', 'yes');
		    $this->session->set_flashdata('phase', $this->input->post('phase'));
		    $this->session->set_flashdata('status', $this->input->post('status'));
		    $this->session->set_flashdata('date_creation_from', $this->input->post('date_creation_from'));
		    $this->session->set_flashdata('date_creation_to', $this->input->post('date_creation_to'));
		    $this->session->set_flashdata('consultant', $this->input->post('consultant'));
		}


		$this->data['county'] = $this->model_county->getActiveCounty();
		$this->data['client'] = $this->model_client->getActiveClientData();
		$this->data['inquiry_type'] = $this->model_inquiry_type->getActiveInquiryType();
		$this->data['consultation'] = $this->model_consultation->getActiveConsultationData();
		$this->data['standard'] = $this->model_standard->getActiveStandard();
		$this->data['sector'] = $this->model_sector->getActiveSector();
		$this->data['phase'] = $this->model_phase->getActivePhase();
		$this->data['consultant'] = $this->model_user->getActiveConsultant();
		$this->data['report'] = $this->model_report->getReportList();
		$this->data['parish'] = $this->model_parish->getActiveParish();
		$this->data['status'] = $this->model_status->getActiveStatus();
		$this->data['support_type'] = $this->model_support_type->getActiveSupportType();


		$this->render_template('report/index', $this->data);
	}

}