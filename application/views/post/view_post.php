<div class="content-wrapper">
  <section class="content-header">
    <h1>News</h1>
    <ol class="breadcrumb">
      <li><a href="<?php echo base_url('dashboard') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">News</li>
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
        	<div class="col-md-9 col-xs-9">
        	</div>
  			<div class="col-md-3 col-xs-3" align="right">
  				<?php if(in_array('updatePost', $user_permission)): ?>
         		 <a href="<?php echo base_url('post/update/'.$post_data['id']) ?>" class="btn btn-primary">Edit Post </a>
             <br /> <br />
        		<?php endif; ?>

			</div>
		</div>

    <div class="box">

        <div class="box-body">

      	   <div class="row">
  			       <div class="col-md-12 col-xs-12">
  				        <h4><?php echo $post_data['post_title']; ?></h4>
			         </div>
		        </div>

      	   <div class="row">
  			     <div class="col-md-3 col-xs-3">

                <?php if(strpos($post_data['doc_type'],'application/vnd') !== false): ?>
                   <img class="img-thumbnail" src="<?php echo site_url(); ?>assets/images/msoffice.jpg" width="180" height="180">
                <?php elseif(strpos($post_data['doc_type'],'application/pdf') !== false): ?>
                   <img class="img-thumbnail" src="<?php echo site_url(); ?>assets/images/pdf.png" width="180" height="180">
                <?php else: ?>
        				   <img class="img-thumbnail" src="<?php echo site_url(); ?>upload/posts/<?php echo $post_data['post_image']; ?>" width="180" height="180">
                <?php endif; ?>
                <a href="<?php echo site_url(); ?>upload/posts/<?php echo $post_data['post_image']; ?>" target="_blank" class="btn btn-default"><i class="fa fa-search"></i></a>

        				<br><br><br>
			       </div>

			<div class="col-md-9 col-xs-9">
				<small class="post-date">Posted on <?php echo $post_data['updated_date']; ?> in <strong><?php echo $post_data['name']; ?></strong> by <?php echo $post_data['posted_by']; ?></small><br>
				<?php echo ($post_data['post_text']); ?>
      </div>

      <br>

        <div class="col-md-12 col-xs-12">
          <table id="manageTableDocument" class="table table-bordered table-striped" style="width:100%">
            <thead>
              <tr>
                <th>Document</th>
                <th>Size</th>
                <th>Action</th>
              </tr>
            </thead>
          </table>
      </div>

				<br><br><br>
			</div>
		</div>
  </div>
</form>
</div>


	</div>
  </div>
 </section>
</div>

<!------------------------------------->
<!-- Javascript part of Document    --->
<!------------------------------------->


<script type="text/javascript">
var manageTableDocument;
var base_url = "<?php echo base_url(); ?>";


  $("#DocumentPostNav").addClass('active');

  // initialize the datatable
  manageTableDocument = $('#manageTableDocument').DataTable({
    'ajax': base_url+'post/fetchPostDocumentView/'+'<?php echo $post_data['id']; ?>',
    'order': [[0, "asc"]]
  });

</script>


