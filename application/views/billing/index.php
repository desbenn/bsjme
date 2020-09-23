<div class="content-wrapper">
  <section class="content-header">
    <h1>Billing</h1>
    <ol class="breadcrumb">
      <li><a href="<?php echo base_url('setting') ?>"><i class="fa fa-dashboard">        
      </i> Home</a></li>
      <li class="active">Billing</li>
    </ol>
  </section>


  <!-----------------------------------------------------------  View ------------------------------------------------------------------>

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

        <?php if(in_array('createBilling', $user_permission)): ?>
          <button class="btn btn-primary" data-toggle="modal" onclick="createFunc()"  data-target="#addModal">Add Billing Item</button>
        <?php endif; ?>

        <!-- <?php if(in_array('viewCity', $user_permission)): ?>
           <?php echo '<a href="'.base_url('report06/report06/city').'" target="_blank" class="btn btn-success"><i class="fa fa-print"></i></a>'; ?>
          <br /> <br />
        <?php endif; ?> -->
        <br/> <br/>

        <div class="box">
          <div class="box-header"></div>
          <div class="box-body">
            <table id="manageTable" class="table table-bordered table-striped">
              <thead>
              <tr>                
                <th>Name</th>
                <th>Cost</th>
                <th>Type</th>
                <?php if(in_array('updateBilling', $user_permission) || in_array('deleteBilling', $user_permission)): ?>
                  <th>Action</th>
                <?php endif; ?>
              </tr>
              </thead>

            </table>
          </div>
        </div>
      </div>
    </div>    

  </section>
</div>  <!-- /.content-wrapper -->



<!-----------------------------------------------------------  Add ------------------------------------------------------------------>

<?php if(in_array('createBilling', $user_permission)): ?>

<div class="modal fade" tabindex="-1" role="dialog" id="addModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Add Billing Iteem</h4>
      </div>

      <form role="form" action="<?php echo base_url('billing/create') ?>" method="post" id="createForm">

        <div class="modal-body">

          <div class="row">

             <div class="col-md-7 col-xs-7">
              <div class="form-group">
                <label for="billing_name">Name<font color="red"> *</font></label>
                <input type="text" class="form-control" id="billing_name" name="billing_name" autocomplete="off">
               </div>
             </div> 

             <div class="col-md-1 col-xs-1"></div>
  
             <div class="col-md-4 col-xs-4">
               <div class="radio">
                <label><input type="radio" name="billing_type" id="billing_type" value="0" checked="checked" >
                  Revenue&nbsp;&nbsp;&nbsp;&nbsp;</label>
                <label><input type="radio" name="billing_type" id="billing_type" value="1" >
                  Expense</label>
              </div>
            </div>

          </div>  

          <div class="row">

             <div class="col-md-7 col-xs-7">
                <div class="form-group">
                    <label for="billing_description">Description</label>
                    <input type="text" class="form-control" id="billing_description" name="billing_description" autocomplete="off">
                </div> 
             </div> 
             <div class="col-md-1 col-xs-1"></div>
             <div class="col-md-4 col-xs-4">
                <div class="form-group">
                    <label for="item_cost">Cost $JMD<font color="red"> *</font></label>
                    <input type="number" class="form-control" id="item_cost" name="item_cost" autocomplete="off">
                </div> 
             </div> 

          </div>                   

        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Save</button>
        </div>

      </form>

    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<?php endif; ?>


<!-----------------------------------------------------------  Edit ------------------------------------------------------------------>


<?php if(in_array('updateBilling', $user_permission)): ?>

<div class="modal fade" tabindex="-1" role="dialog" id="editModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Edit Billing Item</h4>
      </div>

      <form role="form" action="<?php echo base_url('billing/update') ?>" method="post" id="updateForm">

        <div class="modal-body">
          <div id="messages"></div>
          <div class="row">

             <div class="col-md-7 col-xs-7">
              <div class="form-group">
                <label for="edit_billing_name">Name<font color="red"> *</font></label>
                <input type="text" class="form-control" id="edit_billing_name" name="edit_billing_name" autocomplete="off">
               </div>
             </div> 

             <div class="col-md-1 col-xs-1"></div>
  
             <div class="col-md-4 col-xs-4">
               <div class="radio">
                <label><input type="radio" name="edit_billing_type" id="edit_billing_type_revenue" value="0" checked="checked" >
                  Revenue&nbsp;&nbsp;&nbsp;&nbsp;</label>
                <label><input type="radio" name="edit_billing_type" id="edit_billing_type_expense" value="1" >
                  Expense</label>
              </div>
            </div>

          </div>  

          <div class="row">

             <div class="col-md-7 col-xs-7">
                <div class="form-group">
                    <label for="edit_billing_description">Description</label>
                    <input type="text" class="form-control" id="edit_billing_description" name="edit_billing_description" autocomplete="off">
                </div> 
             </div> 
             <div class="col-md-1 col-xs-1"></div>
             <div class="col-md-4 col-xs-4">
                <div class="form-group">
                    <label for="edit_item_cost">Cost $JMD</label>
                    <input type="number" class="form-control" id="edit_item_cost" name="edit_item_cost" autocomplete="off">
                </div> 
             </div> 

          </div>                   

        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Save</button>
        </div>

      </form>

    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<?php endif; ?>


<!-----------------------------------------------------------  Delete  ------------------------------------------------------------------>

<?php if(in_array('deleteBilling', $user_permission)): ?>

<div class="modal fade" tabindex="-1" role="dialog" id="removeModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Delete Billing Item</h4>
      </div>

      <form role="form" action="<?php echo base_url('billing/remove') ?>" method="post" id="removeForm">
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

<!-----------------------------------------------   Javascript  ---------------------------------------------------------------->

<script type="text/javascript">
var manageTable;

$(document).ready(function() {

  $("#billingNav").addClass('active');

  // initialize the datatable 
  manageTable = $('#manageTable').DataTable({
    'ajax': 'fetchBillingData',
    'order': [[0, 'asc']]
  });

  // submit the create from 
  $("#createForm").unbind('submit').on('submit', function() {
    var form = $(this);

    // remove the text-danger
    $(".text-danger").remove();

    $.ajax({
      url: form.attr('action'),
      type: form.attr('method'),
      data: form.serialize(), // /converting the form data into array and sending it to server
      dataType: 'json',
      success:function(response) {

        manageTable.ajax.reload(null, false); 

        if(response.success === true) {
          $("#messages").html('<div class="alert alert-success alert-dismissible" role="alert">'+
            '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
            '<strong> <span class="glyphicon glyphicon-ok-sign"></span> </strong>'+response.messages+
          '</div>');


          // hide the modal
          $("#addModal").modal('hide');

          // reset the form
          $("#createForm")[0].reset();
          $("#createForm .form-group").removeClass('has-error').removeClass('has-success');

        } else {

          if(response.messages instanceof Object) {
            $.each(response.messages, function(index, value) {
              var id = $("#"+index);

              id.closest('.form-group')
              .removeClass('has-error')
              .removeClass('has-success')
              .addClass(value.length > 0 ? 'has-error' : 'has-success');
              
              id.after(value);

            });
          } else {
            $("#messages").html('<div class="alert alert-warning alert-dismissible" role="alert">'+
              '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
              '<strong> <span class="glyphicon glyphicon-exclamation-sign"></span> </strong>'+response.messages+
            '</div>');
          }
        }
      }
    }); 

    return false;
  });

});




function createFunc()
{
          $("#createForm")[0].reset();
          $("#createForm .form-group").removeClass('has-error').removeClass('has-success');  
          $(".text-danger").remove();
}


// edit function
function editFunc(id)
{ 
  $("#updateForm")[0].reset();
  $("#updateForm .form-group").removeClass('has-error').removeClass('has-success');  
  $(".text-danger").remove();

  $.ajax({
    url: 'fetchBillingDataById/'+id,
    type: 'post',
    dataType: 'json',
    success:function(response) {

      $("#edit_billing_name").val(response.name);
      $("#edit_billing_description").val(response.description);
      if(response.type==0){
          $('input:radio[id=edit_billing_type_revenue]')[0].checked = true;     
          $('input:radio[id=edit_billing_type_expense]')[0].checked = false;            
        }else{
          $('input:radio[id=edit_billing_type_revenue]')[0].checked = false;
          $('input:radio[id=edit_billing_type_expense]')[0].checked = true;
        }   
        $("#edit_item_cost").val(response.cost);
        

      // submit the edit from 
      $("#updateForm").unbind('submit').bind('submit', function() {
        var form = $(this);

        // remove the text-danger
        $(".text-danger").remove();

        $.ajax({
          url: form.attr('action') + '/' + id,
          type: form.attr('method'),
          data: form.serialize(), // /converting the form data into array and sending it to server
          dataType: 'json',
          success:function(response) {

            manageTable.ajax.reload(null, false); 

            if(response.success === true) {
              $("#messages").html('<div class="alert alert-success alert-dismissible" role="alert">'+
                '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
                '<strong> <span class="glyphicon glyphicon-ok-sign"></span> </strong>'+response.messages+
              '</div>');


              // hide the modal
              $("#editModal").modal('hide');
              // reset the form 
              $("#updateForm .form-group").removeClass('has-error').removeClass('has-success');

            } else {

              if(response.messages instanceof Object) {
                $.each(response.messages, function(index, value) {
                  var id = $("#"+index);

                  id.closest('.form-group')
                  .removeClass('has-error')
                  .removeClass('has-success')
                  .addClass(value.length > 0 ? 'has-error' : 'has-success');
                  
                  id.after(value);

                });
              } else {
                $("#messages").html('<div class="alert alert-warning alert-dismissible" role="alert">'+
                  '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
                  '<strong> <span class="glyphicon glyphicon-exclamation-sign"></span> </strong>'+response.messages+
                '</div>');
              }
            }
          }
        }); 

        return false;
      });

    }
  });
}

// remove functions 
function removeFunc(id)
{
  if(id) {
    $("#removeForm").on('submit', function() {

      var form = $(this);

      // remove the text-danger
      $(".text-danger").remove();

      $.ajax({
        url: form.attr('action'),
        type: form.attr('method'),
        data: { billing_item_id:id }, 
        dataType: 'json',
        success:function(response) {

          manageTable.ajax.reload(null, false); 

          if(response.success === true) {
            $("#messages").html('<div class="alert alert-success alert-dismissible" role="alert">'+
              '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
              '<strong> <span class="glyphicon glyphicon-ok-sign"></span> </strong>'+response.messages+
            '</div>');           

          } else {

            $("#messages").html('<div class="alert alert-warning alert-dismissible" role="alert">'+
              '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
              '<strong> <span class="glyphicon glyphicon-exclamation-sign"></span> </strong>'+response.messages+
            '</div>'); 
          }

           // hide the modal
            $("#removeModal").modal('hide');
        }
      }); 

      return false;
    });
  }
}


</script>
