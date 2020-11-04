<!----------------------------------------------------------------------------------------------------->
<!--                                                                                                 -->
<!--                                       C O N T E N T                                             -->
<!--                                                                                                 -->
<!-----------------------------------------------------------------------------------------------------> 

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>Edit Consultation <?php echo $consultation_data['consultation_no'].' - '.$consultation_data['company_name']; ?></h1>
    <ol class="breadcrumb">
      <li><a href="<?php echo base_url('consultation') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Consultation </li>
      <li><img width="25" height="25" data-toggle="tooltip" data-placement="bottom" title="Some information about the consultation." src="<?php echo base_url('assets/images/question.png'); ?>" /></li>
    </ol>
  </section>

  <section class="content">





<!----------------------------------------------------------------------------------------------------->
<!--                                                                                                 -->
<!--                                      P H A S E                                                  -->
<!--                                                                                                 -->
<!--   Depending on the phase, the icones will be active, non active or activated                    -->
<!--                                                                                                 -->
<!----------------------------------------------------------------------------------------------------->    


<form role="form" action="" method="post" class="f1">

<div class="f1-steps">
  

  <?php if ($consultation_data['phase_id'] ==1): ?>
    <div class="f1-progress">
      <div class="f1-progress-line" data-now-value="" data-number-of-steps="4" style="width: 12%;"></div>
    </div>
    <div class="f1-step active">
      <div class="f1-step-icon"><i class="fa fa-user"></i></div>
      <!-- method for display of the phase name from db   <p ><?php echo $consultation_data['phase_name']; ?></p> -->
      <p>Phase 1</p>
    </div>
    <div class="f1-step">
      <div class="f1-step-icon"><i class="fa fa-commenting-o"></i></div>
      <p>Phase 2</p>
    </div>
      <div class="f1-step">
      <div class="f1-step-icon"><i class="fa fa-eye"></i></div>
      <p>Phase 3</p>
    </div>
    <div class="f1-step">
      <div class="f1-step-icon"><i class="fa fa-book"></i></div>
      <p>Phase 4</p>
    </div>

  <?php elseif($consultation_data['phase_id'] ==2): ?>
    <div class="f1-progress">
      <div class="f1-progress-line" data-now-value="" data-number-of-steps="4" style="width: 37%;"></div>
    </div>
     <div class="f1-step activated">
      <div class="f1-step-icon"><i class="fa fa-user"></i></div>
      <p>Phase 1</p>
    </div>
    <div class="f1-step active">
      <div class="f1-step-icon"><i class="fa fa-commenting-o"></i></div>
      <p>Phase 2</p>
    </div>
      <div class="f1-step">
      <div class="f1-step-icon"><i class="fa fa-eye"></i></div>
      <p>Phase 3</p>
    </div>
    <div class="f1-step">
      <div class="f1-step-icon"><i class="fa fa-book"></i></div>
      <p>Phase 4</p>
    </div> 

  <?php elseif($consultation_data['phase_id'] ==3): ?>
     <div class="f1-progress">
        <div class="f1-progress-line" data-now-value="" data-number-of-steps="4" style="width: 62%;"></div>
     </div>
     <div class="f1-step activated">
      <div class="f1-step-icon"><i class="fa fa-user"></i></div>
      <p>Phase 1</p>
    </div>
    <div class="f1-step activated">
      <div class="f1-step-icon"><i class="fa fa-commenting-o"></i></div>
      <p>Phase 2</p>
    </div>
      <div class="f1-step active">
      <div class="f1-step-icon"><i class="fa fa-eye"></i></div>
      <p>Phase 3</p>
    </div>
    <div class="f1-step">
      <div class="f1-step-icon"><i class="fa fa-book"></i></div>
      <p>Phase 4</p>
    </div>  

   <?php elseif($consultation_data['phase_id'] ==4): ?>
    <div class="f1-progress">
        <div class="f1-progress-line" data-now-value="" data-number-of-steps="4" style="width: 100%;"></div>
     </div>
     <div class="f1-step activated">
      <div class="f1-step-icon"><i class="fa fa-user"></i></div>
      <p>Phase 1</p>
    </div>
    <div class="f1-step activated">
      <div class="f1-step-icon"><i class="fa fa-commenting-o"></i></div>
      <p>Phase 2</p>
    </div>
      <div class="f1-step activated">
      <div class="f1-step-icon"><i class="fa fa-eye"></i></div>
      <p>Phase 3</p>
    </div>
    <div class="f1-step active">
      <div class="f1-step-icon"><i class="fa fa-book"></i></div>
      <p>Phase 4</p>
    </div>    

  <?php endif; ?>  

</div>



<!----------------------------------------------------------------------------------------------------->
<!--                                                                                                 -->
<!--                                       Tab section                                               -->
<!--                                                                                                 -->
<!----------------------------------------------------------------------------------------------------->


      <ul class="nav nav-tabs">
        <li class="<?php echo (($active_tab === 'consultation') ? 'active' : '') ?>"><a data-toggle="tab" href="#consultation">Consultation</a></li>
        <li class="<?php echo (($active_tab === 'question') ? 'active' : '') ?>"><a data-toggle="tab" href="#question">Questions</a></li>
        <li class="<?php echo (($active_tab === 'document') ? 'active' : '') ?>"><a data-toggle="tab" href="#document">Documents</a></li>    
        
      </ul>   





<!----------------------------------------------------------------------------------------------------->
<!--                                                                                                 -->
<!--                             Error messages generated by the submit                              -->
<!--                                                                                                 -->
<!----------------------------------------------------------------------------------------------------->

    <!-- Small boxes (Stat box) -->
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
        <?php elseif($this->session->flashdata('warning')): ?>
          <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <?php echo $this->session->flashdata('warning'); ?>
          </div>
        <?php endif; ?>

        <div class="tab-content">




<!----------------------------------------------------------------------------------------------------->
<!--                                                                                                 -->
<!--                                        Session variables                                        -->
<!--                                                                                                 -->
<!----------------------------------------------------------------------------------------------------->


         <!-- Creation of a temporary session to keep the directory and information necessary for the manipulation
              of upload of documents -->

        <?php $this->session->unset_userdata('directory');?>
        <?php if(empty($this->session->userdata('directory'))) {
                $directory = array('directory' => '/upload/documents/'.$consultation_data['directory'].'/');
                $this->session->set_userdata($directory);
                } ?>

          <?php $this->session->unset_userdata('consultation_id');?>
          <?php if(empty($this->session->userdata('consultation_id'))) {
                $consultation_id = array('consultation_id' => $consultation_data['id']);
                $this->session->set_userdata($consultation_id);} ?>

          <?php $this->session->unset_userdata('client_id');?>
          <?php if(empty($this->session->userdata('client_id'))) {
                $client_id = array('client_id' => $consultation_data['client_id']);
                $this->session->set_userdata($client_id);} ?>






<!----------------------------------------------------------------------------------------------------->
<!--                                                                                                 -->
<!--                                        C O N S U L T A T I O N                                  -->
<!--                                                                                                 -->
<!----------------------------------------------------------------------------------------------------->



<div id="consultation" class="tab-pane fade <?php echo (($active_tab === 'consultation') ? 'in active' : '') ?>">  

  <div class="box">  <!-- BIG box -->    
  <form role="form" action="<?php base_url('consultation/update') ?>" method="post" enctype="multipart/form-data">
    <div class="box-body">

        <?php echo validation_errors(); ?>

      <div class="row">
        <div class="col-md-2 col-xs-2">

        <!---------------------------------------------------- box 1 --------------------------------------------->
        <div class="box box-solid box-default">
          <div class="box-body">
            <div class="form-group">
              <label for="company">Client</label> 

              <!-- you must have the permission to update the clien -->   
              <?php if(in_array('updateConsultation', $user_permission)): ?>      
                <?php echo '<a href="'.base_url('client/update/'.$consultation_data['client_id']).'" class="btn btn-default"><i class="fa fa-pencil"></i></a>'; ?>
              <?php endif; ?>

              <br>
              <?php echo $consultation_data['client_name']; ?><br>
              <?php echo 'Mobile: '.$consultation_data['mobile']; ?><br>
              <?php echo 'Phone:  '.$consultation_data['phone']; ?><br>
              
            </div>
            <div class="form-group">
              <label for="address">Address</label><br>  
              <?php echo $consultation_data['address']; ?><br>
              <?php echo $consultation_data['county_name'].', '.$consultation_data['parish_name']; ?><br>
              <?php echo $consultation_data['postal_code']; ?>
            </div>

            <a href="mailto:<?php echo $consultation_data['email']; ?>" class="btn btn-warning">Send Mail</a>


          </div>  <!-- /box-body -->   
   
        </div>  
        <!----------------------------------------------------end box 1 ------------------------------------------->



      <div class="row">
          <div class="col-md-12 col-xs-12">
              <!-- you must have the permission to give access to a client -->   
              <?php if(in_array('updateConsultation', $user_permission)): ?>      
                <?php echo '<a href="'.base_url('user/createUserClient/'.$consultation_data['client_id']).'" class="btn btn-primary">Give Access Client</a>'; ?> 
              <?php endif; ?>
            </div>
       </div>
       <br> 

       <div class="row">
        <div class="col-md-12 col-xs-12">           
          <?php echo '<a href="'.base_url('report_consultation/REP0I/'.$consultation_data['id']).'" target="_blank"  class="btn btn-success">Print Consultation</a>'; ?>
        </div> 
      </div>
      <br>

      <div class="row">
          <div class="col-md-12 col-xs-12">
          <?php echo '<a href="'.base_url('Manual01/QPM01/'.$consultation_data['id']).'" target="_blank"  
          class="btn btn-success">Print the Manual&nbsp;&nbsp;&nbsp;&nbsp;</a>'; ?>
          </div>
      </div>
      <br>
      <div class="row">           
        <div class="col-md-12 col-xs-12">
            Consultation created on <?php echo $consultation_data['date_creation']; ?><br><br>
            Last update <?php echo $consultation_data['updated_date']; ?> by <?php echo $consultation_data['updated_by']; ?>
        </div>    
      </div>  <!-- /end row submit -->


     </div>  <!-- /col1 -->



     <div class="col-md-10 col-xs-10">  <!-- col2 -->

        <!---------------------------------------------------- box 2 --------------------------------------------->
        <div class="box box-solid box-default">
          <div class="box-body">


            <div class="row">  <!-- row 1 -->

              <div class="col-md-6 col-xs-6">
                <div class="form-group">                 
                  <label for="client">Company <font color="red">*</font></label>
                  <select class="form-control select_group" id="client" name="client">
                        <option value=""></option>
                        <?php foreach ($client as $k => $v): ?>
                          <option value="<?php echo $v['id'] ?>"
                            <?php if(set_value('client', isset($consultation_data['client_id']) ? $consultation_data['client_id'] : '') == $v['id']) { echo "selected='selected'"; } ?> >
                            <?php echo $v['company_name'] ?><?php echo ' - trn '.$v['trn']; ?></option>
                        <?php endforeach ?>
                  </select>
                </div>
              </div>

               <div class="col-md-3 col-xs-3">
                <div class="form-group">
                  <label for="date_begin">Date begin <font color="red">*</font></label>
                  <input type="date" class="form-control" id="date_begin" name="date_begin" autocomplete="off"
                  value="<?php echo set_value('date_begin', isset($consultation_data['date_begin']) ? $consultation_data['date_begin'] : ''); ?>">
                </div>
              </div>   

              <div class="col-md-3 col-xs-3">
                <div class="form-group">
                  <label for="date_end">Date end <font color="red">*</font></label>
                  <input type="date" class="form-control" id="date_end" name="date_end" autocomplete="off"
                  value="<?php echo set_value('date_end', isset($consultation_data['date_end']) ? $consultation_data['date_end'] : ''); ?>">
                </div>
              </div>                

            </div>  <!-- / end row 1 -->

            
            <div class="row">  <!-- row 2 -->

              <div class="col-md-2 col-xs-2">
                <div class="form-group">
                  <label for="consultation_no">No <font color="red">*</font></label>
                  <input type="text" class="form-control" id="consultation_no" name="consultation_no" autocomplete="off"
                  value="<?php echo set_value('consultation_no', isset($consultation_data['consultation_no']) ? $consultation_data['consultation_no'] : ''); ?>">
                </div>
              </div>

              <div class="col-md-6 col-xs-6">
                <div class="form-group">
                  <label for="description">Description <font color="red">*</font></label>
                  <input type="text" class="form-control" id="description" name="description" autocomplete="off"
                  value="<?php echo set_value('description', isset($consultation_data['description']) ? $consultation_data['description'] : ''); ?>" />
                </div>
              </div>

               <div class="col-md-4 col-xs-4">
                <div class="form-group">
                  <label for="consultant">Consultant(s)</label>
                  <?php $consultant_data = json_decode($consultation_data['consultant_id']); ?>
                  <select class="form-control select_group" id="consultant" name="consultant[]" multiple="multiple">
                    <option value=""></option>
                    <?php foreach ($consultant as $k => $v): ?>
                       <option value="<?php echo $v['id'] ?>" 
                      <?php if ($consultant_data===Null) {} else {if(in_array($v['id'], $consultant_data)) { echo 'selected="selected"'; }} ?>><?php echo $v['name'] ?></option>
                    <?php endforeach ?>
                  </select>
                </div>
              </div>   
             
            </div>  <!-- end /row 2 -->    

            <div class="row">  <!-- row 3 -->

              <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="program">Program<font color="red"> *</font></label>
                      <select class="form-control select_group" id="program" name="program">
                       <option value="">Select Program</option>
                        <?php
                          foreach($program as $row)
                          {
                           echo '<option value="'.$row->id.'"';                           
                           if(set_value('program', isset($consultation_data['program_id']) ? $consultation_data['program_id'] : '') == $row->id) { echo 'selected="selected"'; };
                           echo '>'.$row->name; '</option>';
                          }
                        ?>
                       </select>
                    </div>
                  </div>  

               <div class="col-md-4 col-xs-4">
                <div class="form-group">
                  <label for="phase">Phase<font color="red"> *</font></label>
                  <select class="form-control select_group" id="phase" name="phase">
                    <option value="">Select Phase</option>
                    <?php foreach ($phase as $k => $v): ?>
                      <option value="<?php echo $v['id'] ?>"<?php if(set_value('phase', isset($consultation_data['phase_id']) ? $consultation_data['phase_id'] : '') == $v['id']) { echo "selected='selected'"; } ?> ><?php echo $v['name'] ?></option>
                    <?php endforeach ?>
                  </select>
                </div>
              </div>   

              <div class="col-md-4 col-xs-4">
                <div class="form-group">
                  <label for="status">Status<font color="red"> *</font></label>
                  <select class="form-control select_group" id="status" name="status">
                    <option value="">Select Status</option>
                    <?php foreach ($status as $k => $v): ?>
                      <option value="<?php echo $v['id'] ?>"<?php if(set_value('status', isset($consultation_data['status_id']) ? $consultation_data['status_id'] : '') == $v['id']) { echo "selected='selected'"; } ?> ><?php echo $v['name'] ?></option>
                    <?php endforeach ?>
                  </select>
                </div>
              </div>    
              
            </div>  <!-- end /row 3 -->     
            

            
            <div class="row"> <!-- row 4 -->  

             <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="standard">Standard<font color="red"> *</font></label>
                      <select class="form-control select_group" id="standard" name="standard">
                       <option value="">Select Standard</option>
                        <?php
                          foreach($standard as $row)
                          {
                           echo '<option value="'.$row->id.'"';                           
                           if(set_value('standard', isset($consultation_data['standard_id']) ? $consultation_data['standard_id'] : '') == $row->id) { echo 'selected="selected"'; };
                           echo '>'.$row->name; '</option>';
                          }
                        ?>
                       </select>
                    </div>
                  </div>  

             <div class="col-md-4 col-xs-4">
                <div class="form-group">
                  <label for="clause">Clause<font color="red"> *</font></label>
                  <select class="form-control select_group" id="clause" name="clause">
                    <option value="">Select Clause</option>
                    <?php foreach ($clause as $k => $v): ?>
                      <option value="<?php echo $v['id'] ?>"<?php if(set_value('clause', isset($consultation_data['clause_id']) ? $consultation_data['clause_id'] : '') == $v['id']) { echo "selected='selected'"; } ?> ><?php echo $v['name'] ?></option>
                    <?php endforeach ?>
                  </select>
                </div>
              </div>    

              
              <div class="col-md-4 col-xs-4">
                <div class="form-group">
                  <label for="sector">Sector<font color="red"> *</font></label>
                  <select class="form-control select_group" id="sector" name="sector">
                    <option value="">Select Sector</option>
                    <?php foreach ($sector as $k => $v): ?>
                      <option value="<?php echo $v['id'] ?>"<?php if(set_value('sector', isset($consultation_data['sector_id']) ? $consultation_data['sector_id'] : '') == $v['id']) { echo "selected='selected'"; } ?> ><?php echo $v['name'] ?></option>
                    <?php endforeach ?>
                  </select>
                </div>
              </div>        
       
              
            </div>  <!-- /end row 4 --> 


            <div class="row"> <!--  row 5 --> 

              <div class="col-md-4 col-xs-4">
                <div class="form-group">
                  <label for="business_process">Business Process</label>
                  <textarea type="text" class="form-control" rows="3" id="business_process" name="business_process" autocomplete="off"><?php echo set_value('business_process', isset($consultation_data['business_process']) ? $consultation_data['business_process'] : ''); ?></textarea>
                </div>
              </div>

              <div class="col-md-4 col-xs-4">
                <div class="form-group">
                  <label for="board_meeting_time_period">Board meeting time period</label>
                  <textarea type="text" class="form-control" rows="3" id="board_meeting_time_period" name="board_meeting_time_period" autocomplete="off"><?php echo set_value('board_meeting_time_period', isset($consultation_data['board_meeting_time_period']) ? $consultation_data['board_meeting_time_period'] : ''); ?></textarea>
                </div>
              </div>

              <div class="col-md-4 col-xs-4">
                <div class="form-group">
                  <label for="management_review_time">Management review time</label>
                  <textarea type="text" class="form-control" rows="3" id="management_review_time" name="management_review_time" autocomplete="off"><?php echo set_value('management_review_time', isset($consultation_data['management_review_time']) ? $consultation_data['management_review_time'] : ''); ?></textarea>
                </div>
              </div>

             

            </div>   <!-- /end row 5 --> 


            <div class="row"> <!-- row 6 --> 

              <div class="col-md-4 col-xs-4">
                <div class="form-group">
                  <label for="product">Product offered</label>
                  <textarea type="text" class="form-control" rows="3" id="product" name="product" autocomplete="off"><?php echo set_value('product', isset($consultation_data['product']) ? $consultation_data['product'] : ''); ?></textarea>
                </div>
              </div>

              <div class="col-md-4 col-xs-4">
                <div class="form-group">
                  <label for="quality_policy">Quality policy</label>
                  <textarea type="text" class="form-control" rows="3" id="quality_policy" name="quality_policy" autocomplete="off"><?php echo set_value('quality_policy', isset($consultation_data['quality_policy']) ? $consultation_data['quality_policy'] : ''); ?></textarea>
                </div>
              </div>

               <div class="col-md-4 col-xs-4">
                <div class="form-group">
                  <label for="exemption">Exemption</label>
                  <textarea type="text" class="form-control" rows="3" id="exemption" name="exemption" autocomplete="off"><?php echo set_value('exemption', isset($consultation_data['exemption']) ? $consultation_data['exemption'] : ''); ?></textarea>
                </div>
              </div>

            </div>  <!-- /end row 6 -->    

            <div class="form-group">
              <label for="remark">Remark</label>
              <textarea type="text" class="form-control" id="remark" name="remark" rows="3" autocomplete="off"><?php echo set_value('remark', isset($consultation_data['remark']) ? $consultation_data['remark'] : ''); ?></textarea>
            </div>


        </div> <!-- /end box body -->

          <div class="box-footer">
            <?php if(in_array('updateConsultation', $user_permission)): ?>   <!-- you must have the permission to update to get the Save button --> 
              <button type="submit" class="btn btn-primary">Save</button>
           <?php endif; ?>   
            <a href="<?php echo base_url('consultation/') ?>" class="btn btn-warning">Close</a>
          </div>

        </div> 
        <!----------------------------------------------------end  box 2 --------------------------------------------->

      </div>
    </div>
  </div>
</form>

</div>
</div>

    

<!-- Javascript part of Consultation  -->

<script type="text/javascript">


  $(document).ready(function() {

    $('[data-toggle="tooltip"]').tooltip();

    $(".select_group").select2({width: '100%'});
    //$("#remark").wysihtml5();

    $("#mainConsultationNav").addClass('active');
    $("#manageConsultationNav").addClass('active');


//--> Change of the standard, call the clause list

        $('#standard').change(function(){
        var standard_id = $('#standard').val();
        if(standard_id != '')
        {
         $.ajax({
                url: base_url + 'dynamic_dependent/fetch_clause',
                method:"POST",
                data:{standard_id:standard_id},
                success:function(data)
                {
                 $('#clause').html(data);
                }
               });
        }
        else
        {
         $('#clause').html('<option value="">Select Clause</option>');
        }
       });


//--> Change of the program, call the phase list

        $('#program').change(function(){
        var program_id = $('#program').val();
        if(program_id != '')
        {
         $.ajax({
                url: base_url + 'dynamic_dependent/fetch_phase',
                method:"POST",
                data:{program_id:program_id},
                success:function(data)
                {
                 $('#phase').html(data);
                 $('#status').html('<option value="">Select Status</option>');
                }
               });
        }
        else
        {
         $('#phase').html('<option value="">Select Phase</option>');
         $('#status').html('<option value="">Select Status</option>');
        }
       });



//--> Change of the phase, call the status list

        $('#phase').change(function(){
        var phase_id = $('#phase').val();
        if(phase_id != '')
        {
         $.ajax({
              url: base_url + 'dynamic_dependent/fetch_status',
              method:"POST",
              data:{phase_id:phase_id},
              success:function(data)
              {
               $('#status').html(data);
              }
             });
        }
        else
        {
         $('#status').html('<option value="">Select Status</option>');
        }
       });

  });


</script>




 


<!----------------------------------------------------------------------------------------------------->
<!--                                                                                                 -->
<!--                                        Q U E S T I O N                                          -->
<!--                                                                                                 -->
<!----------------------------------------------------------------------------------------------------->


  <div id="question" class="tab-pane fade <?php echo (($active_tab === 'question') ? 'in active' : '') ?>">
    <div class="box">
      <div class="box-body" id="questionForm"> 
        <table width='100%' id="manageTable" class="table table-bordered table-striped">
          <thead>
            <tr> 
                <th>Question Number</th>
                <th>Question</th>
                <th>Action</th>
            </tr>
          </thead>
        </table>
      </div> 
    </div>    
  </div>

 <!-- JavaScript for QUESTION -->
 <script type="text/javascript">
  var program_id = $('#program').val();
  var phase_id = $('#phase').val();
  var consultation_id = $('#consultation_no').val();
  var result;
  var base_url= "<?php echo base_url(); ?>";

  var manageTable;
  manageTable=$('#manageTable').DataTable({
    'ajax': base_url + 'consultation/fetchQuestions/'+phase_id+'/'+program_id+'/'+'<?php echo $consultation_data['id']; ?>'
  });
  // $(document).ready(function(){
  //   $.ajax({
  //     url: '<?php echo base_url();?>' + 'consultation/captureQuestion/'+phase_id+'/'+standard_id,
  //     dataType: "json",
  //     data: result,
  //     success:function(result){
  //       if(result.status=='ok')
  //       {
  //         let questNo=0;
  //         for(i in result.question)
  //         {
	// 		      questNo++;
  //           let questionId, question, questionType, option;
  //           questionId=result.question[i].questionId;
  //           question=result.question[i].question;
  //           questionType=result.question[i].questionType;
  //           let html=``;
  //           html=`<label for='q`+questionId+`'>`+questNo+')'+question+`</label>`;
  //           if(result.hasOwnProperty("question_option"))
  //           {
  //             var options = [];
  //             for(count in result.question_option)
	// 			      {
  //               if(result.question_option[count].question_id === result.question[i].questionId)
  //               {
  //                 options.push(result.question_option[count].option_desc);
  //               }
  //             }
  //           }
  //           if(questionType === "TEXT" || questionType === "TEXTAREA")
  //           {
  //               html+=`<textarea style='overflow:auto;resize:none' class='form-control' rows='1' name='`+questionId+`'></textarea>`;
  //           }
  //           else if(questionType === "BOOLEAN" || questionType === "RADIO")
  //           {
  //             if(options !== undefined)
  //             {
  //               options.forEach(function(option)
  //               {
  //                 html+=`<div class='form-check-inline'>
  //                           <label class='form-check-label'>
  //                               <input type='radio' class='form-check-input' name='`+questionId+`' value='`+option+`'>  `+option+`
  //                           </label>
  //                       </div>`;
  //               });
  //             }
  //           }
  //           else if(questionType === "LIST")
  //           {
  //             if(options !== undefined)
  //             {
  //               html+=`<div class='form-group'>`+
  //                         `<select class='form-control' name='`+questionId+`'>
  //                           <option value='' selected>Select One</option>`;
  //               options.forEach(function(option)
  //               {
  //                 html+=`<option value='`+option+`'>`+option+`</option>`;
  //               });
  //               html+=`</select></div>`;
  //             }
  //           }
  //           else if(questionType === "CHECKBOX")
  //           {
  //             if(options !== undefined)
  //             {
  //               options.forEach(function(option)
  //               {
  //                 html+=`<div class='form-check-inline'>
  //                           <label class='form-check-label'>
  //                               <input type='checkbox' class='form-check-input' name='`+questionId+`' value='`+option+`'>  `+option+`
  //                           </label>
  //                       </div>`;
  //               });
  //             }
  //           }
  //           let form = document.getElementById('questionForm'); 
  //           form.innerHTML += html;
  //         }
  //       }
  //     }
  //   });
  // });
 </script>
 




<!----------------------------------------------------------------------------------------------------->
<!--                                                                                                 -->
<!--                                        D O C U M E N T                                         -->
<!--                                                                                                 -->
<!----------------------------------------------------------------------------------------------------->


    <div id="document" class="tab-pane fade <?php echo (($active_tab === 'document') ? 'in active' : '') ?>">  

      <div class="box">
        <div class="box-body">
          <div class="row">
            <div class="col-md-12 col-xs-12">

            <?php echo form_open_multipart('consultation/uploadDocument/') ?>
            <?php echo "<table width='100%'>" ?>
            <?php echo "<tr>" ?>           

            <?php if(in_array('createDocument', $user_permission)): ?>

                <!-- Drop-down list Type of document  -->  
                <?php echo "<td width='25%'><div class='form_group'>" ?>
                <?php echo "<label for='document_type'>Type of document" ?>
                <?php echo "<select class='form-control select_group' id='document_type' name='document_type'>" ?>
                <?php echo "<option value=''></option>" ?>
                        <?php foreach ($document_type as $k => $v): ?>
                            <option value="<?php echo $v['id'] ?>" ><?php echo $v['name'] ?></option>
                        <?php endforeach ?> 
                <?php echo " </select></div>" ?>
                <?php echo "&nbsp;&nbsp;&nbsp;</label></td>" ?>

                <!-- Drop-down list Classification of document   -->
                <?php echo "<td width='20%'><div class='form_group'>" ?>
                <?php echo "<label for='document_class'>Classification" ?>
                <?php echo "<select class='form-control select_group' id='document_class' name='document_class'>" ?>
                <?php echo "<option value=''></option>" ?>
                        <?php foreach ($document_class as $k => $v): ?>
                            <option value="<?php echo $v['id'] ?>" ><?php echo $v['name'] ?></option>
                        <?php endforeach ?> 
                <?php echo " </select></div>" ?>
                <?php echo "&nbsp;&nbsp;&nbsp;</label></td>" ?>


                <!-- Input the name of the document -->
                <?php echo "<td width='40%' align=left><input type='file' required='required' name='consultation_document' id='consultation_document' size='60'  /></td>" ?> 

                <!-- Submit the document -->
                <?php echo "<td width='15%'><input type='submit' name='submit' class='btn btn-primary' value='Add Document' /></td>" ?>
            <?php endif; ?>
            
            <?php echo "</tr>" ?>
            <?php echo "</div>" ?>
            <?php echo "</table>" ?>
            <?php echo "</form>"?>



              <br>

              <div class="col-md-12 col-xs-12">
                <table id="manageTableDocument" class="table table-bordered table-striped" style="width:100%">
                  <thead>
                    <tr>
                      <th>Document</th>
                      <th>Type</th>
                      <th>Classification</th>
                      <th>Size</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                </table>
            </div>

          </div>
        </div>

        <div class="box-footer">
            <a href="<?php echo base_url('consultation/') ?>" class="btn btn-warning">Close</a>
        </div>

      </form>
    </div>
  </div>
  </div>








<!--  End of the form  -->
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</div>


<!-- Delete Document -->

<?php if(in_array('deleteDocument', $user_permission)): ?>

<div class="modal fade" tabindex="-1" role="dialog" id="removeDocumentModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Delete Document</h4>
      </div>
      <form role="form" action="<?php echo base_url('consultation/removeDocument') ?>" method="post" id="removeFormDocument">
        <div class="modal-body">
          <p>Do you really want to delete?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Delete</button>
        </div>
      </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<?php endif; ?>


<!------------------------------------->
<!-- Javascript part of Document    --->
<!------------------------------------->


<script type="text/javascript">
var manageTableDocument;
var base_url = "<?php echo base_url(); ?>";


  $("#DocumentConsultationNav").addClass('active');

  // initialize the datatable
  manageTableDocument = $('#manageTableDocument').DataTable({
    'ajax': base_url+'consultation/fetchConsultationDocument/'+'<?php echo $consultation_data['id']; ?>',
    'order': [[0, "asc"]]
  });




function removeDocument(id)
{
  if(id) {
    $("#removeFormDocument").on('submit', function() {

      var form = $(this);

      // remove the text-danger
      $(".text-danger").remove();

      $.ajax({
        url: form.attr('action'),
        type: form.attr('method'),
        data: { document_id:id },
        dataType: 'json',
        success:function(response) {

          manageTableDocument.ajax.reload(null, false);

          if(response.success === true) {
            // hide the modal
            $("#removeDocumentModal").modal('hide');

          } else {

            $("#messages").html('<div class="alert alert-warning alert-dismissible" role="alert">'+
              '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
              '<strong> <span class="glyphicon glyphicon-exclamation-sign"></span> </strong>'+response.messages+
            '</div>');
          }
        }
      });

      return false;
    });
  }
}
</script>


