<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Report04 extends Admin_Controller
{
	public function __construct()
	{

		parent::__construct();

		$this->data['page_title'] = 'Report04';

	}


	public function REP04() {

		// Orientation (Landscape or Portrait, format, character, keepmargin, )
		// Orientation is not working here but works in AddPage('L')
		$pdf = new Pdf('Landscape', 'mm', 'LETTER', true, 'UTF-8', false);

		// Set some basic
		$pdf->SetHeaderMargin(13);
		$pdf->SetTopMargin(23);
		$pdf->setFooterMargin(20);
		$pdf->SetAutoPageBreak(true, PDF_MARGIN_BOTTOM);
		$pdf->SetDisplayMode('real', 'default');

		// Create a session variable to use the title in the header of tcpdf (library tcpdf / Pdf.php)
	    $this->session->set_flashdata('report_code', 'REP04');

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

		$this->table->set_heading('<th width="7%" height="28"align="center"><strong>trn</strong></th>',
			  '<th width="15%" height="28" align="left"><strong>Company Name</strong></th>',
			  '<th width="10%" height="28" height="28" align="left"><strong>Support Type</strong></th>',
			  '<th width="8%" height="28" align="left"><strong>Inquiry Type</strong></th>',
          	  '<th width="20%" height="28" align="left"><strong>Request</strong></th>',
          	  '<th width="20%" height="28" align="left"><strong>Feedback</strong></th>',
          	  '<th width="10%" height="28" align="left"><strong>Answered by</strong></th>',
          	  '<th width="10%" height="28" align="left"><strong>Date</strong></th>'
          	   );



		// Call to the database
		$REP04 = $this->model_report->get_REP04();

		if ($REP04 == null) {
			// If not data found, we indicate in the report first line
			$this->table->add_row('No data found');
		}
		else {
			foreach ($REP04 as $rs):
				$cell1 = array('data' => $rs->trn, 'width' => '7%');
				$cell2 = array('data' => $rs->company_name, 'width' => '15%');
				$cell3 = array('data' => $rs->support_type_name, 'width' => '10%', 'align' => 'left');
				$cell4 = array('data' => $rs->inquiry_type_name, 'width' => '8%', 'align' => 'left');
				$cell5 = array('data' => $rs->request, 'width' => '20%', 'align' => 'left');
				$cell6 = array('data' => $rs->feedback, 'width' => '20%', 'align' => 'left');
				$cell7 = array('data' => $rs->answered_by, 'width' => '10%', 'align' => 'left');
				$cell8 = array('data' => $rs->inquiry_date, 'width' => '10%', 'align' => 'left');

				$this->table->add_row($cell1, $cell2, $cell3, $cell4, $cell5, $cell6, $cell7, $cell8);
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
		$pdf->Output('Report04.pdf', 'I');


}
}