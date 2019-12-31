<div class="content-wrapper">
  <section class="content-header">
    <h1>Email</h1>
    <ol class="breadcrumb">
      <li><a href="<?php echo base_url('setting') ?>"><i class="fa fa-dashboard">
      </i> Home</a></li>
      <li class="active">Email</li>
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
		
		<?php
		echo $this->session->flashdata('email_sent');
		echo form_open('/Email/send_mail');
		?>
		<input type = "email" name = "email" required />
		<input type = "submit" value = "SEND MAIL">
		<?php
		echo form_close();
		?>

    </div>
  </div>

</section>
</div>  <!-- /.content-wrapper -->




