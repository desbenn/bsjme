
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>Add Client</h1>
    <ol class="breadcrumb">
      <li><a href="<?php echo base_url('client') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Client</li>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">
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
        <?php endif; ?>


        <div class="box">
          <div class="box-header"></div>
          <!-- /.box-header -->
          <form role="form" action="<?php base_url('user/create') ?>" method="post" enctype="multipart/form-data">
              <div class="box-body">

              <?php echo validation_errors(); ?>


              <div class="row">

                <div class="col-md-2 col-xs-2">
                  <div class="form-group">
                    <label for="trn">TRN <font color="red">*</font></label>
                    <input type="text" class="form-control" id="trn" name="trn"
                    value="<?php echo set_value('trn'); ?>" autocomplete="off"/>
                 </div>
               </div>

               <div class="col-md-4 col-xs-4">
                  <div class="form-group">
                    <label for="company_name">Company Name <font color="red">*</font></label>
                    <input type="text" class="form-control" id="company_name" name="company_name"
                    value="<?php echo set_value('company_name'); ?>" autocomplete="off"/>
                 </div>
               </div>

               <div class="col-md-4 col-xs-4">
                  <div class="form-group">
                    <label for="client_name">Client Name <font color="red">*</font></label>
                    <input type="text" class="form-control" id="client_name" name="client_name"
                    value="<?php echo set_value('client_name'); ?>" autocomplete="off"/>
                 </div>
               </div> 

                <div class="col-md2 col-xs-2">
                  <div class="form-group">
                    <label for="activity">Activity <font color="red">*</font></label>
                    <select class="form-control select_group" id="activity" name="activity">
                      <option value=""></option>
                      <?php foreach ($activity as $k => $v): ?>
                      <option value="<?php echo $v['id'] ?>" <?php echo set_select('activity', $v['id']); ?>><?php echo $v['name'] ?></option>
                      <?php endforeach ?>
                    </select>
                  </div>
                </div>

              </div>


  				    <div class="form-group">
                  <label for="address">Address <font color="red">*</font></label>
                  <input type="text" class="form-control" id="address" name="address"
                  value="<?php echo set_value('address'); ?>" autocomplete="off"/>
              </div>


              <div class="row">
                <div class="col-md-3 col-xs-3">
                  <div class="form-group">
                    <label for="county">County <font color="red">*</font></label>
                    <select class="form-control select_group" id="county" name="county">
                      <option value=""></option>
                      <?php foreach ($county as $k => $v): ?>
                      <option value="<?php echo $v['id'] ?>" <?php echo set_select('county', $v['id']); ?>><?php echo $v['name'] ?></option>
                      <?php endforeach ?>
                    </select>
                  </div>
                </div>

                <div class="col-md-3 col-xs-3">
                  <div class="form-group">
                    <label for="parish">Parish <font color="red">*</font></label>
                    <select class="form-control select_group" id="parish" name="parish">
                      <option value=""></option>
                      <?php foreach ($parish as $k => $v): ?>
                      <option value="<?php echo $v['id'] ?>" <?php echo set_select('parish', $v['id']); ?>><?php echo $v['name'] ?></option>
                      <?php endforeach ?>
                    </select>
                  </div>
			          </div>

                <div class="col-md-3 col-xs-3">
                  <div class="form-group">
                    <label for="city">City</label>
                    <select class="form-control select_group" id="city" name="city">
                      <option value=""></option>
                      <?php foreach ($city as $k => $v): ?>
                      <option value="<?php echo $v['id'] ?>" <?php echo set_select('city', $v['id']); ?>><?php echo $v['name'] ?></option>
                      <?php endforeach ?>
                    </select>
                 </div>
               </div>

               <div class="col-md-3 col-xs-3">
                  <div class="form-group">
                    <label for="district">District</label>
                    <input type="text" class="form-control" id="district" name="district"
                    value="<?php echo set_value('district'); ?>" autocomplete="off"/>
                 </div>
               </div>

			        </div> 



              <div class="row">

               <div class="col-md-3 col-xs-3">
                  <div class="form-group">
                    <label for="postal_box">Postal Box</label>
                    <input type="text" class="form-control" id="postal_box" name="postal_box"
                    value="<?php echo set_value('postal_box'); ?>" autocomplete="off"/>
                 </div>
               </div>

               <div class="col-md-3 col-xs-3">
                  <div class="form-group">
                    <label for="postal_code">Postal Code</label>
                    <input type="text" class="form-control" id="postal_code" name="postal_code"
                    value="<?php echo set_value('postal_code'); ?>" autocomplete="off"/>
                 </div>
               </div>

               <div class="col-md-3 col-xs-3">
				            <div class="form-group">
                       <label for="email">Email <font color="red">*</font></label>
                        <input type="text" class="form-control" id="email" name="email"
                        value="<?php echo set_value('email'); ?>" autocomplete="off"/>
                    </div>
                   </div>
				          <div class="col-md-3 col-xs-3">
                    <div class="form-group">
                      <label for="website">Website</label>
                      <input type="text" class="form-control" id="website" name="website"
                      value="<?php echo set_value('website'); ?>" autocomplete="off"/>
                    </div>
                  </div>
                </div>



                <div class="row">                  

                   <div class="col-md-3 col-xs-3">
                    <div class="form-group">
                       <label for="contact_name">Contact Name</label>
                      <input type="text" class="form-control" id="contact_name" name="contact_name"
                      value="<?php echo set_value('contact_name'); ?>" autocomplete="off"/>
                    </div>
                   </div>

                  <div class="col-md-3 col-xs-3">
                    <div class="form-group">
                       <label for="phone">Phone</label>
                      <input type="text" class="form-control" id="phone" name="phone"
                      value="<?php echo set_value('phone'); ?>" autocomplete="off"/>
                    </div>
                   </div>

                   <div class="col-md-3 col-xs-3">
                    <div class="form-group">
                       <label for="mobile">Mobile</label>
                      <input type="text" class="form-control" id="mobile" name="mobile"
                      value="<?php echo set_value('mobile'); ?>" autocomplete="off"/>
                    </div>
                   </div>

                   <div class="col-md-3 col-xs-3">
                    <div class="form-group">
                       <label for="director_name">Director Name</label>
                      <input type="text" class="form-control" id="director_name" name="director_name"
                      value="<?php echo set_value('director_name'); ?>" autocomplete="off"/>
                    </div>
                   </div>
                </div>

                <div class="row">                  

                   <div class="col-md-6 col-xs-6">
                    <div class="form-group">
                       <label for="objective">Objective</label>
                        <textarea type="text" class="form-control" rows="2" id="objective" name="objective" autocomplete="off"><?php echo set_value('objective'); ?></textarea>
                    </div>                   
                   </div>

                   <div class="col-md-6 col-xs-6">
                    <div class="form-group">
                       <label for="target">Target</label>
                        <textarea type="text" class="form-control" rows="2" id="target" name="target" autocomplete="off"><?php echo set_value('target'); ?></textarea>
                    </div>                   
                   </div>

                 </div>  

                <div class="form-group">
                  <label for="remark">Remark</label>
                  <textarea type="text" class="form-control" rows="3" id="remark" name="remark" autocomplete="off"><?php echo set_value('remark'); ?></textarea>
                </div>


              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Save</button>
                <a href="<?php echo base_url('client/') ?>" class="btn btn-warning">Close</a>
              </div>
            </form>       <!-- /.box-body -->
        </div>        <!-- /.box -->
      </div>      <!-- col-md-12 -->
    </div>    <!-- /.row -->


  </section>  <!-- /.content -->
</div>  <!-- /.content-wrapper -->





<script type="text/javascript">
  $(document).ready(function() {
    $(".select_group").select2({width: '100%'});
    //$("#remark").wysihtml5();

    $("#mainClientNav").addClass('active');
    $("#addClientNav").addClass('active');

    var btnCust = '<button type="button" class="btn btn-secondary" title="Add picture tags" ' +
        'onclick="alert(\'Call your custom code here.\')">' +
        '<i class="glyphicon glyphicon-tag"></i>' +
        '</button>';
    $("#client_image").fileinput({
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

<script type="text/javascript">
  $(document).ready(function() {
    $("#clientNav").addClass('active');
    $("#message").wysihtml5();
  });
</script>

