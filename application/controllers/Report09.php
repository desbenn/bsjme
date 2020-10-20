<?php  

defined('BASEPATH') OR exit('No direct script access allowed');

class Report09 extends Admin_Controller 
{	 
	public function __construct()
	{
		
		parent::__construct();

		$this->data['page_title'] = 'Report';
		
	}


	public function report09($technical_advice_id) {	

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
	$this->session->set_flashdata('report_code', 'REP09');	


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

	$this->table->set_heading('<th width="10%" height="28"><strong>Revenue/Expense</strong></th>', 
                              '<th width="20%" height="28"><strong>Billing Item</strong></th>', 
							  '<th width="25%" height="28"><strong>Description</strong></th>',		
							  '<th width="15%" height="28"><strong>Item Cost $JMD</strong></th>',
							  '<th width="15%" height="28"><strong>Planned Estimate $JMD</strong></th>',							  		
		                  	  '<th width="15%" height="28"><strong>Actual Amount $JMD</strong></th>');
	
	// Call to the database
	$report = $this->model_report->getReport09($technical_advice_id);

	if ($report == null) {
		// If not data found, we indicate in the report first line
		$this->table->add_row('No data found');        
	}
	else {
        // var_dump($report);
		foreach ($report as $rs):
            
            if($rs->id =="0")
            {
                $cell1 = array('data' => "Revenue", 'width' => '10%');
            }
            else{
                $cell1 = array('data' => "Expense", 'width' => '10%');
            }			
			$cell2 = array('data' => $rs->item_name, 'width' => '20%');
			$cell3 = array('data' => $rs->description, 'width' => '25%');
			$cell4 = array('data' => $rs->item_cost, 'width' => '15%');			
            $cell5 = array('data' => $rs->p_amount, 'width' => '15%');		
            $cell6 = array('data' => $rs->a_amount, 'width' => '20%');
			$this->table->add_row($cell1, $cell2, $cell3, $cell4, $cell5, $cell6);
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
	$pdf->Output('report09.pdf', 'I');	
	
	
}	
}