<?php

	defined('BASEPATH') OR exit('No direct script access allowed');

	//--> assign the use of FPDI for insertion of PDF
	use setasign\Fpdi\Tcpdf\Fpdi;





// Print of a consultation with all the information attached

class Manual01 extends Admin_Controller
{
	public function __construct()
	{

		parent::__construct();

		$this->data['page_title'] = 'Quality & Procedure Manual - ISO 9001';


	}


	public function QPM01($consultation_id) {
	

	// Orientation (Landscape or Portrait, format, character, keepmargin, )
	$pdf = new Fpdi('P', 'mm', 'Letter', true, 'UTF-8', false);


	// Set some basic
	$pdf->SetTopMargin(25);
	$pdf->SetLeftMargin(25);
	$pdf->SetRightMargin(25);
	$pdf->setFooterMargin(25);
	$pdf->SetAutoPageBreak(true, 20);
	$pdf->SetDisplayMode('real', 'default');

	$report_code = $this->session->userdata('report_code');
    $report = $this->model_report->getReportInfo($report_code);
    $title = $report['report_title'];
    $pdf->SetTitle($title);  


	// Create a session variable to use the title in the header of tcpdf (library tcpdf / Pdf.php)

	$this->session->set_flashdata('report_code', 'QPM01');


	// Get the consultation information

	$rs = $this->model_manual->getConsultation($consultation_id);


	// Call before the addPage() method, remove the header
	$pdf->SetPrintHeader(false);


	//--> Cover page

	$pdf->AddPage();
	$pdf->SetY(80);
	$pdf->SetFont('Helvetica', '', 24);	
	$image_file = base_url('assets/images/logo.jpg');
    $pdf->Image($image_file, 60, 50, 80, 50, 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
    $pdf->SetY(135);
	$pdf->Cell(0, 0, $rs->company_name , 0, 0, 'C');
	$pdf-> Ln(20);
	$pdf->Cell(0, 0, 'Quality & Procedures Manual', 0, 0, 'C');


	//--> Introduction

	$pdf->Bookmark('Introduction', 0, 0, '', 'B', array(76,0,153));
	$pdf->AddPage();
	$pdf->SetY(20);
	$html = '<span style="text-align:justify;"><h2>INTRODUCTION</h2>This Quality Manual demonstrates and documents the <b>'.$rs->company_name.'</b> commitment to maintaining a high-level of quality and strong customer service.  The <b>'.$rs->company_name.'</b> is focused on its customers and fosters continual improvement.<p><b>'.$rs->company_name.'</b>’s philosophy is that Quality is an integral part of the entire business operation: hereafter this Quality Manual will be referred to as the <b>Quality & Procedural Manual (QPM).</b></span>';
	$pdf->SetFont('Helvetica', '', 11);
	$pdf->writeHTML($html, true, 0, true, true);
	$pdf->ln(3);

	//Example of writing an image in the content
	//$image_file = base_url('assets/documentation/bsjme_phase.jpg');
    //$pdf->Image($image_file, 25, 100, 170, 120, 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);



    //--> Corporate profile

	$pdf->AddPage();
    $pdf->Bookmark('Corporate Profile', 0, 0, '', 'B', array(76,0,153));
    $html = '<h2>CORPORATE PROFILE</h2>';
	$pdf->writeHTML($html, true, 0, true, true);	
    $pdf->ln(3);

	// get the page count
	$pageCount = $pdf->setSourceFile('assets/documentation/corporate_profile_example.pdf');
	// iterate through all pages
	for ($pageNo = 1; $pageNo <= $pageCount; $pageNo++) {
	    // import a page
	    $templateId = $pdf->importPage($pageNo);	    
	    // use the imported page and adjust the page size
	    $pdf->useTemplate($templateId, ['adjustPageSize' => true]);
	}	


	//--> Organizational Context

	$pdf->Bookmark('Organizational Context', 0, 0, '', 'B', array(76,0,153));
	$pdf->AddPage();
	$pdf->SetY(20);
	$html = '<span style="text-align:justify;"><h2>ORGANIZATIONAL CONTEXT</h2><b>'.$rs->company_name.'</b> is dedicated to defining our position in the marketplace and understanding how relevant factors arising from legal, political, economic, social and technological issues influence our strategic direction and our organizational context. <p>We identify, analyse, monitor and review factors that may affect our ability to satisfy our customers, stakeholders and interested parties as well as those that may adversely affect the stability of our processes and the integrity of our management system.<p>We monitor and review these factors to ensure that continual improvement of the requirements is derived and maintained through management reviews. <p><b>'.$rs->company_name.'</b>’s Quality Management System (QMS)<p><b>'.$rs->company_name.'</b> has established, implemented, maintains, and continually improves its quality management system (QMS), including the processes needed and their interactions, in accordance with the requirements of the ISO 9001 Standard.<h3>The Scope of the QMS: </h3><p>Includes all products and services <b>'.$rs->business_process.'</b> offered to the <b>'.$rs->sector_name.'</b>; operating from <b>'.$rs->county_name.' '.$rs->parish_name.' '.$rs->city_name.'</b>.<p>The scope of the QMS does not include <b>'.$rs->exemption.'</b><p><b>'.$rs->company_name.'</b>’s QMS is comprised of the Core, Support and QMS Management Business Processes that take market opportunities and converts them into value added outputs to satisfy our customers’ requirements. <p><h3>Core Processes:</h3>The core processes describe all the processes that are necessary for <b>'.$rs->company_name.'</b> to realize and deliver the desired service to its customers.<p><h3>Support Processes:</h3>Support Processes describe all other business requirements that are necessary to manage and control resources, and to conduct business in an orderly manner. The support processes are implemented and managed in accordance with the applicable requirements of the ISO Standard.<p><h3>Top Management:</h3>Directs and controls the organisation at the highest level, to ensure that an effective and efficient quality management system is established, implemented and maintained to achieve <b>'.$rs->company_name.'</b>’s quality objectives.</span>';
	$pdf->writeHTML($html, true, 0, true, true);



	//--> Leadership and commitment

	$pdf->Bookmark('Leadership & Commitment', 0, 0, '', 'B', array(76,0,153));
	$html = '<span style="text-align:justify;"><h2>LEADERSHIP AND COMMITMENT</h2><b>'.$rs->company_name.'</b> is committed to the development and improvement of an effective Quality Management System. This commitment is demonstrated by: <p><ul><li>Communicating the importance of meeting all customer requirements.</li><li>Establishing the Quality Policy for total commitment to excellence and the associated Quality Objectives.</li><li>Conducting Management Reviews at least once per year.</li></ul> The <b>'.$rs->company_name.'</b> ensures that customer needs and expectations are determined, in order to meet or exceed their expectations. The specific needs of our customers are determined through the Customer Feedback Form. It is the responsibility of all personnel to ensure that all customer needs are addressed. Customer satisfaction is assured through monitoring, measuring, and analysis throughout the year. (Communications Policy & Procedures)<p><b>'.$rs->company_name.'</b> has defined and documented its Quality Policy. This policy includes the organization’s commitment for meeting customer requirements and to continual improvement.</span>';
	$pdf->writeHTML($html, true, 0, true, true);  

	$pdf->Bookmark('Quality Policy Statement', 1, 0, '', '', array(0,0,0));
	$html = '<h3>Quality Policy Statement:</h3>';
	$pdf->writeHTML($html, true, 0, true, true);

	$pdf->Bookmark('Quality and Strategic Objectives', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Quality and Strategic Objectives:</h3>The Quality and Strategic Objectives of <b>'.$rs->company_name.'</b> are determined by senior management through an annual corporate strategic planning exercise, and are established at all relevant functions and levels within the organization. The objectives are derived from <b>'.$rs->company_name.'</b>’s Quality and Corporate policies and are measurable targets to be achieved for the current financial year to enhance customer satisfaction.<p>The quality policy and quality objectives ensure the organization meets its goals and expectations of its customers and is communicated throughout.<p><i>See Annex for the Quality and Strategic Objectives</i></span>';
	$pdf->writeHTML($html, true, 0, true, true);

	$pdf->Bookmark('Roles & Responsibilities', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Roles & Responsibilities:</h3><b>'.$rs->company_name.'</b> has defined business functions and their interrelations including responsibilities and authorities; which are communicated in order to facilitate the effectiveness of its quality management system.<p>The Management Team and authorized designates have the organizational freedom and authority of:<ul><li>Assigning authorities and responsibilities</li><li>Review corporate plan and objectives;</li><li>Ensuring continual improvement through corrective actions;</li><li>Ensuring team work and cooperation at all levels, creating a positive work environment;</li><li>Ensuring that the QMS  is effectively maintained</li><li>Ensuring effectiveness of the internal communications relative to the Q M S;</li><li>	Ensuring that requirements of the quality objectives and customer satisfaction are met</li><li>Ensuring the provision of resources and personnel necessary to maintain the QMS.</li></ul></span>';
	$pdf->writeHTML($html, true, 0, true, true);



	//--> Strategic planning

	$pdf->Bookmark('Strategic Planning', 0, 0, '', 'B', array(76,0,153));
	$html = '<h2>Strategic Planning</h2>';
	$pdf->writeHTML($html, true, 0, true, true);

	$pdf->Bookmark('Risk and Opportunities', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Risk and Opportunities</h3><ul><li>As part of strategic planning</li><li>As part of the definition of processes</li><li>During internal/external audits</li><li>During Management Reviews</li><li>At any time and by any employee</li><li>Annual Risk Workshops</li></ul><p><font color="red">(See <b>'.$rs->company_name.'</b> Bank’s Risk Management Policy and Framework for further details).</font><p></span>';
	$pdf->writeHTML($html, true, 0, true, true);

	$pdf->Bookmark('Planning of Changes', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Planning of Changes:</h3>Quality planning addresses continual improvement of the QMS and assures that change is managed in a controlled manner so that the integrity of the QMS is maintained during this change.<p>During the change process the following will be taken into consideration:<ul><li>The reason for the change and the potential effects;</li><li>The integrity of the quality management system;</li><li>The availability of resources; and</li><li>The assignment or reassignment of responsibilities and authorities.</li></ul></span>';
	$pdf->writeHTML($html, true, 0, true, true);



	//--> Resources

	$pdf->Bookmark('Resources', 0, 0, '', 'B', array(76,0,153));
	$html = '<span style="text-align:justify;"><h2>RESOURCES</h2>The Management Team identifies the necessary resources needed to implement, maintain and improve the effective operations of its processes and to enhance customer satisfaction. Resources are provided to develop and maintain the infrastructure and its environment to ensure the needs and expected outcomes of <b>'.$rs->company_name.'</b>, are achieved.</span>';
	$pdf->writeHTML($html, true, 0, true, true);

	$pdf->Bookmark('Human Resource Management', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Human Resource Management:</h3>The Management Team will determine and provide competent personnel necessary for the effective implementation and operation of the Quality Management System processes to achieve <b>'.$rs->company_name.'</b>’s objectives and conformity of product requirements.<p><b>'.$rs->company_name.'</b> identifies training needs of all personnel through annual performance evaluations. Additional training is provided for all personnel performing activities affecting quality. Personnel are qualified on the basis of appropriate education, training, skills, and experience.<p><font color="red">(See <b>'.$rs->company_name.'</b>’s Corporate Services Division Policies and Procedures Manual- Section 7)</font><p>A annual training plan is prepared  with periodic updates. Training is provided  both on or off the job, internally or externally, as appropriate. The ongoing effectiveness of training is periodically assessed by observation,  or other appropriate means.  <b>'.$rs->company_name.'</b> ensures that its personnel are aware of the relevance and importance of their contribution to the achievement of the quality objectives.<p><b>'.$rs->company_name.'</b> retains duplicate copies of training records in the form of attendance sheets, certificates of proficiency and/or completion for all employees. Original copies of these records are maintained by the Human Resources Department.<p>Competencies are assessed and reviewed on a periodic basis consistent with annual and strategic business planning activities.</span>';
	$pdf->writeHTML($html, true, 0, true, true);

	$pdf->Bookmark('Documented Information', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Documented Information</h3><b>'.$rs->company_name.'</b> has defined and documented information consistent with the requirements of the standard which describes the criteria, methods, detailed activities, responsibilities ,  that are required to ensure the effective operation and control of its business processes. The QMS also includes other documents and records required by the organization to ensure its effective operation. <font color="red">(See Master List of Documented Information)</font><p><b>'.$rs->company_name.'</b> ensures that pertinent issues of documents and data that relate to the requirements of the QMS are controlled. This control also extends to documents of external origin that are maintained. <font color="red">(See Procedure for Control of Documented Information)</font><p>Personnel may identify and recommend changes in documents for improvements. Changes to documents and data are reviewed and approved by the same function/organizations that performed the original review and approval, unless specifically designated otherwise <font color="red">(See Procedure for Control of Documented Information)</font>.  The nature of the changes is recorded. When practical, the changes are highlighted in the document and/or on attachments.</span>';
	$pdf->writeHTML($html, true, 0, true, true);


	//--> Operations

	$pdf->AddPage();
	$pdf->Bookmark('Operations', 0, 0, '', 'B', array(76,0,153));
	$html = '<span style="text-align:justify;"><h2>OPERATIONS</h2><b>'.$rs->company_name.'</b> operates in accordance with its Corporate Governance Framework. The Board of Directors oversees and guides the management team with the aim of protecting and enhancing the interests of its Shareholder and achieving <b>'.$rs->company_name.'</b>’s Objectives, Mission and Vision.<p><b>'.$rs->company_name.'</b>’s Quality Policy and Customer Charter are commitments to provide the highest standard of customer service and meeting customers’ financial needs through offering quality financial products and services.<p>The Board meets <b>'.$rs->board_meeting_time_period.'</b>to consider issues of strategic direction, specific policies, quality and strategic objectives and key initiatives.</span>';
	$pdf->writeHTML($html, true, 0, true, true);

	$pdf->Bookmark('Customer Communication', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Customer communication:</h3>The Communications Policy ensures that the internal and external communication of <b>'.$rs->company_name.'</b> are well coordinated, effectively managed and responsive to the diverse information needs of the public. It provides guidelines for communication within <b>'.$rs->company_name.'</b>, as well as maintaining feedback mechanisms, and facilitates the free flow of information to ensure quality service, accuracy and timeliness.<p>The External Communication component establishes guidelines for communicating the roles, policies, products, services and initiatives of <b>'.$rs->company_name.'</b> in maintaining relations with interested parties.<p><b>'.$rs->company_name.'</b>’s Communications Policy, ensures that materials and published information in all formats be catalogued and securely maintained to ensure current and long-term accessibility.<p><b>'.$rs->company_name.'</b> shall hold all client information in strict confidence and assure prudent use of such information as necessary. A list of other relevant documents can be found in the Communications Policy. <font color="red">(See Communications Policy and Procedures for Handling enquires and Feedback)</font></span>';
	$pdf->writeHTML($html, true, 0, true, true);

	$pdf->Bookmark('Product Design', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Product Design:</h3>Given the competitive environment within which the <b>'.$rs->company_name.'</b> currently operates, clearly defined process (including functional responsibilities and resources) have been put in place to deliver targeted and well developed product and services.<p>This ensures the ongoing development of products to satisfy the needs of the target market and enable <b>'.$rs->company_name.'</b> to compete effectively through;<ol type="1"><li>Mapping or flowcharting the process required to carry out  effective product development at <b>'.$rs->company_name.'</b></li><li>Scoping and carrying out the research required to identify the needs of customers or proposing the commissioning of such work externally</li></ol></span>';
	$pdf->writeHTML($html, true, 0, true, true);

	$pdf->Bookmark('Control of externally provided processes, products and services', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Control of externally provided processes, products and services:</h3><b>'.$rs->company_name.'</b> ensures that externally provided processes, products and services conform to <b>'.$rs->company_name.'</b>’s requirements through controls applied to them under various conditions. These may include, products and services intended to be incorporated into <b>'.$rs->company_name.'</b>, the provision of external products and services to be provided to customers through third parties on behalf of <b>'.$rs->company_name.'</b>, and process or component of a process provided by external parties, based on decisions made by top management.<p><b>'.$rs->company_name.'</b> determines criteria for evaluation, selection, monitoring and re-evaluation of external providers in accordance to <b>'.$rs->company_name.'</b>’s requirements. Documented information on activates performed, along with any necessary actions arising from evaluations are retained.</span>';
	$pdf->writeHTML($html, true, 0, true, true);

	$pdf->Bookmark('Product and service provision', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Product and service provision:</h3><b>'.$rs->company_name.'</b> retains all managerial and administrative rights and prerogatives.</span>';
	$pdf->writeHTML($html, true, 0, true, true);

	$pdf->Bookmark('Control of products and services', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Control of products and services:</h3></span>';
	$pdf->writeHTML($html, true, 0, true, true);

	$pdf->Bookmark('Identification and traceability', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Identification and traceability:</h3></span>';
	$pdf->writeHTML($html, true, 0, true, true);

	$pdf->Bookmark('Property belonging to customers or external providers', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Property belonging to customers or external providers:</h3>The Registry secures all property belonging to customers or external providers with whom <b>'.$rs->company_name.'</b> does business and maintains documented information on, and safeguards all property of customers and external providers, which are incorporated into <b>'.$rs->company_name.'</b>’s products and services.<p>Should the property of any customer or external provider, become lost, damaged otherwise found to be unsuitable, <b>'.$rs->company_name.'</b> will report this to the relevant party, and documented information, be retained on the incident.</span>';
	$pdf->writeHTML($html, true, 0, true, true);

	$pdf->Bookmark('Preservation', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Preservation:</h3><b>'.$rs->company_name.'</b> will preserve retained documented information to the extent necessary to ensure compliance with legal and regulatory requirements and that of the latest ISO 9001 standard.</span>';
	$pdf->writeHTML($html, true, 0, true, true);

	$pdf->Bookmark('Change Control and Traceability', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Change Control and Traceability:</h3><b>'.$rs->company_name.'</b> reviews and controls all changes in the provision of products and services, to the extent necessary to ensure conformity with the ISO Standard.<p>Documented information describing the results of reviews in changes, the person(s) authorizing the change, and any necessary actions arising from the reviews, will be recorded and maintained. <font color="red">(See “Document Change Request Form xxx” in the Procedure on Document Control)</font><p>No product or services is released until the criteria for such has been deemed to be satisfactorily adhered to, unless otherwise approved by a relevant authority and is applicable to the customer.<p>Documented information relating to the release of products and services, will be retained by <b>'.$rs->company_name.'</b>. This includes evidence of conformity and traceability to the person(s) authorizing the release.</span>';
	$pdf->writeHTML($html, true, 0, true, true);

	$pdf->Bookmark('Control of nonconforming outputs', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Control of nonconforming outputs:</h3><b>'.$rs->company_name.'</b> ensures that outputs that do not conform to their requirements are identified and controlled to prevent their unintended use or delivery.<p><b>'.$rs->company_name.'</b> exercises several strategies based on the nature of nonconformities that are identified. <b>'.$rs->company_name.'</b> seeks to correct, isolate, inform customers and under particular circumstances; obtain authorization for acceptance under condition.<p><b>'.$rs->company_name.'</b> documented information that captures the details of nonconformities and any actions taken. Likewise, <b>'.$rs->company_name.'</b> will record any concessions taken and the authorities making decisions on actions to be taken to manage nonconformities.</span>';
	$pdf->writeHTML($html, true, 0, true, true);		


	//--> Performance

	$pdf->Bookmark('Performance Evaluation', 0, 0, '', 'B', array(76,0,153));
	$html = '<span style="text-align:justify;"><h2>PERFORMANCE EVALUATION</h2><b>'.$rs->company_name.'</b> is focused on ensuring that its quality policy and objectives meets the strategic mandate; to maintain viability, sustainability, quality and provide adequate returns to its stakeholders. <b>'.$rs->company_name.'</b>’s corporate roadmap ensures that <b>'.$rs->company_name.'</b> stays focused on its key objectives, and <b>'.$rs->company_name.'</b>’s cooperate strategic framework is embedded. Strategies are reviewed and updated regularly to ensure efficiency.<p><b>'.$rs->company_name.'</b> uses tools for strategy performance management; to monitor and measure the outcome of activities that relate to its goals and objectives. It provides a framework for <b>'.$rs->company_name.'</b> to translate its strategy into measurable and actionable Key Performance Indicators (KPIs). This can be seen in greater detail in the Corporate Dashboard and Performance Metrics (representing all KPIs) of the BSC; <font color="red">(See Corporate Plan).</font></span>';
	$pdf->writeHTML($html, true, 0, true, true);

	$pdf->Bookmark('Internal Audit', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Internal Audit:</h3>The Internal Audit Division (IAD) provides independent, objective assurance and consulting services; to add value and improve <b>'.$rs->company_name.'</b>’s operations by providing risk-based advice and insight.<p>The duties and scope of IAD and the areas of assessments that internal audits focus on, can be found in the Audit Charter. <font color="red">(Internal Audit Policy and Procedures Manual.)</font><p>The IAD is governed by the Core Principles for the Professional Practice of Internal Auditing, the Code of Ethics, ISO 9001 and the International Standards for the Professional Practice of Internal Auditing.</span>';
	$pdf->writeHTML($html, true, 0, true, true);

	$pdf->Bookmark('Management Review', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Management Review:</h3>Management reviews of the <b>'.$rs->company_name.'</b>’s QMS are generally conducted <b>'.$rs->management_review_time.'</b> or based on the discretion of the Internal Auditors, to ensure its continuing suitability, adequacy, effectiveness and alignment with its strategic direction. This review is conducted through The Management Discussion and Analysis (MDA) which provides an overview of<b>'.$rs->company_name.'</b>’s operations and financial performance for the financial year. This gives customers and other interested parties, the opportunity to assess <b>'.$rs->company_name.'</b>’s operational performance for the financial year; as well as allowing management to review its performance, and identify areas requiring corrective actions and improvement.<p>The Managing Director’s (MD) Office focuses on achieving the overall objectives and goals of <b>'.$rs->company_name.'</b> and  is primarily responsible for assisting the MD and the Senior Management, in strategic plans, execution, process improvements and communication of strategies to all stakeholders. <font color="red">(See Procedure on Management Review)</font><p>The Marketing Unit, provides results of customer surveys in order to meet customer satisfaction, thereby assisting with growing revenues, increasing market share and contributing to the company’s growth and profitability.</span>';
	$pdf->writeHTML($html, true, 0, true, true);


	//--> Improvement

	$pdf->Bookmark('Improvement', 0, 0, '', 'B', array(76,0,153));
	$html = '<span style="text-align:justify;"><h2>IMPROVEMENT</h2><b>'.$rs->company_name.'</b> plans and manages the processes necessary for the continual improvement of the QMS, it facilitates this through the use of the quality policy, objectives, internal audit results, analysis of data, corrective action and management review, to eliminate the cause of identified nonconformities.<P>Audit results, quality records, service reports, and customer complaints are analysed to detect possible nonconformities and take appropriate corrective actions to reduce the impact of potential problems. <font color="red">(See Risk and Compliance Procedure guidelines).</font></span>';
	$pdf->writeHTML($html, true, 0, true, true);



	//--> Annexes
	
	$pdf->AddPage();
	$pdf->Bookmark('Annexes', 0, 0, '', 'B', array(76,0,153));
	$html = '<span style="text-align:justify;"><h2>ANNEXES</h2></span>';
	$pdf->writeHTML($html, true, 0, true, true);

	$pdf->Bookmark('Annexe 1:  Master list of Documented Information', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Annexe 1:  Master list of Documented Information</h3></span>';
	$pdf->writeHTML($html, true, 0, true, true);

	//--> List of the documents attached to the client

	$document = $this->model_manual->getClient_document($rs->client_id);

	foreach($document as $rs):
			$html = '<span style="text-align:justify;">'.$rs->doc_name.'</span>';
		    $pdf->writeHTML($html, true, 0, true, true);
		 	endforeach;				


	$pdf->Bookmark('Annexe 2:  Quality & Strategic Objectives', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Annexe 2:  Quality & Strategic Objectives</h3></span>';
	$pdf->writeHTML($html, true, 0, true, true);

	$pdf->Bookmark('Annexe 3:  Organizational Chart', 1, 0, '', '', array(0,0,0));
	$html = '<span style="text-align:justify;"><h3>Annexe 3:  Organizational Chart</h3></span>';
	$pdf->writeHTML($html, true, 0, true, true);		


	// add a new page for Table of content
	$pdf->addTOCPage();

	// write the Table of content title
	$pdf->SetFont('times', 'B', 16);
	$pdf->MultiCell(0, 0, 'Table Of Content', 0, 'C', 0, 1, '', '', true, 0);
	$pdf->Ln();

	$pdf->SetFont('dejavusans', '', 12);

	// add a simple Table Of Content at second page
	$pdf->addTOC(2, 'courier', '.', 'INDEX', 'B', array(0,0,0));

	// end of Table of content page
	$pdf->endTOCPage();


	// Reset pointer to the last page
	$pdf->lastPage();

	// Close and output PDF document
	// (I - Inline, D - Download, F - File)
	$pdf->Output('QPM01.pdf', 'I');


}
}