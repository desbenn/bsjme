<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">

        <?php if($user_permission): ?>

        <?php if(in_array('viewDashboard', $user_permission)): ?>
          <li class="<?php echo ($this->uri->segment(1) === 'dashboard') ? 'active' : '' ?>" id="dashboardMainMenu">
          <a href="<?php echo base_url('dashboard/') ?>">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
          </a>
        </li>
        <?php endif; ?> 


        <?php if(in_array('viewNews', $user_permission)): ?>
          <li>
            <a href="<?php echo base_url('post/view') ?>">
              <i class="glyphicon glyphicon-eye-open"></i> <span>News</span>
            </a>
          </li>
        <?php endif; ?>


        <?php if(in_array('createClient', $user_permission) || in_array('updateClient', $user_permission) || in_array('viewClient', $user_permission) || in_array('deleteClient', $user_permission)): ?>              
            <li id="manageClientNav"><a href="<?php echo base_url('Client') ?>"><i class="fa fa-user"></i>Clients</a></li>
        <?php endif; ?>

        <?php if(in_array('createClient', $user_permission) || in_array('updatePendingClient', $user_permission) || in_array('viewPendingClient', $user_permission) || in_array('deletePendingClient', $user_permission)): ?>              
            <li id="managePendingClientNav"><a href="<?php echo base_url('pending_client') ?>"><i class="fa fa-user"></i>Pending Client(s)</a></li>
        <?php endif; ?>

        <?php if(in_array('createConsultation', $user_permission) || in_array('updateConsultation', $user_permission) || in_array('viewConsultation', $user_permission) || in_array('deleteConsultation', $user_permission)): ?>                
            <li><a href="<?php echo base_url('Consultation') ?>"><i class="fa fa-forumbee"></i>
                <span>Consultations</span></a>
            </li>
        <?php endif; ?>
        

        <?php if(in_array('viewReport', $user_permission)): ?>
          <li><a href="<?php echo base_url('report') ?>">
              <i class="glyphicon glyphicon-stats"></i> <span>Reports</span></a>
          </li>
        <?php endif; ?>



        <!-- IF we have a profile consultant(3) or client (4) we want My User to appear in the menu -->  

        <?php if(in_array('viewMyUser', $user_permission) AND ($this->session->profile == 4 OR $this->session->profile == 3)): ?>
              <li><a href="<?php echo base_url('user/my_user/') ?>"><i class="fa fa-book"></i>
                  <span>My User</span></a>
              </li>  
        <?php endif; ?>


        <?php if(in_array('updateSetting', $user_permission)): ?>
          <li><a href="<?php echo base_url('setting/') ?>"><i class="fa fa-cogs"></i> <span>Settings</span></a></li>
        <?php endif; ?>

        <?php endif; ?>

        <?php if(in_array('viewDocumentation', $user_permission)): ?>
          <li class="<?php echo ($this->uri->segment(1) === 'documentation') ? 'active' : '' ?>">
            <a href="<?php echo base_url('documentation/user_guide/') ?>">
              <i class="fa fa-book"></i> <span>Documentation</span>
            </a>
          </li>
        <?php endif; ?>

        <li><a href="<?php echo base_url('auth/logout') ?>"><i class="glyphicon glyphicon-log-out"></i> <span>Logout</span></a></li>

      </ul>
    </section>
  </aside>