<div class="content-wrapper">
  <section class="content-header">
    <h1>Post</h1>
    <ol class="breadcrumb">
      <li><a href="<?php echo base_url('setting') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Post</li>
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

        <?php if(in_array('createPost', $user_permission)): ?>
          <a href="<?php echo base_url('post/create') ?>" class="btn btn-primary">Add Post</a>
          <br /> <br />
        <?php endif; ?>

        <div class="box">
          <div class="box-header"></div>
          <div class="box-body">
            <div class="table-responsive">
              <table id="manageTable" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th width="30%">Title</th>
                    <th width="15%">Category</th>                    
                    <th width="5%">Client Visibility</th>
                    <th width="10%">Date from</th>
                    <th width="10%">Date to</th>
                    <th width="15%">Posted by</th>
                    <th width="5%">Active</th>
                      <?php if(in_array('updatePost', $user_permission) || in_array('deletePost', $user_permission)): ?>
                    <th width="10%">Action</th>
                    <?php endif; ?>
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

<?php if(in_array('deletePost', $user_permission)): ?>

<div class="modal fade" tabindex="-1" role="dialog" id="removeModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Delete Post</h4>
      </div>

      <form role="form" action="<?php echo base_url('post/remove') ?>" method="post" id="removeForm">
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


<!-----------------------------------------------------------  Javascript ------------------------------------------------------------------>


<script type="text/javascript">
var manageTable;
var base_url = "<?php echo base_url(); ?>";

$(document).ready(function() {

  $("#mainPostNav").addClass('active');

  // initialize the datatable
  manageTable = $('#manageTable').DataTable({
    'ajax': base_url + 'post/fetchPostData',
    'order': [[0, 'asc']]
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
        data: { post_id:id },
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
