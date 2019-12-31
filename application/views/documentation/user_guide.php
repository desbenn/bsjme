<?php if($this->session->profile == 4) { ?>   <!-- The user is a client and we need to view the user guide for client -->
	<embed width=100% height="1000px" src=<?php echo base_url()."assets/documentation/user_guide_client.pdf" ?> type="application/pdf"></embed>
<?php } else { ?>
	<embed width=100% height="1000px" src=<?php echo base_url()."assets/documentation/user_guide.pdf" ?> type="application/pdf"></embed>
<?php } ?>

