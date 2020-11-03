
<div class="content-wrapper">
  <section class="content-header">
    <ol class="breadcrumb">
      <li><a href="<?php echo base_url('question') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Question</li>
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
            <h3 class="box-title">Add Question</h3>
          </div>
          <form role="form" action="<?php base_url('question/create') ?>" method="post" enctype="multipart/form-data">
              <div class="box-body">

                <?php echo validation_errors(); ?>

                 <div class="row">			 
                  		  
                  <div class="col-md-4 col-xs-4">
                     <div class="form-group">
                      <label for="question">Question <font color="red">*</font></label>
                      <textarea type="text" class="form-control" id="question" rows="3" name="question" autocomplete="off"><?php echo set_value('question'); ?></textarea>
                    </div>
                  </div>  

                  <div class="col-md-3 col-xs-3">
                    <div class="form-group">
                      <label for="question_type">Question Type <font color="red">*</font></label>
                      <select class="form-control select_group" id="question_type" name="question_type">
                        <option value=""></option> 
                        <?php foreach ($question_type as $k => $v): ?>
                        <option value="<?php echo $v['id'] ?>" <?php echo set_select('question_type', $v['id']); ?>><?php echo $v['name'] ?></option>
                      <?php endforeach ?>
                    </select>
                    </div>
                  </div>

                  <div class="col-md-2 col-xs-2" align="center">
                    <div class="radio">
                        <label><input type="radio" name="active" id="active" value="1" checked="checked" >Active&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <br>
                        <label><input type="radio" name="active" id="active" value="2" >Inactive</label>
                    </div>
                  </div>

                  <div class="col-md-2 col-xs-2" align="left">
                    <div class="radio">
                        <label><input type="radio" name="upload_document" id="upload_document" value="1" checked="checked" >Upload&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <br>
                        <label><input type="radio" name="upload_document" id="upload_document" value="2" >No Upload</label>
                    </div>
                  </div>  			  
                  
                </div>   

                <table class="table table-bordered" id="option_info_table">
                  <thead>
                    <tr>
                      <th style="width:30%">Question Options</th>                     
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

                <div class="row">

                  <div class="col-md-3 col-xs-3">
                    <div class="form-group">
                      <label for="standard">Standard <font color="red">*</font></label>
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
                  
                  <div class="col-md-1 col-xs-1">
                  </div>

                  <div class="col-md-3 col-xs-3">
                    <div class="form-group">
                      <label for="clause">Clause</label>
                      <select class="form-control select_group" id="clause" name="clause">
                        <option value="">Select Clause</option>                        
                      </select>
                    </div>
                  </div>

                  <div class="col-md-1 col-xs-1">
                  </div>
          
                  <div class="col-md-3 col-xs-3">
                    <div class="form-group">
                      <label for="sub_clause">Sub Clause</label>
                      <select class="form-control select_group" id="sub_clause" name="sub_clause">
                        <option value="">Select Sub-clause</option>                         
                      </select>
                    </div>
                  </div> 
                </div>

                <div class="row">
                  <div class="col-md-3 col-xs-3">
                    <div class="form-group">
                      <label for="program">Program <font color="red">*</font></label>
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

                  <div class="col-md-1 col-xs-1">
                  </div>

                  <div class="col-md-3 col-xs-3">
                    <div class="form-group">
                      <label for="phase">Phase <font color="red">*</font></label>
                      <select class="form-control select_group" id="phase" name="phase">
                        <option value="">Select Phase</option>                        
                      </select>
                    </div>
                  </div> 
                </div>

              </div>

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Save Changes</button>
                <a href="<?php echo base_url('question/') ?>" class="btn btn-warning">Close</a>
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
    $("#mainQuestionNav").addClass('active');
    $("#addQuestionNav").addClass('active');

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
                }
               });
        }
        else
        {
         $('#phase').html('<option value="">Select Phase</option>');
        }
       });

        // Change of the standard, call the clause list

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


        //Change of the clause, call the sub-clause list

       $('#clause').change(function(){
        var clause_id = $('#clause').val();
        if(clause_id != '')
        {
         $.ajax({
          url: base_url + 'dynamic_dependent/fetch_sub_clause',
          method:"POST",
          data:{clause_id:clause_id},
          success:function(data)
          {
           $('#sub_clause').html(data);
          }
         });
        }
        else
        {
         $('#sub_clause').html('<option value="">Select Sub-clause</option>');
        }
       });
 
});
    
   
   function removeRow(tr_id)
    {

    $("#option_info_table tbody tr#row_"+tr_id).remove();

    }



// Add new row in the table 
    $("#add_row").unbind('click').bind('click', function() {
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