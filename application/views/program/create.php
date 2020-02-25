
<div class="content-wrapper">
  <section class="content-header">
    <h1>Add Program</h1>
    <ol class="breadcrumb">
      <li><a href="<?php echo base_url('program') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Program</li>
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
            
          </div>
          <form role="form" action="<?php base_url('program/create') ?>" method="post" enctype="multipart/form-data">
              <div class="box-body">

                <?php echo validation_errors(); ?>

                <div class="row">

                  <div class="col-md-3 col-xs-3">
                    <div class="form-group">
                      <label for="code">Code <font color="red">*</font></label>
                      <input type="text" class="form-control" id="code" name="code" autocomplete="off"
                      value="<?php echo set_value('code'); ?>"/>
                    </div>
                  </div>

                  <div class="col-md-3 col-xs-3">
                    <div class="form-group">
                      <label for="standard">Standard</label>
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

                  <div class="col-md-3 col-xs-3">
                    <div class="form-group">
                      <label for="clause">Clause</label>
                      <select class="form-control select_group" id="clause" name="clause">
                        <option value="">Select Clause</option>                        
                      </select>
                    </div>
                  </div>   

                  <div class="col-md-2 col-xs-2" align="center">
                    <div class="radio">
                        <label><input type="radio" name="active" id="active" value="1" checked="checked" >Active&nbsp;&nbsp;&nbsp;&nbsp;</label>
                        <label><input type="radio" name="active" id="active" value="2" >Inactive</label>
                    </div>
                  </div>                  
                 
                </div>



                 <div class="row">			 
                  		  
                  <div class="col-md-6 col-xs-6">
                     <div class="form-group">
                      <label for="name">Program name <font color="red">*</font></label>
                      <textarea type="text" class="form-control" id="name" rows="5" name="name" autocomplete="off"><?php echo set_value('name'); ?></textarea>
                    </div>
                  </div>  

                 
                </div>   

                <table class="table table-bordered" id="phase_info_table">
                  <thead>
                    <tr>
                      <th style="width:50%">Phase <font color="red">*</font></th>  
                      <th style="width:10%">Sequence <font color="red">*</font></th>                   
                      <th style="width:10%"><button type="button" id="add_row" class="btn btn-default"><i class="fa fa-plus"></i></button></th>
                    </tr>
                  </thead>

                   <tbody>
                     <tr id="row_1">
                       <td>
                        <select class="form-control select_group phase" data-row-id="row_1" id="phase_1" name="phase[]" style="width:100%;" >
                            <option value=""></option>
                            <?php foreach ($phase as $k => $v): ?>
                              <option value="<?php echo $v['id'] ?>"><?php echo $v['name'] ?></option>
                            <?php endforeach ?>
                          </select>
                        </td> 
                        <td><input type="number" name="sequence[]" id="sequence_1" class="form-control" ></td>                 
                        <td><button type="button" class="btn btn-default" onclick="removeRow('1')"><i class="fa fa-close"></i></button></td>
                     </tr>
                   </tbody>
                </table>

                <br /> 
                

                <div class="row">  
        
                  <div class="col-md-12 col-xs-12">
                     <div class="form-group">
                      <label for="remark">Remark</label>
                      <textarea type="text" class="form-control" id="remark" rows="5" name="remark" autocomplete="off"><?php echo set_value('remark'); ?></textarea>
                    </div>
                  </div>  
                </div>  

              </div>

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Save Changes</button>
                <a href="<?php echo base_url('program/') ?>" class="btn btn-warning">Close</a>
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
    $("#mainProgramNav").addClass('active');
    $("#addProgramNav").addClass('active');


        //Change of the standard, call the clause list

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

    $("#phase_info_table tbody tr#row_"+tr_id).remove();

    }



// Add new row in the table 
    $("#add_row").unbind('click').bind('click', function() {
      var table = $("#phase_info_table");
      var count_table_tbody_tr = $("#phase_info_table tbody tr").length;
      var row_id = count_table_tbody_tr + 1;

      $.ajax({
          success:function(response) {            

               var html = '<tr id="row_'+row_id+'">'+
                   '<td>'+ 

                     '<select class="form-control select_group phase" data-row-id="'+row_1+'" id="phase_1" name="phase[]" style="width:100%;" >' +
                            '<option value=""></option>' +
                            '<?php foreach ($phase as $k => $v): ?>' +
                            '<option value="<?php echo $v['id'] ?>"><?php echo $v['name'] ?></option>' +
                            '<?php endforeach ?>' ;

                      html += '</select>'+
                    '</td>'+ 
                    '<td><input type="number" name="sequence[]" id="sequence_'+row_id+'" class="form-control" </td>'+
                    '<td><button type="button" class="btn btn-default" onclick="removeRow(\''+row_id+'\')"><i class="fa fa-close"></i></button></td>'+
                    '</tr>';

                if(count_table_tbody_tr >= 1) {$("#phase_info_table tbody tr:last").after(html);}
                else {$("#phase_info_table tbody").html(html);}

                $(".phase").select2();
          }
        });

      return false;

    });


</script>