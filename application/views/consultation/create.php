<div class="content-wrapper">
  <section class="content-header">
    <h1>Add Consultation</h1>
    <ol class="breadcrumb">
      <li><a href="<?php echo base_url('consultation') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Consultation</li>
      <li><img width="25" height="25" data-toggle="tooltip" data-placement="bottom" title="Some information about the consultation." src="<?php echo base_url('assets/images/question.png'); ?>" /></li>
    </ol>
  </section>

<!-----------------------------------------------------------  Main ------------------------------------------------------------------>

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
          <form role="form" action="<?php base_url('consultation/create') ?>" method="post" enctype="multipart/form-data">
              <div class="box-body">

                <?php echo validation_errors(); ?>


                <div class="row">

                  <div class="col-md-2 col-xs-2">
                    <div class="form-group">
                      <label for="consultation_no">No <font color="red">*</font></label>
                      <input type="text" class="form-control" id="consultation_no" name="consultation_no" autocomplete="off"
                      value="<?php echo set_value('consultation_no'); ?>"/>
                    </div>
                  </div>


                  <div class="col-md-5 col-xs-5">
                    <div class="form-group">
                      <label for="description">Description <font color="red">*</font></label>
                      <input type="text" class="form-control" id="description" name="description" autocomplete="off"
                      value="<?php echo set_value('description'); ?>"/>
                    </div>
                  </div>

                  <div class="col-md-5 col-xs-5">
                    <div class="form-group">
                      <label for="consultant">Consultant(s)</label>
                      <select class="form-control select_group" id="consultant" name="consultant[]" multiple="multiple">
                        <option value=""></option>
                        <?php foreach ($consultant as $k => $v): ?>
                        <option value="<?php echo $v['id'] ?>" <?php echo set_select('consultant[]', $v['id']); ?>><?php echo $v['name'] ?></option>
                        <?php endforeach ?>
                      </select>
                    </div>
                  </div>

              </div> 



             <div class="row">

                 <!-- If the create come from the client edit, we have alrady the client id, in this case
                      the list will be filled with the client/company and disabled.  If not it means it comes
                      from the Add consultation and we don't know the client -->

                 <div class="col-md-6 col-xs-6">
                    <div class="form-group">
                  <label for="client">Company Name <font color="red">*</font></label>
                  <select class="form-control select_group" id="client_holder" name="client_holder" <?php if($fromClient!=null) echo 'disabled=disabled';?>>
                        <option value="" hidden selected disabled>Select Client</option> 
                        <?php foreach ($client as $k => $v): ?>
                          <option value="<?php echo $v['id'] ?>" 
                             <?php if(set_value('client', isset($fromClient) ? $fromClient : '') == $v['id']) { echo "selected='selected'"; } ?> >
                            <?php echo $v['company_name'] ?>/
                            <?php echo $v['address'] ?></option>
                        <?php endforeach ?>
                      </select>
                      <input type="text" name="client" id="client" value="<?php echo $fromClient ?>" hidden>
                  </div>    
                </div>

                  <div class="col-md-2 col-xs-2">
                    <div class="form-group">
                      <label for="date_creation">Date creation</label></label>
                      <input type="date" class="form-control" id="date_creation" name="date_creation" autocomplete="off"
                      value="<?php echo date('Y-m-d'); ?>" >
                    </div>
                  </div>

                  <div class="col-md-2 col-xs-2">
                    <div class="form-group">
                      <label for="date_begin">Date begin</label></label>
                      <input type="date" class="form-control" id="date_begin" name="date_begin" autocomplete="off" 
                       value="<?php echo date('Y-m-d'); ?>" >
                    </div>
                  </div>

                  <div class="col-md-2 col-xs-2">
                    <div class="form-group">
                      <label for="date_end">Date end</label></label>
                      <input type="date" class="form-control" id="date_end" name="date_end" autocomplete="off">
                    </div>
                  </div>

               </div>
               


               <div class="row">   

                <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="program">Program<font color="red"> *</font></label>
                      <select class="form-control select_group" id="program" name="program">
                       <option value="">Select Program</option>
                        <?php
                          foreach($program as $row)
                          {
                           echo '<option value="'.$row->id.'">'.$row->name.'</option>';
                          }
                        ?>
                       </select>
                    </div>
                  </div>  

                <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="phase">Phase<font color="red"> *</font></label>
                      <select class="form-control select_group" id="phase" name="phase">
                        <option value=""></option>                        
                      </select>
                    </div>
                  </div> 

                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="status">Status<font color="red"> *</font></label>
                      <select class="form-control select_group" id="status" name="status">
                        <option value=""></option>                        
                      </select>
                    </div>
                  </div>  

                </div>
                

                <div class="row">       

                 <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="standard">Standard<font color="red"> *</font></label>
                      <select class="form-control select_group" id="standard" name="standard">
                       <option value="">Select Standard</option>
                        <?php
                          foreach($standard as $row)
                          {
                           echo '<option value="'.$row->id.'">'.$row->name.'</option>';
                          }
                        ?>
                       </select>
                    </div>
                  </div>  

                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="clause">Clause<font color="red"> *</font></label>
                      <select class="form-control select_group" id="clause" name="clause">
                        <option value=""></option>                        
                      </select>
                    </div>
                  </div>   

                  <div class="col-md-4 col-xs-4">
                  <div class="form-group">
                    <label for="sector">Sector<font color="red"> *</font></label>
                    <select class="form-control select_group" id="sector" name="sector">
                      <option value="">Select Sector</option>
                      <?php foreach ($sector as $k => $v): ?>
                      <option value="<?php echo $v['id'] ?>" <?php echo set_select('sector', $v['id']); ?>>
                      <?php echo $v['name'] ?></option>
                      <?php endforeach ?>
                      </select>
                  </div>
                </div>

                </div>



                <div class="row">
                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="business_process">Business Process</label>
                      <textarea type="text" class="form-control" rows="3" id="business_process" name="business_process" autocomplete="off"><?php echo set_value('business_process'); ?></textarea>
                    </div>
                  </div>

                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="board_meeting_time_period">Board meeting time period</label>
                      <textarea type="text" class="form-control" rows="3" id="board_meeting_time_period" name="board_meeting_time_period" autocomplete="off"><?php echo set_value('board_meeting_time_period'); ?></textarea>
                    </div>
                  </div>

                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="management_review_time">Management review time</label>
                      <textarea type="text" class="form-control" rows="3" id="management_review_time" name="management_review_time" autocomplete="off"><?php echo set_value('management_review_time'); ?></textarea>
                    </div>
                  </div>

                </div>  

                  <div class="row">
                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="product">Product offered</label>
                      <textarea type="text" class="form-control" rows="3" id="product" name="product" autocomplete="off"><?php echo set_value('product'); ?></textarea>
                    </div>
                  </div>

                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="quality_policy">Quality Policy</label>
                      <textarea type="text" class="form-control" rows="3" id="quality_policy" name="quality_policy" autocomplete="off"><?php echo set_value('quality_policy'); ?></textarea>
                    </div>
                  </div>

                  <div class="col-md-4 col-xs-4">
                    <div class="form-group">
                      <label for="exemption">Exemption</label>
                      <textarea type="text" class="form-control" rows="3" id="exemption" name="exemption" autocomplete="off"><?php echo set_value('exemption'); ?></textarea>
                    </div>
                  </div>
                </div>  

                <div class="form-group">
                  <label for="remark">Remark</label>
                  <textarea type="text" class="form-control" id="remark" rows="3" name="remark" autocomplete="off"><?php echo set_value('remark'); ?></textarea>
                </div>


              </div> <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Save</button>
                <a href="<?php echo base_url('consultation/') ?>" class="btn btn-warning">Close</a>
              </div>
            </form>
        </div>
      </div>
    </div>

  </section>  <!-- /.content -->
</div><!-- /.content-wrapper -->


<!-----------------------------------------------------------  Javascript ------------------------------------------------------------------>

<script type="text/javascript">

  $('[data-toggle="tooltip"]').tooltip();

var client_holder=document.getElementById('client_holder');
client_holder.onchange=function()
{
  document.getElementById('client').value=client_holder.value;
}  

var base_url = "<?php echo base_url(); ?>";

  $(document).ready(function() {
    $(".select_group").select2({width: '100%'});
    //$("#remark").wysihtml5();

    $("#mainConsultationNav").addClass('active');
    $("#addConsultationNav").addClass('active');

    var btnCust = '<button type="button" class="btn btn-secondary" title="Add picture tags" ' +
        'onclick="alert(\'Call your custom code here.\')">' +
        '<i class="glyphicon glyphicon-tag"></i>' +
        '</button>';
    $("#consultation_image").fileinput({
        overwriteInitial: true,
        maxFileSize: 1500,
        showClose: false,
        showCaption: false,
        browseLabel: '',
        removeLabel: '',
        browseIcon: '<i class="glyphicon glyphicon-folder-open"></i>',
        removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
        removeTitle: 'Cancel or reset changes',
        elErrorContainer: '#kv-avatar-errors-1',
        msgErrorClass: 'alert alert-block alert-danger',
        layoutTemplates: {main2: '{preview} ' +  ' {remove} {browse}'},
        allowedFileExtensions: ["jpg", "png", "gif"]
    });


//--> Change of the standard, call the clause list

        $('#standard').change(function() {
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