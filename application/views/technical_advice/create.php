<div class="content-wrapper">
  <section class="content-header">
    <h1>Add Technical Advice</h1>
    <ol class="breadcrumb">
      <li><a href="<?php echo base_url('technical_advice') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Technical Advice</li>
      <li><img width="25" height="25" data-toggle="tooltip" data-placement="bottom" title="Some information afor technical advice." src="<?php echo base_url('assets/images/question.png'); ?>" /></li>
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
          <form role="form" action="<?php base_url('technical_advice/create') ?>" method="post" enctype="multipart/form-data">
              <div class="box-body">

                <?php echo validation_errors(); ?>


                <div class="row">
                    <!-- If the create come from the client edit, we have alrady the client id, in this case
                    the list will be filled with the client/company and disabled.  If not it means it comes
                    from the Add consultation and we don't know the client -->
                    <div class="col-md-5 col-xs-5">
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

                    <div class="col-md-3 col-xs-3">
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

                    <div class="col-md2 col-xs-2">
                        <div class="form-group">
                            <label for="activity">Activity <font color="red">*</font></label>
                                <select class="form-control select_group" id="activity" name="activity">
                                    <?php foreach ($activity as $k => $v): ?>
                                    <option value="<?php echo $v['id'] ?>" <?php echo set_select('activity', $v['id']); ?>><?php echo $v['name'] ?></option>
                                    <?php endforeach ?>
                                </select>
                        </div>
                    </div>         
                 </div> 



             <div class="row">

             

             <div class="col-md-5 col-xs-5">
                    <div class="form-group">
                      <label for="work_scope">Scope of Work</label>
                      <textarea style="resize: none;;" type="text" class="form-control" rows="3" id="work_scope" name="work_scope" autocomplete="off"><?php echo set_value('work_scope'); ?></textarea>
                    </div>
                  </div>

                  <div class="col-md-2 col-xs-2">
                    <div class="form-group">
                      <label for="date_created">Creation Date <font color="red">*</font></label>
                      <input type="date" class="form-control" id="date_created" name="date_created" autocomplete="off" readonly
                       value="<?php echo date('Y-m-d'); ?>" >
                    </div>
                  </div>

                  <div class="col-md-2 col-xs-2">
                    <div class="form-group">
                      <label for="date_begin">Begin Date</label></label>
                      <input type="date" class="form-control" id="date_begin" name="date_begin" autocomplete="off">
                    </div>
                  </div>

                  <div class="col-md-2 col-xs-2">
                    <div class="form-group">
                      <label for="date_end">End Date</label></label>
                      <input type="date" class="form-control" id="date_end" name="date_end" autocomplete="off">
                    </div>
                  </div>

               </div>
                
              </div> <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Save</button>
                <a href="<?php echo base_url('technical_advice/') ?>" class="btn btn-warning">Close</a>
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


  });


</script>