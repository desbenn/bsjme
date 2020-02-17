<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


require('tcpdf/tcpdf.php');
require_once('src/autoload.php');


class Pdf extends Tcpdf
{

    var $CI;

    function __construct(){
        parent::__construct();
        $this->CI =& get_instance();
    }


    //Page header
    public function Header() {

        $report_code = $this->CI->session->userdata('report_code');
        $report = $this->CI->model_report->getReportInfo($report_code);
        $title = $report['report_title'];
        $this->SetTitle($title);  

        //--> We print the header only for the report.  It's not necessary for the manual.

        if (substr($report_code,0,3) == 'REP') {           

            // Logo
            $image_file = base_url('assets/images/logo.jpg');
            $this->Image($image_file, 8, 8, 13, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);

            // Title
            $this->SetFont('helvetica', 'B', 11);
            $this->SetX(23);
            $this->Cell(0, 10, 'Quality Management System', 0, 0, 'L', 0, '', 0, false, 'T', 'T');
            $this->SetXY(23,20);
            $this->SetFont('helvetica', 'B', 15);      
            $this->Cell(0, 15, $title, 0, false, 'L', 0, '', 0, false, 'B', 'B');
            } 



    }

    // Page footer
    public function Footer() {

        $report_code = $this->CI->session->userdata('report_code');
        
        // Page number and date
        
        $this->SetY(-15);
        $this->SetFont('helvetica', 'I', 8);
        $this->Cell(0,6,date('Y-m-d'),0,0,'L');
        $this->Cell(10,6, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'R', 0, '', 0, false, 'T', 'M');

    }


}