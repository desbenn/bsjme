<?php  

defined('BASEPATH') OR exit('No direct script access allowed');

class Report_Internal_Cost_Plan extends Admin_Controller 
{	 
	public function __construct()
	{
		
		parent::__construct();

		$this->data['page_title'] = 'Cost Plan';
		
	}


	public function report_internal_cost_plan($technical_advice_id) {	

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
	
	// Call to the database
	$ICP_Report = $this->model_report->getReportInternalCostPlan($technical_advice_id);
	$client_id=null;
	if($ICP_Report == null){
		// If not data found, we indicate in the report first line
		$this->table->add_row('No data found');  
	}
	else{
		$estimate_income=0;
		$actual_income=0;
		$estimate_expense=0;
		$actual_expense=0;
		$net_estimate=0;
		$net_actual=0;
		//get the client information to display on report
		$cell1 = array('data' => '');
		$this->table->add_row($cell1);
		$cell1 = array('data' => '<strong>Client Information</strong>', 'height' => '20', 'width' => '100%', 'bgcolor' => 'rgb(235,235,235)');
		$this->table->add_row($cell1);
		$client_id = $ICP_Report[0]->client_id;
		$REP0C = $this->model_report->getReportClient($client_id);
		foreach($REP0C as $rs):
			$cell1 = array('data' => '<strong>Company Name:&nbsp;&nbsp;</strong>'.$rs->company_name, 'width' => '50%');
			$cell2 = array('data' => '<strong>Client Name:&nbsp;&nbsp;</strong>'.$rs->client_name, 'width' => '50%');
			$this->table->add_row($cell1, $cell2);
			$cell1 = array('data' => '<strong>Date Created:&nbsp;&nbsp;</strong>'.date('Y-m-d (H:i:s)'), 'width' => '50%');
			$this->table->add_row($cell1);
		endforeach;
		$cell1 = array('data' => '');
		$this->table->add_row($cell1);
		$cell1 = array('data' => '<strong>Internal Cost Plan</strong>', 'height' => '20', 'width' => '100%', 'bgcolor' => 'rgb(235,235,235)');
		$this->table->add_row($cell1);
		$cell1 = array('data' => '<strong>Item Name</strong>', 'width' => '20%');
		$cell2 = array('data' => '<strong>Description</strong>', 'width' => '50%');
		$cell3 = array('data' => '<strong>Planned Estimate ($JMD)</strong>', 'width' => '15%');
		$cell4 = array('data' => '<strong>Actual Amount ($JMD)</strong>', 'width' => '15%');
		$this->table->add_row($cell1, $cell2, $cell3, $cell4);
		
		$cell1 = array('data' => '');
		$this->table->add_row($cell1);
		$cell1 = array('data' => '<strong>Revenues</strong>', 'height' => '20', 'width' => '100%', 'bgcolor' => 'rgb(235,235,235)');
		$this->table->add_row($cell1);

		foreach($ICP_Report as $rs):
			if($rs->budget_type=="0")//Check if item is a revenue item
			{
				$estimate_income += $rs->item_cost;
				$actual_income += $rs->a_amount;
				$cell1 = array('data' => $rs->item_name, 'width' => '20%');
				$cell2 = array('data' => $rs->description, 'width' => '50%');
				$cell3 = array('data' => $rs->item_cost, 'width' => '15%');	
				$cell4 = array('data' => $rs->a_amount, 'width' => '15%');
				$this->table->add_row($cell1, $cell2, $cell3, $cell4);
			}

		endforeach;

		$cell1 = array('data' => '');
		$this->table->add_row($cell1);
		$cell1 = array('data' => '<strong>Total Income</strong>', 'height' => '20', 'width' => '70%', 'bgcolor' => 'rgb(235,235,235)');
		$cell2 = array('data' => '<strong>'.$estimate_income.'</strong>', 'height' => '20', 'width' => '15%', 'bgcolor' => 'rgb(235,235,235)');
		$cell3 = array('data' => '<strong>'.$actual_income.'</strong>', 'height' => '20', 'width' => '15%', 'bgcolor' => 'rgb(235,235,235)');

		$this->table->add_row($cell1, $cell2, $cell3);

		$cell1 = array('data' => '');
		$this->table->add_row($cell1);
		$cell1 = array('data' => '<strong>Expenses</strong>', 'height' => '20', 'width' => '100%', 'bgcolor' => 'rgb(235,235,235)');
		$this->table->add_row($cell1);
		foreach($ICP_Report as $rs):

			if($rs->budget_type=="1")//Check if item is a revenue item
			{
				$estimate_expense += $rs->item_cost;
				$actual_expense += $rs->a_amount;
				$cell1 = array('data' => $rs->item_name, 'width' => '20%');
				$cell2 = array('data' => $rs->description, 'width' => '50%');		
				$cell3 = array('data' => $rs->item_cost, 'width' => '15%');
				$cell4 = array('data' => $rs->a_amount, 'width' => '15%');
				$this->table->add_row($cell1, $cell2, $cell3, $cell4);
			}

		endforeach;

		$cell1 = array('data' => '');
		$this->table->add_row($cell1);
		$cell1 = array('data' => '<strong>Total Expenses</strong>', 'height' => '20', 'width' => '70%', 'bgcolor' => 'rgb(235,235,235)');
		$cell2 = array('data' => '<strong>'.$estimate_expense.'</strong>', 'height' => '20', 'width' => '15%', 'bgcolor' => 'rgb(235,235,235)');
		$cell3 = array('data' => '<strong>'.$actual_expense.'</strong>', 'height' => '20', 'width' => '15%', 'bgcolor' => 'rgb(235,235,235)');

		$this->table->add_row($cell1, $cell2, $cell3);

		$net_estimate=$estimate_income-$estimate_expense;
		$net_actual=$actual_income-$actual_expense;
		$cell1 = array('data' => '');
		$this->table->add_row($cell1);
		$cell1 = array('data' => '<strong>Net Income</strong>', 'height' => '20', 'width' => '70%', 'bgcolor' => 'rgb(235,235,235)');
		$cell2 = array('data' => '<strong>'.$net_estimate.'</strong>', 'height' => '20', 'width' => '15%', 'bgcolor' => 'rgb(235,235,235)');
		$cell3 = array('data' => '<strong>'.$net_actual.'</strong>', 'height' => '20', 'width' => '15%', 'bgcolor' => 'rgb(235,235,235)');

		$this->table->add_row($cell1, $cell2, $cell3);
		
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
	$pdf->Output('report_internal_cost_plan.pdf', 'I');	
	
	
}	
}