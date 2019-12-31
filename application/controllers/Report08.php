<?php  

defined('BASEPATH') OR exit('No direct script access allowed');

class Report08 extends Admin_Controller 
{	 
	public function __construct()
	{
		
		parent::__construct();

		$this->data['page_title'] = 'Report';
		
	}


	public function report08() {	

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
	$this->session->set_flashdata('report_code', 'REP08');	


	// set font for the report
	// attention *** the mongolian character is working good with dejavusans
	//               but not given good result in other fonts
	$pdf->SetFont('dejavusans', '', 9);


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

	$this->table->set_heading('<th width="10%" height="28"><strong>Id</strong></th>', 
							  '<th width="20%" height="28"><strong>Standard</strong></th>',		
							  '<th width="40%" height="28"><strong>Name</strong></th>',
							  '<th width="20%" height="28"><strong>Code</strong></th>',							  		
		                  	  '<th width="10%" height="28"><strong>Active</strong></th>');
	
	// Call to the database
	$report = $this->model_report->getReport08();

	if ($report == null) {
		// If not data found, we indicate in the report first line
		$this->table->add_row('No data found');        
	}
	else {
		foreach ($report as $rs):
			
			$cell1 = array('data' => $rs->id, 'width' => '10%');
			$cell2 = array('data' => $rs->standard_name, 'width' => '20%');
			$cell3 = array('data' => $rs->name, 'width' => '40%');
			$cell4 = array('data' => $rs->code, 'width' => '20%');			
			$cell5 = array('data' => $rs->active, 'width' => '10%');			
			$this->table->add_row($cell1, $cell2, $cell3, $cell4, $cell5);
		endforeach;
	}
	

	// Generate the table in html format using the table class of codeigniter
	$html = $this->table->generate();		
	
	// Add a page and change the orientation
	$pdf->AddPage('PL');
	
	// Output the HTML content
	$pdf->writeHTML($html, true, false, true, false, '');
	
	// Reset pointer to the last page
	$pdf->lastPage();

	// Close and output PDF document
	// (I - Inline, D - Download, F - File)
	$pdf->Output('report08.pdf', 'I');	
	
	
}	
}