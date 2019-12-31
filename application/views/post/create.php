<div class="content-wrapper">
  <section class="content-header">
    <h1>Add Post</h1>
    <ol class="breadcrumb">
      <li><a href="<?php echo base_url('post') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Post</li>
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
          <form role="form" action="<?php base_url('post/create') ?>" method="post" enctype="multipart/form-data">
              <div class="box-body">

        <?php echo validation_errors(); ?>

				<div class="row">
          <div class="col-md-3 col-xs-3">
              <div class="form-group">
                <label for="category">Category <font color="red">*</font></label>
                <select class="form-control select_group" id="category" name="category">
                    <option value=""></option>
                    <?php foreach ($category as $k => $v): ?>
                    <option value="<?php echo $v['id'] ?>" <?php echo set_select('category', $v['id']); ?>>
                    <?php echo $v['name'] ?></option>
                    <?php endforeach ?>
               </select>
            </div>
          </div>

				    <div class="col-md-4 col-xs-4">
              <div class="form-group">
                <label for="date_from">Date from <font color="red">*</font></label>
                <input type="date" class="form-control" id="date_from" name="date_from" autocomplete="off"
                value="<?php echo set_value('date_from',date('Y-m-d')); ?>"/>
              </div>
            </div>

            <div class="col-md-4 col-xs-4">
              <div class="form-group">
                <label for="date_to">Date to <font color="red">*</font></label>
                <input type="date" class="form-control" id="date_to" name="date_to" autocomplete="off"
                value="<?php echo set_value('date_to',date('Y-m-d')); ?>"/>
              </div>
            </div>

				</div>


        <div class="row">

          <div class="col-md-12 col-xs-12">
            <div class="form-group">
              <label for="post_title">Title <font color="red">*</font></label>
              <input type="text" class="form-control" id="post_title" name="post_title" autocomplete="off"
              value="<?php echo set_value('post_title'); ?>"/>
            </div>
          </div>

        </div>


        <div class="row">

          <div class="col-md-12 col-xs-12">
            <div class="form-group">
              <label for="posted_by">Posted by <font color="red">*</font></label>
              <input type="text" class="form-control" id="posted_by" name="posted_by" autocomplete="off"
              value="<?php echo set_value('posted_by'); ?>" />
            </div>
          </div>
          </div>

        <div class="form-group">
          <label for="post_text">Text <font color="red">*</font></label>
          <textarea type="text" class="form-control" id="post_text" name="post_text" autocomplete="off">
            <?php echo set_value('post_text'); ?>
          </textarea>
        </div>

        <div class="row">
            <div class="col-md-4 col-xs-4">
                <div class="form-group">
                  <label>Upload image</label>
                  <input type="file" name="post_image" size="20">
                </div>
            </div>

            <div class="col-md-4 col-xs-4">
              <div class="form-group">
                <label for="client_visibility">Client visibility</label>
                  <div class="radio">
                    <label><input type="radio" name="client_visibility" id="client_visibility" value="1">
                    Visible&nbsp;&nbsp;&nbsp;&nbsp;</label>
                  <label><input type="radio" name="client_visibility" id="client_visibility" value="2" checked="checked">
                    Non Visible</label>
                  </div>
              </div>
            </div>       

            <div class="col-md-4 col-xs-4">
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




      </div> <!-- /.box-body -->

      <div class="box-footer">
        <button type="submit" class="btn btn-primary">Save</button>
        <a href="<?php echo base_url('post/') ?>" class="btn btn-warning">Close</a>
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
    $("#post_text").wysihtml5();

    $("#mainPostNav").addClass('active');
    $("#addPostNav").addClass('active');

    var btnCust = '<button type="button" class="btn btn-secondary" title="Add picture tags" ' +
        'onclick="alert(\'Call your custom code here.\')">' +
        '<i class="glyphicon glyphicon-tag"></i>' +
        '</button>';
    $("#post_image").fileinput({
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