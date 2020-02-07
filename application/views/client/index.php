<div class="content-wrapper">
  <section class="content-header">
    <h1>Clients</h1>
    <ol class="breadcrumb">
      <li><a href="<?php echo base_url('dashboard') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Clients</li>
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

        <div class="row">
              <div class="col-md-6 col-xs-6 form-inline clearfix">
                <?php if(in_array('createClient', $user_permission)): ?>
                  <a href="<?php echo base_url('client/create') ?>" class="btn btn-primary">Add Client</a>
                <?php endif; ?>
              </div>

               <!-- If the user can search for a specific consultant, the drop-down list will appear -->
             <?php if(in_array('viewSearchConsultant', $user_permission)): ?>
                  <div class="col-md-6 col-xs-6 form-inline clearfix" align="right">
                    <div class="form-group">
                      <label for="consultant">Consultant</label>
                      <select class="custom-consultant-filter form-control" id="consultant" name="consultant" autocomplete="off">
                         <option value="all">All Consultant</option>
                          <?php foreach ($consultant as $k => $v): ?>
                          <option value="<?php echo $v['id'] ?>" <?php echo set_select('consultant', $v['id']); ?>><?php echo $v['name'] ?></option>
                          <?php endforeach ?>
                        </select>
                    </div>
                  </div>
              <?php endif; ?> 
          </div>

           <br /> <br />

        <div class="box">
          <div class="box-header"></div>
          <div class="box-body">
          <div class="table-responsive">
            <table id="manageTable" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Company Name</th>
                  <th>TRN</th>
                  <th>Client Name</th>
                  <th>Consultation No</th>
                  <th>Consultant Name</th>
                  <th>Active</th>
                  <th>Action</th>
                </tr>
                </thead>
              </table>
          </div>            
          </div>    <!-- /.box-body -->
        </div>   <!-- /.box -->
      </div>  <!-- col-md-12 -->
    </div>    <!-- /.row -->


  </section>  <!-- /.content -->
</div><!-- /.content-wrapper -->



<!-----------------------------------------------------------  Delete ------------------------------------------------------------------>

<?php if(in_array('deleteClient', $user_permission)): ?>

<div class="modal fade" tabindex="-1" role="dialog" id="removeModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Delete Client</h4>
      </div>

      <form role="form" action="<?php echo base_url('client/remove') ?>" method="post" id="removeForm">
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


<!----------------------------------------------------------  J A V A S C R I P T ------------------------------------------- -->


<script type="text/javascript">

var manageTable;
var base_url = "<?php echo base_url(); ?>";

$(document).ready(function() {

  $("#mainClientNav").addClass('active');

 //THE CONSULTANT FILTER CONTROLS
  var $consultantFilter = $('.custom-consultant-filter');

  manageTable = $('#manageTable').DataTable({
    'ajax': {
      'url': base_url+'client/fetchClientData/',
      'data': {
        'consultant': $('[name="consultant"]').val(),
      }
    },
    'order': [0, 'DESC']
  });

  //RELOAD TABLE ON CHANGE OF FILTERS
  $consultantFilter.on('change', function (e) {

    manageTable.destroy();

    manageTable = $('#manageTable').DataTable({
      'ajax': {
        'url': base_url+'client/fetchClientData/',        
        'data': {
          'consultant': $('[name="consultant"]').val(),
        }
      },
      'order': [0, 'DESC']
    });
  });

});


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
        data: { client_id:id },
        dataType: 'json',
        success:function(response) {

          manageTable.ajax.reload(null, false);

          if(response.success === true) {
            $("#messages").html('<div class="alert alert-success alert-dismissible" role="alert">'+
              '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
              '<strong> <span class="glyphicon glyphicon-ok-sign"></span> </strong>'+response.messages+
            '</div>');

            // hide the modal
            $("#removeModal").modal('hide');

          } else {

            $("#messages").html('<div class="alert alert-warning alert-dismissible" role="alert">'+
              '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
              '<strong> <span class="glyphicon glyphicon-exclamation-sign"></span> </strong>'+response.messages+
            '</div>');
          }
        }
      });

      return false;
    });
  }
}


</script>
