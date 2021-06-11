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
            <li id="manageClientNav"><a href="<?php echo base_url('Client') ?>"><i class="fa fa-user"></i><?php if($this->session->profile !='4'):?>Clients<?php endif; ?><?php if($this->session->profile =='4'):?>Client<?php endif; ?></a></li>
        <?php endif; ?>

        <?php if(in_array('createConsultation', $user_permission) || in_array('updateConsultation', $user_permission) || in_array('viewConsultation', $user_permission) || in_array('deleteConsultation', $user_permission)): ?>                
            <li><a href="<?php echo base_url('Consultation') ?>"><i class="fa fa-forumbee"></i>
                <span><?php if($this->session->profile !='4'):?>Consultations<?php endif; ?><?php if($this->session->profile =='4'):?>Consultation<?php endif; ?></span></a>
            </li>
        <?php endif; ?>

        <?php if(in_array('createTechnicalAdvice', $user_permission) || in_array('updateTechnicalAdivce', $user_permission) || in_array('viewTechnicalAdvice', $user_permission) || in_array('deleteTechnicalAdvice', $user_permission)): ?>                
            <li><a href="<?php echo base_url('Technical_advice') ?>"><i class="fa fa-comments"></i>
                <span>Technical Advice(s)</span></a>
            </li>
        <?php endif; ?>


        <?php if(in_array('viewReport', $user_permission)): ?>
          <li><a href="<?php echo base_url('report') ?>">
              <i class="glyphicon glyphicon-stats"></i> <span>Reports</span></a>
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