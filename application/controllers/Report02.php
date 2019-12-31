<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Report02 extends Admin_Controller
{
	public function __construct()
	{

		parent::__construct();

		$this->data['page_title'] = 'Report02';

	}


	public function REP02() {

		// Orientation (Landscape or Portrait, format, character, keepmargin, )
		// Orientation and size is not working here but works in AddPage('L','LETTER')
		$pdf = new Pdf('L', 'mm', 'LETTER', true, 'UTF-8', false);

		// Set some basic
		$pdf->SetHeaderMargin(13);
		$pdf->SetTopMargin(23);
		$pdf->setFooterMargin(20);
		$pdf->SetAutoPageBreak(true, PDF_MARGIN_BOTTOM);
		$pdf->SetDisplayMode('real', 'default');

		// Create a session variable to use the title in the header of tcpdf (library tcpdf / Pdf.php)
	    $this->session->set_flashdata('report_code', 'REP02');

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
	              'row_alt_start'       => '<tr bgcolor="rgb(251,251,251)">',
	              'row_alt_end'         => '</tr>',
	              'cell_alt_start'      => '<td>',
	              'cell_alt_end'        => '</td>',
	              'table_close'         => '</table>'
	              );

		$this->table->set_template($template);

		$this->table->set_heading('<th width="10%" height="28"><strong>Consultation No</strong></th>',
			                      '<th width="14%" height="28"><strong>Company Name</strong></th>',
			                      '<th width="22%" height="28"><strong>Description</strong></th>',
			                      '<th width="8%" height="28"><strong>Sector</strong></th>',	                  	  
			                  	  '<th width="12%" height="28"><strong>Standard</strong></th>',               	  
			                  	  '<th width="8%" height="28"><strong>Phase</strong></th>',
			                  	  '<th width="8%" height="28"><strong>Status</strong></th>',
			                  	  '<th width="8%" height="28"><strong>Date creation</strong></th>',
			                  	  '<th width="10%" height="28"><strong>Consultant</strong></th>');

		// Call to the database

		$REP02 = $this->model_report->get_REP02();

		if ($REP02 == null) {
			// If not data found, we indicate in the report first line
			$this->table->add_row('No data found');
		}
		else {
			foreach ($REP02 as $rs):

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

				$cell1 = array('data' => $rs->consultation_no, 'width' => '10%');
				$cell2 = array('data' => $rs->company_name, 'width' => '14%');
				$cell3 = array('data' => $rs->description, 'width' => '22%');
				$cell4 = array('data' => $rs->sector_name, 'width' => '8%');
				$cell5 = array('data' => $rs->standard_name, 'width' => '12%');
				$cell6 = array('data' => $rs->phase_name, 'width' => '8%');
				$cell7 = array('data' => $rs->status_name, 'width' => '8%');
				$cell8 = array('data' => $rs->date_creation, 'width' => '8%');	
				$cell9 = array('data' => $consultant_list, 'width' => '10%');
				
				$this->table->add_row($cell1, $cell2, $cell3, $cell4, $cell5, $cell6, $cell7, $cell8, $cell9);
			endforeach;
		}

		// Generate the table in html format using the table class of codeigniter
		$html = $this->table->generate();

		// Add a page and change the orientation/size
		$pdf->AddPage('L','LETTER');

		// Output the HTML content
		$pdf->writeHTML($html, true, false, true, false, '');

		// Reset pointer to the last page
		$pdf->lastPage();

		// Close and output PDF document
		// (I - Inline, D - Download, F - File)
		$pdf->Output('Report02.pdf', 'I');


}
}