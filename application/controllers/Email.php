<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Email extends Admin_Controller 
{
    public function __construct()
    {
        parent::__construct();

        $this->not_logged_in();

    }

    public function index() 
    {
        $this->load->view('email/index.php');
    }


    public function send_mail() 
    {   
        // //$from_email = "email@example.com";
        $from_email = "njumpp@bsj.org.jm";
        $to_email = $this->input->post('email');

        $this->email->from($from_email, 'Identification');
        $this->email->to($to_email);
        $this->email->subject('Send Email Codeigniter');
        $this->email->message('The email send using codeigniter library');

        //Send mail
        if($this->email->send())
            $this->session->set_flashdata("email_sent","Congragulation Email Send Successfully.");
        else
            $this->session->set_flashdata("email_sent","You have encountered an error");
        
        $this->load->view('email/index.php');

    }
}
?>