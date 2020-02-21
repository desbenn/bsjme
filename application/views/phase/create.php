<div class="content-wrapper">
  <section class="content-header">
    <h1>Add Phase</h1>
    <ol class="breadcrumb">
      <li><a href="<?php echo base_url('phase') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Phase</li>
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
          <!-- /.box-header -->
          <form role="form" action="<?php base_url('phase/create') ?>" method="post" enctype="multipart/form-data">
              <div class="box-body">

        <?php echo validation_errors(); ?>

				
        <div class="row">

          <div class="col-md-6 col-xs-6">
            <div class="form-group">
              <label for="name">Phase name <font color="red">*</font></label>
              <input type="text" class="form-control" id="name" name="name" autocomplete="off"
              value="<?php echo set_value('name'); ?>"/>
            </div>
          </div>

          <div class="col-md-4 col-xs-4">
            <div class="form-group">
              <label for="code">Code <font color="red">*</font></label>
              <input type="text" class="form-control" id="code" name="code" autocomplete="off"
              value="<?php echo set_value('code'); ?>"/>
            </div>
          </div>

          <div class="col-md-2 col-xs-2">
              <div class="form-group">
                <label for="active">Active</label>
                  <div class="radio">
                    <label><input type="radio" name="active" id="active" value="1" checked="checked">
                Active&nbsp;&nbsp;&nbsp;&nbsp;</label>
              <label><input type="radio" name="active" id="active" value="2">
                Inactive</label>
                  </div>
              </div>
            </div>

        </div>



        <div class="form-group">
          <label for="remark">Remark <font color="red">*</font></label>
          <textarea type="text" class="form-control" id="remark" name="remark" autocomplete="off">
            <?php echo set_value('remark'); ?>
          </textarea>
        </div>
        
        <div class="row">
        
            <div class="col-md-4 col-xs-4">
                <div class="form-group">
                  <label>Upload image</label>
                  <input type="file" name="icon" size="20">
                </div>
            </div>


        </div> <!-- /.box-body -->


      <div class="box-footer">
        <button type="submit" class="btn btn-primary">Save</button>
        <a href="<?php echo base_url('phase/') ?>" class="btn btn-warning">Close</a>
      </div>
    </form>
  </div>
</div>
</div>

  </section>  <!-- /.content -->
</div><!-- /.content-wrapper -->


<!-----------------------------------------------------------  Javascript ------------------------------------------------------------------>

<script type="text/javascript">
  $(document).ready(function() {
    $(".select_group").select2();
    $("#remark").wysihtml5();

    $("#mainPhaseNav").addClass('active');
    $("#addPhaseNav").addClass('active');

    var btnCust = '<button type="button" class="btn btn-secondary" title="Add picture tags" ' +
        'onclick="alert(\'Call your custom code here.\')">' +
        '<i class="glyphicon glyphicon-tag"></i>' +
        '</button>';
    $("#icon").fileinput({
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