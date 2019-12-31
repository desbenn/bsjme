<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Backup extends Admin_Controller 
{
	public function __construct()
	{
		parent::__construct();

		$this->not_logged_in();

	}

	 
	//--> function for backup of the MySQL database
	
	public function database_backup(){


		$this->load->dbutil();
		$db_format=array('format'=>'zip','filename'=>'bsjme_backup.sql');
		$backup= $this->dbutil->backup($db_format);
		$dbname='backup-bsjmedb-'.date('Y-m-d-H-i').'.zip';
		$save='assets/db_backup/'.$dbname;
		write_file($save,$backup);

		force_download($dbname,$backup);		

	}

  //This function zip the documents that are uploaded in the system 
  //Only the folders with documents are treated


  public function zip_upload(){

             // File name
        $filename = 'backup-upload-'.date('Y-m-d-H-i').'.zip';
        // Directory path (uploads directory stored in project root)
        $path = 'upload';

        // Add directory to zip
        $this->zip->read_dir($path);

        // Save the zip file to archivefiles directory
        $this->zip->archive(FCPATH.'/assets/db_backup/'.$filename);

        // Download
        $this->zip->download($filename);

  }


  
}