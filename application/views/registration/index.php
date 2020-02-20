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
</head>

<body style="background-image:url(<?php echo base_url('assets/images/background.jpg'); ?>)">
    <br><br><br>
    <div class="fluid-container">
        <?php
            if($this->agent->is_mobile())
            {
               ?>
               <div class="row" align="center">
                    <img width="90%" src="<?php echo base_url('assets/images/bsjLogo.jpg'); ?>" alt="logo">
                </div>
               <?php
            }
            else
            {
                ?>
                <div class="row" align="center">
                    <img width="40%" src="<?php echo base_url('assets/images/bsjLogo.jpg'); ?>" alt="logo">
                </div>
                <?php
            }
        ?>        
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-4 col-xs-6">
                            <div class="form-group">
                                <label for="trn">TRN #:<font color="red"> *</font></label>
                                <input type="number" class="form-control" name="trn" placeholder="123456789" value="">
                            </div>
                        </div> 
                        <div class="col-md-8 col-xs-6">
                            <div class="form-group">
                                <label for="companyName">Company Name:<font color="red"> *</font></label>
                                <input type="text" class="form-control" name="companyName" placeholder="Bureau of Standards" value="">
                            </div> 
                        </div>
                    </div> 
                    <div class="row">
                        <div class="col-md-4 col-xs-6">
                            <div class="form-group">
                                <label for="clientName">Client Name:<font color="red"> *</font></label>
                                <input type="text" class="form-control" name="clientName" placeholder="John Doe" value="">
                            </div>
                        </div> 
                        <div class="col-md-8 col-xs-6">
                            <div class="form-group">
                                <label for="companyaddress">Address:<font color="red"> *</font></label>
                                <input type="text" class="form-control" name="companyAddress"   placeholder="6 Winchester Road" value="">
                            </div> 
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-xs-6">
                            <div class="form-group">
                                <label for="companyCounty">County:<font color="red"> *</font></label>
                                <select name="companyCounty"   class="form-control select_group">
                                    <option value="" selected>Select County</option>
                                </select>
                            </div>
                        </div> 
                        <div class="col-md-6 col-xs-6">
                            <div class="form-group">
                                <label for="companyParish">Parish:<font color="red"> *</font></label>
                                <select name="companyParish" class="form-control select_group">
                                    <option value="" selected>Select Parish</option>
                                </select>
                            </div> 
                        </div>                        
                    </div> 
                    <div class="row">
                        <div class="col-md-6 col-xs-6">
                            <div class="form-group">
                                <label for="companyCity">City:<font color="red"> *</font></label>
                                <input type="text" class="form-control" name="companyCity" placeholder="Kingston 10" value="">
                            </div> 
                        </div>
                        <div class="col-md-6 col-xs-6">
                            <div class="form-group">
                                <label for="companyNumber">Contact:<font color="red"> *</font></label>
                                <input type="text" class="form-control" name="companyNumber" placeholder="1-xxx-xxx-xxxx" value="">
                            </div> 
                        </div>
                    </div> 
                    <div class="row">
                        <div class="col-md-6 col-xs-6">
                            <div class="form-group">
                                <label for="companyEmail">Email:<font color="red"> *</font></label>
                                <input type="email" class="form-control" name="companyEmail" placeholder="company@example.org" value="">
                            </div> 
                        </div>
                        <div class="col-md-6 col-xs-6">
                            <div class="form-group">
                                <label for="companyWebsite">Website:<font color="red"> *</font></label>
                                <input type="text" class="form-control" name="companyWebsite" placeholder="https://www.bsj.org.jm/" value="">
                            </div> 
                        </div>
                    </div> 
                </div>
            </div>
        </div>        
    </div>
</body>
</html>