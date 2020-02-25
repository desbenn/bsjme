<header class="main-header">
    <!-- Logo -->
    <a href="<?php echo base_url('dashboard') ?>" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>BSJME</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>BSJME</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span></a>
</h4>
<div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->

          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <!-- The user image in the navbar-->
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs"><?php echo $_SESSION['name'] ?></span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
              <img  src="<?php echo base_url('assets/images/logo.jpg'); ?>" alt="" style='width: 70%; height:80%;'>
              </li>
              <!-- Menu Body -->
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="<?php echo base_url('user/my_user') ?>" class="btn btn-default btn-flat">Account</a>
                </div>
                <div class="pull-right">
                  <a href="<?php echo base_url('auth/logout') ?>" class="btn btn-default btn-flat">Logout</a> 
                </div>
          </li>
          <!-- Control Sidebar Toggle Button -->
        </ul>
      </div>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
