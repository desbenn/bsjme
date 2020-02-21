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
        
        #clientRegForm, #successfullSubmission {
            background-color: #ffffff;
            padding: 30px;
            box-shadow: 10px 10px 5px grey;
            max-width: 60%;
            margin: auto;
        }

        .error {
            color: #FF0000;
            }

        #btnNext{
            background-color: #51198a;
        }

        #progressBar{
            background-color: #51198a;
        }
    </style>

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
                    <img width="35%" src="<?php echo base_url('assets/images/bsjLogo.jpg'); ?>" alt="logo">
                </div>
                <?php
            }
        ?>        
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">                    
                    
                    <form role="form" action="<?php base_url('registration/register') ?>" method="post" enctype="multipart/form-data">
                        <!-- Page Showing only the demoogrpahic information to be collected -->
                        <div class="tab">
                            <div class="row">
                                <div class="col-md-6 col-xs-6">
                                    <div class="form-group">
                                        <label for="trn">TRN #:<font color="red"> *</font></label>
                                        <input type="number" class="form-control" name="trn" placeholder="123456789" value="">
                                    </div>
                                </div> 
                                <div class="col-md-6 col-xs-6">
                                    <div class="form-group">
                                        <label for="companyName">Company Name:<font color="red"> *</font></label>
                                        <input type="text" class="form-control" name="companyName" placeholder="Bureau of Standards" value="">
                                    </div> 
                                </div>
                            </div> 
                            <div class="row">
                                <div class="col-md-6 col-xs-6">
                                    <div class="form-group">
                                        <label for="clientName">Client Name:<font color="red"> *</font></label>
                                        <input type="text" class="form-control" name="clientName" placeholder="John Doe" value="">
                                    </div>
                                </div> 
                                <div class="col-md-6 col-xs-6">
                                    <div class="form-group">
                                        <label for="companyaddress">Address:<font color="red"> *</font></label>
                                        <input type="text" class="form-control" name="companyAddress" placeholder="6 Winchester Road" value="">
                                    </div> 
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-xs-6">
                                    <div class="form-group">
                                        <label for="companyCounty">County:<font color="red"> *</font></label>
                                        <select name="companyCounty" class="form-control select_group">
                                            <option value="">Select County</option>
                                            <?php foreach ($county as $k => $v): ?>
                                                <option value="<?php echo $v['id'] ?>" <?php echo set_select('county', $v['id']); ?>><?php echo $v['name'] ?></option>
                                            <?php endforeach ?>
                                        </select>
                                    </div>
                                </div> 
                                <div class="col-md-6 col-xs-6">
                                    <div class="form-group">
                                        <label for="companyParish">Parish:<font color="red"> *</font></label>
                                        <select name="companyParish" class="form-control select_group">
                                            <option value="">Select Parish</option>
                                            <?php foreach ($parish as $k => $v): ?>
                                            <option value="<?php echo $v['id'] ?>" <?php echo set_select('parish', $v['id']); ?>><?php echo $v['name'] ?></option>
                                            <?php endforeach ?>
                                        </select>
                                    </div> 
                                </div>                        
                            </div> 
                            <div class="row">
                                <div class="col-md-6 col-xs-6">
                                    <div class="form-group">
                                        <label for="companyCity">City/Town:<font color="red"> *</font></label>
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
                        <!-- Page showing the requirement questions to be filled out by the potential client -->
                        <div class="tab">
                            <?php
                            if(isset($requirement) && !empty($requirement))
                            {
                                $quest_no=0;
                                ?>
                                <p><span class="error">All fields are required.</span></p>
                                <?php
                                foreach($requirement as $k => $v)
                                {
                                    $quest_no++;
                                    ?>
                                    <label for="question"><?php echo $quest_no.") ".$v['question'];?></label>
                                    <br>
                                    <?php                                    
                                    if($v['question_type_id'] == '1' || $v['question_type_id'] == '2') //question_type_id equalling 1 or 2 will use textarea
                                    {
                                        ?>
                                        <textarea style="overflow:auto;resize:none" class="form-control" rows="1" name="<?php echo $v['id']?>"></textarea>
                                        <br>
                                        <?php
                                    }
                                    elseif($v['question_type_id'] == '3' || $v['question_type_id'] == '4')//question_type_id equalling 3 or 4 will use radio button
                                    {
                                        $options = json_decode($v['question_option'],true);
                                        if(!empty($options))
                                        {
                                            foreach($options as $option)
                                            {
                                                ?>
                                                <label for="response" class="radio-inline">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" class="form-check-input" name="<?php echo $v['id'];?>" value="<?php echo strtolower($option);?>"><?php echo $option;?>
                                                </label>
                                                <?php
                                            } 
                                            echo "<br>";
                                        }                                                                              
                                    }
                                    elseif($v['question_type_id'] == '5')//question_type_id equalling 5 will use dropdown list
                                    {
                                        $options = json_decode($v['question_option'],true);
                                        if(!empty($options))
                                        {
                                            ?>
                                            <div class="form-group">    
                                                <select name="<?php echo $v['id']?>" class="form-control">
                                                    <option value=" ">Select an Option</option>
                                                    <?php
                                                    foreach($options as $option)
                                                    {
                                                        ?>
                                                        <option value="<?php echo $option; ?>"><?php echo $option;?></option>
                                                        <?php
                                                    }  
                                                    ?>
                                                </select> 
                                            </div>
                                            <?php
                                        }           
                                    }
                                    elseif($v['question_type_id'] == '6')//question_type_id equalling 6 will use checkbox
                                    {
                                        $options = json_decode($v['question_option'],true);
                                        if(!empty($options))
                                        {
                                            ?>
                                            <div class="checkbox">
                                                <?php
                                                foreach($options as $option)
                                                {
                                                    ?>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label><input type="checkbox" name="<?php echo $v['id']?>"value="<?php echo $option;?>"><?php echo $option;?></label>
                                                    <?php                                                }
                                                ?>
                                            </div>
                                            
                                            <?php
                                            echo "<br>";
                                        }
                                    }                                    
                                }
                            }
                            else
                            {
                                ?>
                                <h3 align="center">No questions available.</h3>
                                <?php
                            }
                            ?>
                        </div>
                        <!-- Page asking what the client is specifically looking for -->
                        <div class="tab">
                                <p><span class='error'>All fields are required:</span></p>
                                <label for="standard">Target/Goal:</label>
                                <select name="standard" class="form-control select_group">
                                    <option value="">Select Standard</option>
                                    <?php foreach ($standard as $k => $v): ?>
                                        <option value="<?php echo $v['id'] ?>" <?php echo set_select('standard', $v['id']); ?>><?php echo $v['name'] ?></option>
                                    <?php endforeach ?>
                                </select>
                                <br>
                                <label for="objective">Briefly describe what your objective is.</label>
                                <textarea style="overflow:auto;resize:none" class="form-control" rows="2" name="objective"></textarea>
                                <br>
                                <label for="committmentLetter">Please upload committment letter here.</label>
                                <input type="file" class="form-control-file" name="committmentLetter"  value="">
                                <br>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-xs-6">
                                <div class="form-group">
                                    <button type="button" id="btnPrev" class="btn btn-outline-secondary btn-block" onclick="nextPrev(-1)">Previous</button>
                                </div>                                
                            </div>
                            <div class="col-md-6 col-xs-6">
                                <div class="form-group">
                                    <button type="button" id="btnNext" class="btn btn-primary btn-block" onclick="nextPrev(1)">Next</button>
                                </div>                                
                            </div>
                        </div>
                    </form>                    
                </div>
            </div>
        </div>        
    </div>
    <script>
        var currentTab = 0; // Current tab is set to be the first tab (0)
        showTab(currentTab); // Display the current tab
        
        function showTab(n) 
        {
            // This function will display the specified tab of the form...
            var x = document.getElementsByClassName("tab");
            x[n].style.display = "block";
            //... and fix the Previous/Next buttons:
            if (n == 0) {
                document.getElementById("btnPrev").style.display = "none";
            } else {
                document.getElementById("btnPrev").style.display = "inline";
            }
            if (n == (x.length - 1)) {
                document.getElementById("btnNext").innerHTML = "Submit";
            } else {
                document.getElementById("btnNext").innerHTML = "Next";
            }
        }

        function nextPrev(n) 
        {
            // This function will figure out which tab to display
            var x = document.getElementsByClassName("tab");
            
            // Hide the current tab:
            x[currentTab].style.display = "none";
            // Increase or decrease the current tab by 1:
            currentTab = currentTab + n;
            // if you have reached the end of the form...
            if (currentTab >= x.length) {
                // ... the form gets submitted:
                document.getElementById("clientRegForm").submit();
                return false;
            }
            // Otherwise, display the correct tab:
            showTab(currentTab);
        }
    </script>
</body>
</html>