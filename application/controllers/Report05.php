<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Report05 extends Admin_Controller
{
	public function __construct()
	{

		parent::__construct();

		$this->data['page_title'] = 'Report 5';

	}


	public function REP05() {

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
	    $this->session->set_flashdata('report_code', 'REP05');

		// set font for the report
		$pdf->SetFont('dejavusans', '', 7);



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

		$this->table->set_heading(
				  '<th width="20%" height="28"><strong>Company Name</strong></th>',
				  '<th width="7%" height="28"><strong>Consultation No</strong></th>',
	              '<th width="26%" height="28"><strong>Description</strong></th>',
	              '<th width="8%" height="28"><strong>Phase</strong></th>',
	          	  '<th width="8%" height="28"><strong>Status</strong></th>',
	          	  '<th width="8%" height="28"><strong>Sector</strong></th>',
	          	  '<th width="8%" height="28"><strong>Date creation</strong></th>',
	          	  '<th width="15%" height="28"><strong>Consultant</strong></th>');

		// Call to the database

		$REP05 = $this->model_report->get_REP05();

		$county_title = '';

		if ($REP05 == null) {
			// If not data found, we indicate in the report first line
			$this->table->add_row('No data found');
		}
		else {
			foreach ($REP05 as $rs):

				// Print the County Title
				if ($rs->county_name <> $county_title) {
					$this->table->add_row('');
					$title = '<h2>'.$rs->county_name.'</h2>';
					$this->table->add_row($title);
					$county_title = $rs->county_name;
				}

				$cell1 = array('data' => $rs->company_name, 'width' => '20%');
				$cell2 = array('data' => $rs->consultation_no, 'width' => '7%');
				$cell3 = array('data' => $rs->description, 'width' => '26%');
				$cell4 = array('data' => $rs->phase_name, 'width' => '8%');
				$cell5 = array('data' => $rs->status_name, 'width' => '8%');
				$cell6 = array('data' => $rs->sector_name, 'width' => '8%');
				$cell7 = array('data' => $rs->date_creation, 'width' => '8%');
				$cell8 = array('data' => $rs->consultant_name, 'width' => '15%');
				$this->table->add_row($cell1, $cell2, $cell3, $cell4, $cell5, $cell6, $cell7, $cell8);
			endforeach;
		}

		// Generate the table in html format using the table class of codeigniter
		$html = $this->table->generate();

		// Add a page and change the orientation/size
		$pdf->AddPage('L','LETTER');

		// Output the HTML content
		// writeHTML($html, $ln=true, $fill=false, $reseth=false, $cell=false, $align='')
		$pdf->writeHTML($html, true, false, true, false, '');

		// Reset pointer to the last page
		$pdf->lastPage();

		// Close and output PDF document
		// (I - Inline, D - Download, F - File)
		$pdf->Output('Report05.pdf', 'I');


}
}