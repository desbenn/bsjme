<div class="content-wrapper">
    <section class="content-header">
      <h1>Settings</h1>
      <ol class="breadcrumb">
        <li><a href="<?php echo base_url('dashboard') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Settings</li>
      </ol>
    </section>

  <br>



<!-------------------------------------------------  Main ------------------------------------------------------->

  <section class="content">

  <?php if($user_permission): ?>

    <div class="row">

       

        <!-- < Part on client / Consultation -->

        <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading bg-black">Client / Consultation</div>
              <div class="panel-body">

                <ul class="chart-legend" style="height:160px">   
                  
                <?php if(in_array('createPhase', $user_permission) || in_array('updatePhase', $user_permission) || in_array('viewPhase', $user_permission) || in_array('deletePhase', $user_permission)): ?>
                  <li id="phaseNav">
                    <a href="<?php echo base_url('phase/') ?>">Phase</a></li>
                <?php endif; ?>

                <?php if(in_array('createStatus', $user_permission) || in_array('updateStatus', $user_permission) || in_array('viewStatus', $user_permission) || in_array('deleteStatus', $user_permission)): ?>
                  <li id="statusNav">
                    <a href="<?php echo base_url('status/') ?>">Status</a></li>
                <?php endif; ?>

                 <?php if(in_array('createSector', $user_permission) || in_array('updateSector', $user_permission) || in_array('viewSector', $user_permission) || in_array('deleteSector', $user_permission)): ?>
                  <li id="sectorNav">
                    <a href="<?php echo base_url('sector/') ?>">Sector</a></li>
                <?php endif; ?>

                <?php if(in_array('createDocumentType', $user_permission) || in_array('updateDocumentType', $user_permission) || in_array('viewDocumentType', $user_permission) || in_array('deleteDocumentType', $user_permission)): ?>
                  <li id="typedocumentNav">
                    <a href="<?php echo base_url('document_type/') ?>">Document Type</a></li>
                <?php endif; ?>   
                
                <?php if(in_array('createInquiryType', $user_permission) || in_array('updateInquiryType', $user_permission) || in_array('viewInquiryType', $user_permission) || in_array('deleteInquiryType', $user_permission)): ?>
                  <li id="typeinquiryNav">
                    <a href="<?php echo base_url('inquiry_type/') ?>">Inquiry Type</a></li>
                <?php endif; ?>            

                <?php if(in_array('createSupportType', $user_permission) || in_array('updateSupportType', $user_permission) || in_array('viewSupportType', $user_permission) || in_array('deleteSupportType', $user_permission)): ?>
                  <li id="typesupportNav">
                    <a href="<?php echo base_url('support_type/') ?>">Support Type</a></li>
                <?php endif; ?>

              </ul>
            </div>
          </div>
        </div>


        <!-- < Part on QMS -->

        <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading bg-black">Quality Management System</div>
              <div class="panel-body">

                <ul class="chart-legend" style="height:160px">

                <?php if(in_array('createRequirement', $user_permission) || in_array('updateRequirement', $user_permission) || in_array('viewRequirement', $user_permission) || in_array('deleteRequirement', $user_permission)): ?>
                  <li id="requirementNav">
                    <a href="<?php echo base_url('requirement/') ?>">Requirement</a></li>
                <?php endif; ?>

                <?php if(in_array('createStandard', $user_permission) || in_array('updateStandard', $user_permission) || in_array('viewStandard', $user_permission) || in_array('deleteStandard', $user_permission)): ?>
                  <li id="questionNav">
                    <a href="<?php echo base_url('standard/') ?>">Standard</a></li>
                <?php endif; ?>

                <?php if(in_array('createClause', $user_permission) || in_array('updateClause', $user_permission) || in_array('viewClause', $user_permission) || in_array('deleteClause', $user_permission)): ?>
                  <li id="clauseNav">
                    <a href="<?php echo base_url('clause/') ?>">Clause</a></li>
                <?php endif; ?>

                <?php if(in_array('createSubClause', $user_permission) || in_array('updateSubClause', $user_permission) || in_array('viewSubClause', $user_permission) || in_array('deleteSubClause', $user_permission)): ?>
                  <li id="subClauseNav">
                    <a href="<?php echo base_url('sub_clause/') ?>">Sub Clause</a></li>
                <?php endif; ?>

                <?php if(in_array('createQuestion', $user_permission) || in_array('updateQuestion', $user_permission) || in_array('viewQuestion', $user_permission) || in_array('deleteQuestion', $user_permission)): ?>
                  <li id="questionNav">
                    <a href="<?php echo base_url('question/') ?>">Questions</a></li>
                <?php endif; ?>

                <?php if(in_array('createManual', $user_permission) || in_array('updateManual', $user_permission) || in_array('viewManual', $user_permission) || in_array('deleteManual', $user_permission)): ?>
                  <li id="manualNav">
                    <a href="<?php echo base_url('manual/') ?>">Manuals</a></li>
                <?php endif; ?> 

                
                </ul>
            </div>
          </div>
        </div>


        <!-- < Part on location -->

        <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading bg-black">Location</div>
              <div class="panel-body">

                <ul class="chart-legend" style="height:160px">

                <?php if(in_array('createCounty', $user_permission) || in_array('updateCounty', $user_permission) || in_array('viewCounty', $user_permission) || in_array('deleteCounty', $user_permission)): ?>
                  <li id="countyNav">
                    <a href="<?php echo base_url('county/') ?>">County</a></li>
                <?php endif; ?>

                <?php if(in_array('createParish', $user_permission) || in_array('updateParish', $user_permission) || in_array('viewParish', $user_permission) || in_array('deleteParish', $user_permission)): ?>
                  <li id="parishNav">
                    <a href="<?php echo base_url('parish/') ?>">Parish</a></li>
                <?php endif; ?>

                <?php if(in_array('createCity', $user_permission) || in_array('updateCity', $user_permission) || in_array('viewCity', $user_permission) || in_array('deleteCity', $user_permission)): ?>
                  <li id="cityNav">
                    <a href="<?php echo base_url('city/') ?>">City</a></li>
                <?php endif; ?>

              </ul>
            </div>
          </div>
        </div>



        <!-- < Part on user management -->

        <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading bg-black">User</div>
              <div class="panel-body">

                <ul class="chart-legend" style="height:160px">

                <?php if(in_array('viewMyUser', $user_permission)): ?>
                  <li><a href="<?php echo base_url('user/my_user/') ?>">My User</a></li>
                <?php endif; ?>
				
				<?php if(in_array('createUser', $user_permission) || in_array('updateUser', $user_permission) || in_array('viewUser', $user_permission) || in_array('deleteUser', $user_permission)): ?>
                      <?php if(in_array('updateUser', $user_permission) || in_array('viewUser', $user_permission) || in_array('deleteUser', $user_permission)): ?>
                      <li id="manageuserNav"><a href="<?php echo base_url('user') ?>">User</a></li>
                    <?php endif; ?>
                  </li>
                  <?php endif; ?>

                  <?php if(in_array('createProfile', $user_permission) || in_array('updateProfile', $user_permission) || in_array('viewProfile', $user_permission) || in_array('deleteProfile', $user_permission)): ?>
                      <?php if(in_array('updateProfile', $user_permission) || in_array('viewProfile', $user_permission) || in_array('deleteProfile', $user_permission)): ?>
                        <li id="manageProfileNav"><a href="<?php echo base_url('profile') ?>">Profile</a></li>
                        <?php endif; ?>
                    </li>
                  <?php endif; ?>

              </ul>
            </div>
          </div>
        </div>


        <!-- < Part on News -->

        <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading bg-black">News</div>
              <div class="panel-body">

                <ul class="chart-legend" style="height:160px">

                  <?php if(in_array('createCategory', $user_permission) || in_array('updateCategory', $user_permission) || in_array('viewCategory', $user_permission) || in_array('deleteCategory', $user_permission)): ?>
                  <li id="categoryNav">
                    <a href="<?php echo base_url('category/') ?>">Category</a></li>
                  <?php endif; ?>

                  <?php if(in_array('createPost', $user_permission) || in_array('updatePost', $user_permission) || in_array('viewPost', $user_permission) || in_array('deletePost', $user_permission)): ?>
                  <li id="postNav">
                    <a href="<?php echo base_url('post/') ?>">Post</a></li>
                  <?php endif; ?>

              </ul>
            </div>
          </div>
        </div>


        <!-- < Part on System -->
        <?php if(in_array('updateSystem', $user_permission)): ?>
        <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading bg-black">System Maintenance</div>
              <div class="panel-body">

                <ul class="chart-legend" style="height:160px">                  

                  <li><a href="<?php echo base_url('backup/database_backup') ?>">Backup Database</a></li>
                  <li><a href="<?php echo base_url('backup/zip_upload') ?>">Backup Upload (Documents and Posts)</a></li>    
                  <li><a href="<?php echo base_url('documentation/system_documentation/') ?>"><i class="fa fa-book"></i> <span>System Documentation</span></a></li>
                  <li><a href="<?php echo base_url('documentation/database_schema/') ?>"><i class="fa fa-book"></i> <span>Database Schema</span></a></li>
				  <li><?php echo 'CodeIgniter Version '.CI_VERSION; ?></li>

              </ul>
            </div>
          </div>
        </div>
        <?php endif; ?>

        </div>    <!-- row -->

        <?php endif; ?> <!-- user permission info -->

  </section>   <!-- main section -->

</div> <!-- Content Wrapper. Contains page content -->



