
<div class="content-wrapper">
  <section class="content-header">
    <ol class="breadcrumb">
      <li><a href="<?php echo base_url('requirement') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Requirement</li>
    </ol>
    <br>
  </section>



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
          <div class="box-header">
            <h3 class="box-title">Add Requirement</h3>
          </div>
          <form role="form" action="<?php base_url('requirement/create') ?>" method="post" enctype="multipart/form-data">
              <div class="box-body">

                <?php echo validation_errors(); ?>

                <div class="row">			 
                  		  
                  <div class="col-md-6 col-xs-6">
                     <div class="form-group">
                      <label for="question">Question <font color="red">*</font></label>
                      <textarea type="text" class="form-control" id="question" rows="2" name="question" autocomplete="off"><?php echo set_value('question'); ?></textarea>
                    </div>
                  </div>  

                  <div class="col-md-3 col-xs-3">
                    <div class="form-group">
                      <label for="question_type">Question Type <font color="red">*</font></label>
                      <select class="form-control select_group" id="question_type" name="question_type">
                        <option value=""></option> 
                        <?php foreach ($question_type as $k => $v): ?>
                        <option value="<?php echo $v['id'] ?>" <?php echo set_select('question_type', $v['code']); ?>><?php echo $v['name'] ?></option>
                      <?php endforeach ?>
                    </select>
                    </div>
                  </div>
 			                    
                </div>   

                <table class="table table-bordered" id="option_info_table">
                  <thead>
                    <tr>
                      <th style="width:30%">Option</th>                     
                      <th style="width:10%"><button type="button" id="add_row" class="btn btn-default"><i class="fa fa-plus"></i></button></th>
                    </tr>
                  </thead>

                   <tbody>
              
                   </tbody>
                </table>

                <br /> 
                

                <div class="row">  
        
                  <div class="col-md-12 col-xs-12">
                     <div class="form-group">
                      <label for="remark">Remark</label>
                      <textarea type="text" class="form-control" id="remark" rows="2" name="remark" autocomplete="off"><?php echo set_value('remark'); ?></textarea>
                    </div>
                  </div>  
                </div>  

              </div>

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Save Changes</button>
                <a href="<?php echo base_url('requirement/') ?>" class="btn btn-warning">Close</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
  </div>
            




<!-----------------------------------------   Javascript  --------------------------------------->

<script type="text/javascript">

var base_url = "<?php echo base_url(); ?>";

    $(document).ready(function(){
        $(".select_group").select2();
        $("#mainRequirementNav").addClass('active');
        $("#addRequirementNav").addClass('active');
    });
    
   
   function removeRow(tr_id)
    {
        $("#option_info_table tbody tr#row_"+tr_id).remove();
    }



// Add new row in the table 
    $("#add_row").unbind('click').bind('click', function() 
    {
      var table = $("#option_info_table");
      var count_table_tbody_tr = $("#option_info_table tbody tr").length;
      var row_id = count_table_tbody_tr + 1;

      $.ajax({
          success:function(response) {            

               var html = '<tr id="row_'+row_id+'">'+
  
                   '<td><input type="text" name="option[]" id="option_'+row_id+'" class="form-control" </td>'+
                
                    '<td><button type="button" class="btn btn-default" onclick="removeRow(\''+row_id+'\')"><i class="fa fa-close"></i></button></td>'+
                    '</tr>';

                if(count_table_tbody_tr >= 1) {$("#option_info_table tbody tr:last").after(html);}
                else {$("#option_info_table tbody").html(html);}

                $(".option").select2();
          }
        });

      return false;

    });


</script>