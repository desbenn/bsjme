<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <link rel="stylesheet" href="<?php echo base_url('assets/bower_components/bootstrap/dist/css/bootstrap.min.css') ?>">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<?php echo base_url('assets/bower_components/font-awesome/css/font-awesome.min.css') ?>">
    <!-- Ionicons -->
    <link rel="stylesheet" href="<?php echo base_url('assets/bower_components/Ionicons/css/ionicons.min.css') ?>">
    <!-- Theme style -->
    <link rel="stylesheet" href="<?php echo base_url('assets/dist/css/AdminLTE.min.css') ?>">
    <!-- iCheck -->
    <link rel="stylesheet" href="<?php echo base_url('assets/plugins/iCheck/square/blue.css') ?>">
    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

    <style>
        /* Hide all steps by default: */
        .tab {
            display: none;
        }     

        #btnNext{
            background-color: #51198a;
        }

        .requirement.invalid {
            background-color: #ffdddd;
        }
    </style>

</head>

<body style="background-image:url(<?php echo base_url('assets/images/background.jpg'); ?>)">
    <br><br><br>
    <div class="fluid-container">
        <?php
            if($this->agent->is_mobile())
            {
                //changes the size of the logo to fit device screen accordingly
               ?>
               <div class="row" align="center">
                    <a href="https://www.bsj.org.jm/"><<img width="80%" src="<?php echo base_url('assets/images/logo.png'); ?>" alt="logo">/a>
                </div>
               <?php
            }
            else
            {
                ?>
                <div class="row" align="center">
                    <a href="https://www.bsj.org.jm/"><img width="25%" src="<?php echo base_url('assets/images/logo.png'); ?>" alt="logo"></a>
                </div>
                <?php
            }
        ?> 
        <div id="messages"></div>

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body" align="center">                
                    <h2>Thank you for your interest!</h2>
                    <p>Your information has been successfully submitted. 
                    Contact will be made with your organization via email/phone within 3-5 business days.</p>
                </div>
            </div>
        </div>        
    </div>
</body>
</html>