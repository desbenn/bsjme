<div class="content-wrapper">
  <section class="content-header">
    <h1>User</h1>
    <ol class="breadcrumb">
      <li><a href="<?php echo base_url('setting') ?>"><i class="fa fa-dashboard">        
      </i> Home</a></li>
      <li class="active">User</li>
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

        <?php if(in_array('createUser', $user_permission)): ?>
          <button class="btn btn-primary" data-toggle="modal" data-target="#addModal">Add User</button>
          <br /> <br />
        <?php endif; ?>

        <div class="box">
          <div class="box-header"></div>
          <div class="box-body">
            <table id="manageTable" class="table table-bordered table-striped">
              <thead>
              <tr>                
                  <th>Username</th>
                  <th>Email</th>
                  <th>Name</th>
                  <th>Phone</th>
                  <th>Profile</th>
                  <th>Active</th>
                <?php if(in_array('updateUser', $user_permission) || in_array('deleteUser', $user_permission)): ?>
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

<?php if(in_array('createUser', $user_permission)): ?>

<div class="modal fade" tabindex="-1" role="dialog" id="addModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Add User</h4>
      </div>

      <form role="form" action="<?php echo base_url('user/create') ?>" method="post" id="createForm">

        <div class="modal-body">

         
          <div class="row">
            <div class="col-md-4 col-xs-4">
               <div class="form-group">
                <label for="username">Username<font color="red"> *</font></label>
                <input type="text" class="form-control" id="username" name="username" autocomplete="off">
              </div>
            </div> 
            <div class="col-md-8 col-xs-8">
              <div class="form-group">
                <label for="name">Name<font color="red"> *</font></label>
                <input type="text" class="form-control" id="name" name="name" autocomplete="off">
              </div> 
            </div>
          </div> 

           <div class="form-group">
            <label>Profile</label>
              <select name="profile" id="profile" class="form-control select_create" style="width: 100%;">
              </select>
           </div>  
   

          <div class="row">
            <div class="col-md-6 col-xs-6">
              <div class="form-group">
                <label for="password">Password <font color="red">*</font></label>
                <input type="text" class="form-control" id="password" name="password" autocomplete="off">
              </div>
            </div>  
            <div class="col-md-6 col-xs-6">
              <div class="form-group">
                <label for="cpassword">Confirm Password <font color="red">*</font></label>
                <input type="password" class="form-control" id="cpassword" name="cpassword" autocomplete="off">
              </div>
            </div>
          </div>            

          <div class="row">
            <div class="col-md-6 col-xs-6">
              <div class="form-group">
                <label for="email">Email<font color="red"> *</font></label>
                <input type="text" class="form-control" id="email" name="email" autocomplete="off">
              </div>
            </div>  
            <div class="col-md-6 col-xs-6">
              <div class="form-group">
                <label for="phone">Phone</label>
                <input type="text" class="form-control" id="phone" name="phone" autocomplete="off">
              </div>
            </div>
          </div>    

         <div class="radio">
              <label><input type="radio" name="active" id="active" value="1" checked="checked" >
                Active&nbsp;&nbsp;&nbsp;&nbsp;</label>
              <label><input type="radio" name="active" id="active" value="2" >
                Inactive</label>
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


<?php if(in_array('updateUser', $user_permission)): ?>
<div class="modal fade" tabindex="-1" role="dialog" id="editModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Edit User</h4>
      </div>

      <form role="form" action="<?php echo base_url('user/update') ?>" method="post" id="updateForm">

        <div class="modal-body">
          <div id="messages"></div>          

          <div class="row">
            <div class="col-md-4 col-xs-4">
               <div class="form-group">
                <label for="edit_username">Username<font color="red"> *</font></label>
                <input type="text" class="form-control" id="edit_username" name="edit_username" autocomplete="off">
              </div>
            </div> 
            <div class="col-md-8 col-xs-8">
              <div class="form-group">
                <label for="edit_name">Name<font color="red"> *</font></label>
                <input type="text" class="form-control" id="edit_name" name="edit_name" autocomplete="off">
              </div> 
            </div>
          </div>   

          <div class="form-group">
              <label>Profile</label>
                <select name="edit_profile" id="profile" class="form-control select2" style="width: 100%;">
                </select>
          </div>  

          <div class="form-group">
            <div class="alert alert-info alert-dismissible" role="alert">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                Leave the password field empty if you don't want to change.
            </div>
          </div> 

          <div class="row">
            <div class="col-md-6 col-xs-6">
              <div class="form-group">
                <label for="edit_password">Password <font color="red"> *</font></label>
                <input type="text" class="form-control" id="edit_password" name="edit_password" autocomplete="off">
              </div>
            </div>  
            <div class="col-md-6 col-xs-6">
              <div class="form-group">
                <label for="edit_cpassword">Confirm Password <font color="red"> *</font></label>
                <input type="password" class="form-control" id="edit_cpassword" name="edit_cpassword" autocomplete="off">
              </div>
            </div>
          </div>            

          <div class="row">
            <div class="col-md-6 col-xs-6">
              <div class="form-group">
                <label for="edit_email">Email<font color="red"> *</font></label>
                <input type="text" class="form-control" id="edit_email" name="edit_email" autocomplete="off">
              </div>
            </div>  
            <div class="col-md-6 col-xs-6">
              <div class="form-group">
                <label for="edit_phone">Phone</label>
                <input type="text" class="form-control" id="edit_phone" name="edit_phone" autocomplete="off">
              </div>
            </div>
          </div>    


          <div class="radio">
              <label><input type="radio" name="edit_active" id="edit_active" value="1" >
                Active&nbsp;&nbsp;&nbsp;&nbsp;</label>
              <label><input type="radio" name="edit_active" id="edit_inactive" value="2" >
                Inactive</label>
          </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Save</button>
        </div>

      </div>

      </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<?php endif; ?>


<!-----------------------------------------------------------  Delete  ------------------------------------------------------------------>

<?php if(in_array('deleteUser', $user_permission)): ?>

<div class="modal fade" tabindex="-1" role="dialog" id="removeModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Delete User</h4>
      </div>

      <form role="form" action="<?php echo base_url('user/remove') ?>" method="post" id="removeForm">
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
var base_url = "<?php echo base_url(); ?>";

$(document).ready(function() {

    //---> creation of the drop-down list Profile
    $profile = $('[id="profile"]');    
    $.ajax({
        url: base_url+'user/fetchProfileData',
        dataType: "JSON", 
        success: function (data) {
            $profile.html('');
            //iterate over the data and append a select option
            $.each(data, function (key, val) {
                $profile.append('<option value="' + val.id + '">' + val.name + '</option>');
            });  
            
        }, 
        error: function () {
        //if there is an error append a 'none available' option
        $profile.html('<option id="-1">none available</option>');
        }
    });

  $("#userNav").addClass('active');

  // initialize the datatable 
  manageTable = $('#manageTable').DataTable({
    'ajax': base_url + 'user/fetchUserData',
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



// edit function
function editFunc(id)

{ 



  $.ajax({
    url: base_url + 'user/fetchUserDataById/'+id,
    type: 'post',
    dataType: 'json',
    success:function(response) {
      $('[name="edit_profile"]').val(response.profile_id);
      $("#edit_username").val(response.username);
      $("#edit_name").val(response.name);
      $("#edit_phone").val(response.phone);
      $("#edit_email").val(response.email);
       if(response.active==1){
          $('input:radio[id=edit_active]')[0].checked = true;
          $('input:radio[id=edit_inactive]')[0].checked = false;
        }else{
          $('input:radio[id=edit_active]')[0].checked = false;
          $('input:radio[id=edit_inactive]')[0].checked = true;
        }


      // submit the edit form 
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
        data: { user_id:id }, 
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


