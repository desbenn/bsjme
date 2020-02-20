<?php

defined('BASEPATH') OR exit('No direct script access allowed');

// Print of a consultation with all the information attached

class Report_consultation extends Admin_Controller
{
	public function __construct()
	{

		parent::__construct();

		$this->data['page_title'] = 'Report';

	}


	public function REP0I($consultation_id) {

	// Orientation (Landscape or Portrait, format, character, keepmargin, )
	// Orientation is not working here but works in AddPage('L')
	$pdf = new Pdf('P', 'mm', 'A4', true, 'UTF-8', false);

	// Set some basic
	$pdf->SetHeaderMargin(13);
	$pdf->SetTopMargin(23);
	$pdf->setFooterMargin(20);
	$pdf->SetAutoPageBreak(true, PDF_MARGIN_BOTTOM);
	$pdf->SetDisplayMode('real', 'default');

	// Create a session variable to use the title in the header of tcpdf (library tcpdf / Pdf.php)
	$this->session->set_flashdata('report_code', 'REP0I');

	// set font for the report
	$pdf->SetFont('dejavusans', '', 8);


	// Generate HTML table data from MySQL

	$template = array (
              'table_open'          => '<table border="0" cellpadding="4" cellspacing="0">',
              'heading_row_start'   => '<tr bgcolor="rgb(235,235,235)">',
              'heading_row_end'     => '</tr>',
              'heading_cell_start'  => '',
              'heading_cell_end'    => '',
              'row_start'           => '<tr>',
              'row_end'             => '</tr>',
              'cell_start'          => '<td>',
              'cell_end'            => '</td>',
              'row_alt_start'       => '<tr>',
              'row_alt_end'         => '</tr>',
              'cell_alt_start'      => '<td>',
              'cell_alt_end'        => '</td>',
              'table_close'         => '</table>'
              );

	$this->table->set_template($template);

	$cell1 = array('data' => '<strong>Consultation</strong>', 'height' => '20', 'width' => '100%', 'bgcolor' => 'rgb(235,235,235)');
	$this->table->add_row($cell1);

	// Get the consultation information
	$REP0I = $this->model_report->getReportConsultation($consultation_id);

	foreach($REP0I as $rs):

		    //--> Prepare the list of consultants 

            $consultant = json_decode($rs->consultant_id);
            $consultant_list = '';
           // Get the name of each consultant
            if (!$consultant == null) {
                foreach($consultant as $k=>$v){
                       $consultant_data = $this->model_user->getConsultantData($consultant[$k]);
                       $consultant_list = $consultant_list.' '.$consultant_data['name'];
                   }
            }       

			$cell1 = array('data' => '<strong>'.$rs->consultation_no.'</strong>', 'width' => '25%');			
			$this->table->add_row($cell1);

			$cell1 = array('data' => '<strong>Description:&nbsp;&nbsp;</strong>'.$rs->description, 'width' => '100%');
			$this->table->add_row($cell1);
		
			$cell1 = array('data' => '<strong>Consultant:&nbsp;&nbsp;</strong>'.$consultant_list, 'width' => '50%');
			$this->table->add_row($cell1);

			
			$cell1 = array('data' => '<strong>Standard:&nbsp;&nbsp;</strong>'.$rs->standard_name, 'width' => '33%');
			$cell2 = array('data' => '<strong>Status:&nbsp;&nbsp;</strong>'.$rs->status_name, 'width' => '33%');
			$cell3 = array('data' => '<strong>Phase:&nbsp;&nbsp;</strong>'.$rs->phase_name, 'width' => '34%');
			$this->table->add_row($cell1, $cell2, $cell3);

			
			$cell1 = array('data' => '<strong>Date creation:&nbsp;&nbsp;</strong>'.$rs->date_creation, 'width' => '33%');
			$cell2 = array('data' => '<strong>Sector:&nbsp;&nbsp;</strong>'.$rs->sector_name, 'width' => '33%');
			$this->table->add_row($cell1,$cell2);

			$cell1 = array('data' => '<strong>Business Process:&nbsp;&nbsp;</strong>'.$rs->business_process, 'width' => '100%');
			$this->table->add_row($cell1);

			$cell1 = array('data' => '<strong>Exemption:&nbsp;&nbsp;</strong>'.$rs->exemption, 'width' => '100%');
			$this->table->add_row($cell1);

			$cell1 = array('data' => '<strong>Board meeting time period:&nbsp;&nbsp;</strong>'.$rs->board_meeting_time_period, 'width' => '100%');
			$this->table->add_row($cell1);

			$cell1 = array('data' => '<strong>Management review time:&nbsp;&nbsp;</strong>'.$rs->management_review_time, 'width' => '100%');
			$this->table->add_row($cell1);

			$cell1 = array('data' => '<strong>Remark:&nbsp;&nbsp;</strong>'.$rs->remark, 'width' => '100%');
			$this->table->add_row($cell1);

			$client_id = $rs->client_id;

			endforeach;


	// Get the client information

	$cell1 = array('data' => '');
	$this->table->add_row($cell1);
	$cell1 = array('data' => '<strong>Client</strong>', 'height' => '20', 'width' => '100%', 'bgcolor' => 'rgb(235,235,235)');
	$this->table->add_row($cell1);

	$REP0C = $this->model_report->getReportClient($client_id);

	foreach ($REP0C as $rs):

			$cell1 = array('data' => '<strong>Company Name:&nbsp;&nbsp;</strong>'.$rs->company_name, 'width' => '50%');
			$cell2 = array('data' => '<strong>Client Name:&nbsp;&nbsp;</strong>'.$rs->client_name, 'width' => '50%');
			$this->table->add_row($cell1, $cell2);

			$cell1 = array('data' => '<strong>TRN:&nbsp;&nbsp;</strong>'.$rs->trn, 'width' => '50%');
			$cell2 = array('data' => '<strong>Active:&nbsp;&nbsp;</strong>'.$rs->active, 'width' => '25%');			
			$this->table->add_row($cell1, $cell2);

			$cell1 = array('data' => '');
			$this->table->add_row($cell1);

			$cell1 = array('data' => '<strong>Location</strong>', 'height' => '20', 'width' => '100%', 'bgcolor' => 'rgb(235,235,235)');
			$this->table->add_row($cell1);

			$cell1 = array('data' => '<strong>Address:&nbsp;&nbsp;</strong>'.$rs->address, 'width' => '100%');
			$this->table->add_row($cell1);

			$cell1 = array('data' => '<strong>County:&nbsp;&nbsp;</strong>'.$rs->county_name, 'width' => '33%');
			$cell2 = array('data' => '<strong>Parish:&nbsp;&nbsp;</strong>'.$rs->parish_name, 'width' => '33%');
			$cell3 = array('data' => '<strong>City:&nbsp;&nbsp;</strong>'.$rs->city_name, 'width' => '34%');
			$this->table->add_row($cell1, $cell2, $cell3);

			$cell1 = array('data' => '<strong>District:&nbsp;&nbsp;</strong>'.$rs->district, 'width' => '33%');
			$cell2 = array('data' => '<strong>Postal Box:&nbsp;&nbsp;</strong>'.$rs->postal_box, 'width' => '33%');
			$cell3 = array('data' => '<strong>Postal Code:&nbsp;&nbsp;</strong>'.$rs->postal_code, 'width' => '33%');
			$this->table->add_row($cell1, $cell2, $cell3);

			$cell1 = array('data' => '');
			$this->table->add_row($cell1);
			$cell1 = array('data' => '<strong>Contact</strong>', 'height' => '20', 'width' => '100%', 'bgcolor' => 'rgb(235,235,235)');
			$this->table->add_row($cell1);

			$cell1 = array('data' => '<strong>Contact'.':&nbsp;&nbsp;</strong>'.$rs->contact_name, 'width' => '33%');
			$cell2 = array('data' => '<strong>Phone:&nbsp;&nbsp;</strong>'.$rs->phone, 'width' => '33%');
			$cell3 = array('data' => '<strong>Mobile:&nbsp;&nbsp;</strong>'.$rs->mobile, 'width' => '34%');			
			$this->table->add_row($cell1, $cell2, $cell3);

			$cell1 = array('data' => '<strong>Director Name:&nbsp;&nbsp;</strong>'.$rs->director_name, 'width' => '33%');
			$cell2 = array('data' => '<strong>Email'.':&nbsp;&nbsp;</strong>'.$rs->email, 'width' => '33%');
			$cell3 = array('data' => '<strong>Website:&nbsp;&nbsp;</strong>'.$rs->website, 'width' => '34%');			
			$this->table->add_row($cell1, $cell2, $cell3);	

			$cell1 = array('data' => '<strong>Remark:&nbsp;&nbsp;</strong>'.$rs->remark, 'width' => '100%');
			$this->table->add_row($cell1);

			endforeach;


	//--> Document

	$cell1 = array('data' => '');
	$this->table->add_row($cell1);
	$cell1 = array('data' => '<strong>Document</strong>', 'height' => '20', 'width' => '100%', 'bgcolor' => 'rgb(235,235,235)');
	$this->table->add_row($cell1);

	$document = $this->model_report->getReportClient_document($client_id);

	if ($document == null) {
	   // If not data found, we indicate in the report first line
	   $this->table->add_row('No data found');
	   }
	else {

		$cell1 = array('data' => '<strong>Name</strong>', 'width' => '50%');
		$cell2 = array('data' => '<strong>Type</strong>', 'width' => '20%');
		$cell3 = array('data' => '<strong>Classification</strong>', 'width' => '20%');
		$cell4 = array('data' => '<strong>Size</strong>', 'width' => '10%');
		$this->table->add_row($cell1, $cell2, $cell3, $cell4);

		foreach($document as $rs):

			$cell1 = array('data' => $rs->doc_name, 'width' => '50%');
			$cell2 = array('data' => $rs->document_type_name, 'width' => '20%');
			$cell3 = array('data' => $rs->document_class_name, 'width' => '20%');			
			$cell4 = array('data' => $rs->doc_size, 'width' => '10%');
			$this->table->add_row($cell1, $cell2, $cell3, $cell4);

		 	endforeach;
		}


	// Generate the table in html format using the table class of codeigniter
	$html = $this->table->generate();

	// Add a page and change the orientation
	$pdf->AddPage('P');

	// Output the HTML content
	$pdf->writeHTML($html, true, false, true, false, '');

	// Reset pointer to the last page
	$pdf->lastPage();

	// Close and output PDF document
	// (I - Inline, D - Download, F - File)
	$pdf->Output('Report0I.pdf', 'I');


}
}