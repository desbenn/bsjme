<?php  

defined('BASEPATH') OR exit('No direct script access allowed');

class Report07 extends Admin_Controller 
{	 
	public function __construct()
	{
		
		parent::__construct();

		$this->data['page_title'] = 'Report';
		
	}


	public function report07() {	

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
	$this->session->set_flashdata('report_code', 'REP07');	


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

	$this->table->set_heading('<th width="20%" height="28"><strong>Code</strong></th>', 
							  '<th width="10%" height="28"><strong>Phase</strong></th>',		
							  '<th width="50%" height="28"><strong>Name</strong></th>',
							  '<th width="10%" height="28"><strong>Id</strong></th>',							  		
		                  	  '<th width="10%" height="28"><strong>Active</strong></th>');
	
	// Call to the database
	$report = $this->model_report->getReport07();

	$standard_title = '';
	$clause_title = '';

	if ($report == null) {
		// If not data found, we indicate in the report first line
		$this->table->add_row('No data found');        
	}
	else {
		foreach ($report as $rs):

			// Print the standard Title
			if ($rs->standard_name <> $standard_title) {
					$this->table->add_row('');
					$title = '<h2>'.$rs->standard_name.'</h2>';
					$this->table->add_row($title);
					$standard_title = $rs->standard_name;
				}

			// Print the clause Title
			if ($rs->clause_name <> $clause_title) {
					$this->table->add_row('');
					$title = '<h3>'.$rs->clause_name.'</h3>';
					$this->table->add_row($title);
					$clause_title = $rs->clause_name;
				}	
			
			$cell1 = array('data' => $rs->code, 'width' => '20%');
			$cell2 = array('data' => $rs->phase_id, 'width' => '10%');
			$cell3 = array('data' => $rs->name, 'width' => '50%');
			$cell4 = array('data' => $rs->id, 'width' => '10%');			
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
	$pdf->Output('report07.pdf', 'I');	
	
	
}	
}