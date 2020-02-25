<div class="content-wrapper">
  <section class="content-header">
    <h1>Timeline</h1>
    <ol class="breadcrumb">
      <li><a href="<?php echo base_url('dashboard') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Timeline</li>
    </ol>
  </section>


  <!---------------------------------- View -------------------------------------------------------------------------->

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
		
		<ul class="timeline">

    <!--<?php foreach($timeline_data as $timeline) : ?>  --> 

    <!-- timeline time label -->
    <li class="time-label">
        <span class="bg-red">
           <!-- <?php echo $timeline['timestamp']; ?> -->
        </span>
    </li>
    <!-- /.timeline-label -->

    <!-- timeline item -->
    <li>
        <!-- timeline icon -->
        <i class="fa fa-envelope bg-blue"></i>
        <div class="timeline-item">
            <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>

            <h3 class="timeline-header"><a href="#">Consultation</a> ...</h3>

            <div class="timeline-body">
               <!-- <?php echo ucfirst($timeline['action']); ?> -->
            </div>

            <div class="timeline-footer">
                <a class="btn btn-primary btn-xs">...</a>
            </div>
        </div>
    </li>
    <!-- END timeline item -->

    <!--<?php endforeach; ?> -->

</ul>

</div>
</div>
</section>
</div>

<!----------------------------------------------------------  J A V A S C R I P T ------------------------------------------- -->


<script type="text/javascript">

var manageTable;
var base_url = "<?php echo base_url(); ?>";

$(document).ready(function() {

  $("#mainTimelineNav").addClass('active');


</script>
