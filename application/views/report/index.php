
<div class="content-wrapper">
  <section class="content-header">
    <h1>Reports</h1>
    <ol class="breadcrumb">
      <li><a href="<?php echo base_url('dashboard') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Reports</li>
    </ol>
  </section>


<!--------------------------------------------  Main ---------------------------------------------------------->

  <section class="content">
    <div class="row">
      <div class="col-md-12 col-xs-12">

        <div id="messages"></div>

        <?php if($this->session->flashdata('success')): ?>
          <div class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <?php echo $this->session->flashdata('success'); ?>
          </div>
        <?php elseif($this->session->flashdata('error')): ?>
          <div class="alert alert-error alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <?php echo $this->session->flashdata('error'); ?>
          </div>
        <?php endif; ?>



        <div class="box">
          <div class="box-header"></div>
          <!-- /.box-header -->
          <form role="form" action="<?php base_url('Report/') ?>" method="post" enctype="multipart/form-data">
              <div class="box-body">


                <?php echo validation_errors(); ?>

                <!-- the session variable printdoc is assigned in report.php.  When the index view of report is loaded from the menu
                     on left side, printdoc is equal to "no" and we present the report form with the criterias.
                     When the form is submitted after a report is asked, the session variable printdoc will be equal to "yes"
                     and the report will be presented in the pdf view of the browser.  -->

                <?php if($this->session->printdoc == 'no') : ?>


                <div class="row">
                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="report">Choose the report</label>
                      <select class="form-control select_group" id="report" name="report">
                        <option value=""></option>
                        <?php foreach ($report as $k => $v): ?>
                        <option value="<?php echo $v['report_code'] ?>"><?php echo $v['report_code'] ?> - <?php echo $v['report_title'] ?></option>
                        <?php endforeach ?>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="county">County</label>
                      <select class="form-control select_group" id="county" name="county">
                        <option value="all">All County</option>
                        <?php foreach ($county as $k => $v): ?>
                        <option value="<?php echo $v['id'] ?>"><?php echo $v['name'] ?></option>
                        <?php endforeach ?>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="parish">Parish</label>
                      <select class="form-control select_group" id="parish" name="parish" >
                        <option value="all">All Parish</option>
                        <?php foreach ($parish as $k => $v): ?>
                          <option value="<?php echo $v['id'] ?>"><?php echo $v['name'] ?></option>
                        <?php endforeach ?>
                      </select>
                    </div>
                  </div>
                </div>


                <div class="row">
                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="client">Client</label>
                      <select class="form-control select_group" id="client" name="client">
                        <option value="all">All Client</option>
                        <?php foreach ($client as $k => $v): ?>
                        <option value="<?php echo $v['id'] ?>"><?php echo $v['company_name'] ?></option>
                        <?php endforeach ?>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="consultation">Consultation</label>
                      <select class="form-control select_group" id="consultation" name="consultation">
                        <option value="all">All Consultation</option>
                        <?php foreach ($consultation as $k => $v): ?>
                        <option value="<?php echo $v['id'] ?>"><?php echo $v['consultation_no'] ?></option>
                        <?php endforeach ?>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="word">Search with a word</label>
                      <input type="text" class="form-control" id="word" name="word" autocomplete="off" />
                   </div>
                  </div>
                </div>


                <div class="row">
                  
                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="sector">Sector</label>
                      <select class="form-control select_group" id="sector" name="sector">
                        <option value="all">All Sector</option>
                        <?php foreach ($sector as $k => $v): ?>
                        <option value="<?php echo $v['id'] ?>"><?php echo $v['name'] ?></option>
                        <?php endforeach ?>
                      </select>
                    </div>
                  </div>

                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="standard">Standard</label>
                      <select class="form-control select_group" id="standard" name="standard" >
                        <option value="all">All Standard</option>
                        <?php foreach ($standard as $k => $v): ?>
                          <option value="<?php echo $v['id'] ?>"><?php echo $v['name'] ?></option>
                        <?php endforeach ?>
                      </select>
                    </div>
                  </div>

                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="consultant">Consultant</label>
                      <select class="form-control select_group" id="consultant" name="consultant" >
                        <option value="all">All Consultant</option>
                        <?php foreach ($consultant as $k => $v): ?>
                          <option value="<?php echo $v['id'] ?>"><?php echo $v['name'] ?></option>
                        <?php endforeach ?>
                      </select>
                    </div>
                  </div>
                </div>


              <div class="row">
                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="phase">Phase Consultation</label>
                      <select class="form-control select_group" id="phase" name="phase" >
                        <option value="all">All Phase</option>
                        <?php foreach ($phase as $k => $v): ?>
                          <option value="<?php echo $v['id'] ?>"><?php echo $v['name'] ?></option>
                        <?php endforeach ?>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="status">Status Consultation</label>
                      <select class="form-control select_group" id="status" name="status" >
                        <option value="all">All Status</option>
                        <?php foreach ($status as $k => $v): ?>
                          <option value="<?php echo $v['id'] ?>"><?php echo $v['name'] ?></option>
                        <?php endforeach ?>
                      </select>
                    </div>
                  </div>
                  
              </div>


              <div class="row">
                  <div class="col-md-2 col-xs-2">
                    <div class="form-group">
                      <label for="date_creation_from">Consultation Begin between</label>
                      <input type="date" class="form-control" id="date_creation_from" name="date_creation_from" autocomplete="off"  />
                    </div>
                  </div>
                  <div class="col-md-2 col-xs-2">
                    <div class="form-group">
                      <label for="date_creation_to">and</label>
                      <input type="date" class="form-control" id="date_creation_to" name="date_creation_to" autocomplete="off"  />
                    </div>
                  </div>
                  <div class="col-md-2 col-xs-2">
                    <div class="form-group">
                      <label for="date_from">Date from</label>
                      <input type="date" class="form-control" id="date_from" name="date_from" autocomplete="off"  />
                    </div>
                  </div>
                  <div class="col-md-2 col-xs-2">
                    <div class="form-group">
                      <label for="date_to">Date to</label>
                      <input type="date" class="form-control" id="date_to" name="date_to" autocomplete="off"  />
                    </div>
                  </div>
                </div>

              <div class="row">
                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="year">Year</label>
                      <br>
                      <?php
                      //get the current year
                      $Startyear=date('Y');
                      $endYear=$Startyear-10;

                      // set start and end year range i.e the start year
                      $yearArray = range($Startyear,$endYear);
                      ?>
                      <!-- here you displaying the dropdown list -->
                      <select class="form-control select_group" id="year" name="year">
                        <option value=""></option>
                          <?php foreach ($yearArray as $year) {
                              // this allows you to select a particular year
                              $selected = ($year == $Startyear) ? 'selected' : '';
                              echo '<option '.$selected.' value="'.$year.'">'.$year.'</option>';
                          }?>
                      </select>
                    </div>
                  </div>

                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="support_type">Support Type</label>
                      <select class="form-control select_group" id="support_type" name="support_type" >
                        <option value="all">All Type</option>
                        <?php foreach ($support_type as $k => $v): ?>
                          <option value="<?php echo $v['id'] ?>"><?php echo $v['name'] ?></option>
                        <?php endforeach ?>
                      </select>
                    </div>
                  </div>

                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="inquiry_type">Inquiry Type</label>
                      <select class="form-control select_group" id="inquiry_type" name="inquiry_type" >
                        <option value="all">All Type</option>
                        <?php foreach ($inquiry_type as $k => $v): ?>
                          <option value="<?php echo $v['id'] ?>"><?php echo $v['name'] ?></option>
                        <?php endforeach ?>
                      </select>
                    </div>
                  </div>
              </div>


     <br />

      <?php if(in_array('viewReport', $user_permission)): ?>
        <button type="submit" class="btn btn-primary">Generate</button>
        <button type="reset" id="reset" class="btn btn-warning">Reset</button>
        <br /> <br />
      <?php endif; ?>

      <?php endif; ?>  <!-- printdoc or criteria screen -->



<!-------------------------------------------------  P R I N T    R E P O R T S  ------------------------------------------- -->

    <?php if($this->session->printREP01 == 'yes') : ?>
      <object data="<?php echo  base_url("report01/REP01"); ?>" width="100%" height="1000px" type="application/pdf"> </object>
    <?php endif; ?>

    <?php if($this->session->printREP02 == 'yes') : ?>
      <object data="<?php echo  base_url("report02/REP02"); ?>" width="100%" height="1000px" type="application/pdf"> </object>
    <?php endif; ?>

    <?php if($this->session->printREP04 == 'yes') : ?>
      <object data="<?php echo  base_url("report04/REP04"); ?>" width="100%" height="1000px" type="application/pdf"> </object>
    <?php endif; ?>

    <?php if($this->session->printREP05 == 'yes') : ?>
      <object data="<?php echo  base_url("report05/REP05"); ?>" width="100%" height="1000px" type="application/pdf"> </object>
    <?php endif; ?>


   </div>

  </form>
</section>    <!-- /.content -->
</div>  <!-- /.content-wrapper -->




 <!----------------------------------------------------------  J A V A S C R I P T ------------------------------------------- -->


<script type="text/javascript">

  //--> disable all the parameters
  //    only the report list is available

  function disable_all(){
    $("#county").prop( 'disabled', true );
    $("#client").prop( 'disabled', true );
    $("#date_from").prop( 'disabled', true );
    $("#date_to").prop( 'disabled', true );
    $("#date_creation_from").prop( 'disabled', true );
    $("#date_creation_to").prop( 'disabled', true );   
    $("#inquiry_type").prop( 'disabled', true );
    $("#generate").prop( 'disabled', true );
    $("#consultation").prop( 'disabled', true );
    $("#standard").prop( 'disabled', true );
    $("#sector").prop( 'disabled', true );
    $("#phase").prop( 'disabled', true );
    $("#consultant").prop( 'disabled', true );
    $("#parish").prop( 'disabled', true );
    $("#status").prop( 'disabled', true );
    $("#support_type").prop( 'disabled', true );
    $("#word").prop( 'disabled', true );
    $("#year").prop( 'disabled', true );
  }

  // On load, we disable all paramaters
  // In load must be out of ready function to work
  $(window).on('load', function() {disable_all() });

  // On reset we disable all parameters
  $("#reset").click(function(){disable_all() });

  //--> Treatment of reports

  $("#report").on('change', function(){

    //--> Disable all the parameters

    disable_all();

    //--> Enable the parameters depending on the report chosen

    switch($("#report :selected").val()) {
      case 'REP01':
           $("#county").prop( 'disabled', false );
           $("#parish").prop( 'disabled', false );     
           $("#generate").prop( 'disabled', false );
           break;
      case 'REP02':
           $("#phase").prop( 'disabled', false );
           $("#status").prop( 'disabled', false );
           $("#standard").prop( 'disabled', false );
           $("#consultant").prop( 'disabled', false );
           $("#sector").prop( 'disabled', false );
           $("#date_creation_from").prop( 'disabled', false );
           $("#date_creation_to").prop( 'disabled', false );
           $("#generate").prop( 'disabled', false );
           break;
	  case 'REP04':
           $("#inquiry_type").prop( 'disabled', false );
           $("#date_from").prop( 'disabled', false );
           $("#date_to").prop( 'disabled', false );
           $("#support_type").prop( 'disabled', false );
           $("#generate").prop('disabled',false);
           break;
    case 'REP05':
           $("#phase").prop( 'disabled', false );
           $("#status").prop( 'disabled', false );
           $("#date_creation_from").prop( 'disabled', false );
           $("#date_creation_to").prop( 'disabled', false );
           $("#consultant").prop( 'disabled', false );
           $("#generate").prop( 'disabled', false );
           break;

    }
  });


</script>
