<div class="content-wrapper">
    <section class="content-header">
      <h1>Profile</h1>
      <ol class="breadcrumb">
        <li><a href="<?php echo base_url('dashboard') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Profile</li>
      </ol>
    </section>

  <br>



<!-------------------------------------------------  Main ------------------------------------------------------->

  <section class="content">

  <?php if($user_permission): ?>

    <form role="form" action="<?php base_url('profile/update') ?>" method="post">

        <?php echo validation_errors(); ?>
        
         <div class="row">
            <div class="col-md-9 col-xs-9">
              <div class="form-profile">
                <label for="name">Profile Name <font color="red">*</font></label>
                <input type="text" class="form-control" id="name" name="name" value="<?php echo $profile_data['name']; ?>"
                 <?php if($profile_data['protected'] == 1) {echo 'disabled';} ?>>
                 <?php if($profile_data['protected'] == 1) {
                  echo '<input type="hidden" id="name" name="name" value='.$profile_data['name'].'>';
                }; ?>

              </div>
            </div>  

             <div class="col-md-3 col-xs-3">
              <div class="form-checkbox" align="right">
                <input type="checkbox" name="protected" id="protected" class="minimal" value="1"
                 <?php if($profile_data['protected'] == 1) {echo "checked"; } ?>>
                <label for="proctected">&nbsp;&nbsp;&nbsp;Profile Protected</label>
            </div>  
          </div>
        </div>

      <?php $serialize_permission = unserialize($profile_data['permission']); ?>

        <br>

    <div class="row">

       <!-- < Part on Client/Consultation -->

        <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading bg-black">Client/Consultation</div>
              <div class="panel-body">

                <ul class="chart-legend" style="height:320px">

                <table class="table table-responsive">
                  <thead>
                    <tr>
                      <th></th>
                      <th>Create</th>
                      <th>Update</th>
                      <th>View</th>
                      <th>Delete</th>
                    </tr>
                  </thead>
                <tbody>
                   <tr>
                    <td>Client</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createClient" <?php if($serialize_permission) {
                      if(in_array('createClient', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateClient" <?php if($serialize_permission) {
                      if(in_array('updateClient', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewClient" <?php if($serialize_permission) {
                      if(in_array('viewClient', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteClient" <?php if($serialize_permission) {
                      if(in_array('deleteClient', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr>

                  <tr>
                    <td>Pending Client</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createPendingClient" <?php if($serialize_permission) {
                      if(in_array('createPendingClient', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updatePendingClient" <?php if($serialize_permission) {
                      if(in_array('updatePendingClient', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewPendingClient" <?php if($serialize_permission) {
                      if(in_array('viewPendingClient', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deletePendingClient" <?php if($serialize_permission) {
                      if(in_array('deletePendingClient', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr>

                  <tr>
                    <td>Consultation</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createConsultation" <?php if($serialize_permission) {
                      if(in_array('createConsultation', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateConsultation" <?php if($serialize_permission) {
                      if(in_array('updateConsultation', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewConsultation" <?php if($serialize_permission) {
                      if(in_array('viewConsultation', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteConsultation" <?php if($serialize_permission) {
                      if(in_array('deleteConsultation', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr>
                  <tr>
                    <td>Phase</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createPhase" <?php if($serialize_permission) {
                      if(in_array('createPhase', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updatePhase" <?php if($serialize_permission) {
                      if(in_array('updatePhase', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewPhase" <?php if($serialize_permission) {
                      if(in_array('viewPhase', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deletePhase" <?php if($serialize_permission) {
                      if(in_array('deletePhase', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr>
                 <tr>
                    <td>Status</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createStatus" <?php if($serialize_permission) {
                      if(in_array('createStatus', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateStatus" <?php if($serialize_permission) {
                      if(in_array('updateStatus', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewStatus" <?php if($serialize_permission) {
                      if(in_array('viewStatus', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteStatus" <?php if($serialize_permission) {
                      if(in_array('deleteStatus', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr>
                  <tr>
                    <td>Sector</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createSector" <?php if($serialize_permission) {
                      if(in_array('createSector', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateSector" <?php if($serialize_permission) {
                      if(in_array('updateSector', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewSector" <?php if($serialize_permission) {
                      if(in_array('viewSector', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteSector" <?php if($serialize_permission) {
                      if(in_array('deleteSector', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr>
                  <tr>
                    <td>Document</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createDocument" <?php if($serialize_permission) {
                      if(in_array('createDocument', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateDocument" <?php if($serialize_permission) {
                      if(in_array('updateDocument', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewDocument" <?php if($serialize_permission) {
                      if(in_array('viewDocument', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteDocument" <?php if($serialize_permission) {
                      if(in_array('deleteDocument', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr>

                  <tr>
                    <td>Document Type</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createDocumentType" <?php if($serialize_permission) {
                      if(in_array('createDocumentType', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateDocumentType" <?php if($serialize_permission) {
                      if(in_array('updateDocumentType', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewDocumentType" <?php if($serialize_permission) {
                      if(in_array('viewDocumentType', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteDocumentType" <?php if($serialize_permission) {
                      if(in_array('deleteDocumentType', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr>              
                </tbody> 
              </table>
            </ul>
          </div></div></div>



 <!-- < Part on QMS -->

        <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading bg-black">Quality Management System</div>
              <div class="panel-body">

                <ul class="chart-legend" style="height:320px">

                <table class="table table-responsive">
                  <thead>
                    <tr>
                      <th></th>
                      <th>Create</th>
                      <th>Update</th>
                      <th>View</th>
                      <th>Delete</th>
                    </tr>
                  </thead>
                <tbody>
                <tr>
                    <td>Requirement</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createRequirement" <?php if($serialize_permission) {
                      if(in_array('createRequirement', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateRequirement" <?php if($serialize_permission) {
                      if(in_array('updateRequirement', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewRequirement" <?php if($serialize_permission) {
                      if(in_array('viewRequirement', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteRequirement" <?php if($serialize_permission) {
                      if(in_array('deleteRequirement', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr>
                  <tr>
                    <td>Standard</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createStandard" <?php if($serialize_permission) {
                      if(in_array('createStandard', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateStandard" <?php if($serialize_permission) {
                      if(in_array('updateStandard', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewStandard" <?php if($serialize_permission) {
                      if(in_array('viewStandard', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteStandard" <?php if($serialize_permission) {
                      if(in_array('deleteStandard', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr>
                   <tr>
                    <td>Clause</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createClause" <?php if($serialize_permission) {
                      if(in_array('createClause', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateClause" <?php if($serialize_permission) {
                      if(in_array('updateClause', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewClause" <?php if($serialize_permission) {
                      if(in_array('viewClause', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteClause" <?php if($serialize_permission) {
                      if(in_array('deleteClause', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr>
                  <tr>
                    <td>Sub Clause</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createSubClause" <?php if($serialize_permission) {
                      if(in_array('createSubClause', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateSubClause" <?php if($serialize_permission) {
                      if(in_array('updateSubClause', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewSubClause" <?php if($serialize_permission) {
                      if(in_array('viewSubClause', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteSubClause" <?php if($serialize_permission) {
                      if(in_array('deleteSubClause', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr>
                  <tr>
                    <td>Question</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createQuestion" <?php if($serialize_permission) {
                      if(in_array('createQuestion', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateQuestion" <?php if($serialize_permission) {
                      if(in_array('updateQuestion', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewQuestion" <?php if($serialize_permission) {
                      if(in_array('viewQuestion', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteQuestion" <?php if($serialize_permission) {
                      if(in_array('deleteQuestion', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr>     
                  <tr>
                    <td>Manual</td>
                      <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createManual" <?php if($serialize_permission) {
                        if(in_array('createManual', $serialize_permission)) { echo "checked"; }
                      } ?>></td>
                      <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateManual" <?php if($serialize_permission) {
                        if(in_array('updateManual', $serialize_permission)) { echo "checked"; }
                      } ?>></td>
                      <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewManual" <?php if($serialize_permission) {
                        if(in_array('viewManual', $serialize_permission)) { echo "checked"; }
                      } ?>></td>
                      <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteManual" <?php if($serialize_permission) {
                        if(in_array('deleteManual', $serialize_permission)) { echo "checked"; }
                      } ?>></td>
                  </tr>
                </tbody> 
              </table>
            </ul>
          </div></div></div>

        <!-- < Part on location -->

        <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading bg-black">Location</div>
              <div class="panel-body">

                <ul class="chart-legend" style="height:320px">

                <table class="table table-responsive">
                  <thead>
                    <tr>
                      <th></th>
                      <th>Create</th>
                      <th>Update</th>
                      <th>View</th>
                      <th>Delete</th>
                    </tr>
                  </thead>
                <tbody>
                  <tr>
                    <td>County</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createCounty" <?php if($serialize_permission) {
                      if(in_array('createCounty', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateCounty" <?php if($serialize_permission) {
                      if(in_array('updateCounty', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewCounty" <?php if($serialize_permission) {
                      if(in_array('viewCounty', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteCounty" <?php if($serialize_permission) {
                      if(in_array('deleteCounty', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr>       
                  <tr>
                    <td>Parish</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createParish" <?php if($serialize_permission) {
                      if(in_array('createParish', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateParish" <?php if($serialize_permission) {
                      if(in_array('updateParish', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewParish" <?php if($serialize_permission) {
                      if(in_array('viewParish', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteParish" <?php if($serialize_permission) {
                      if(in_array('deleteParish', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr> 
                  <tr>
                    <td>City</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createCity" <?php if($serialize_permission) {
                      if(in_array('createCity', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateCity" <?php if($serialize_permission) {
                      if(in_array('updateCity', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewCity" <?php if($serialize_permission) {
                      if(in_array('viewCity', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteCity" <?php if($serialize_permission) {
                      if(in_array('deleteCity', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr>               
                </tbody> 
              </table>
            </ul>
          </div></div></div>

   </div>   <!-- < /row -->
      

   <div class="row">


        <!-- < Part on News and Inquiry -->

        <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading bg-black">News and Inquiry</div>
              <div class="panel-body">

                <ul class="chart-legend" style="height:280px">

                <table class="table table-responsive">
                  <thead>
                    <tr>
                      <th></th>
                      <th>Create</th>
                      <th>Update</th>
                      <th>View</th>
                      <th>Delete</th>
                    </tr>
                  </thead>
                <tbody>
                   <tr>
                    <td>Post</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createPost" <?php if($serialize_permission) {
                      if(in_array('createPost', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updatePost" <?php if($serialize_permission) {
                      if(in_array('updatePost', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewPost" <?php if($serialize_permission) {
                      if(in_array('viewPost', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deletePost" <?php if($serialize_permission) {
                      if(in_array('deletePost', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr>
                  <tr>
                    <td>Category</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createCategory" <?php if($serialize_permission) {
                      if(in_array('createCategory', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateCategory" <?php if($serialize_permission) {
                      if(in_array('updateCategory', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewCategory" <?php if($serialize_permission) {
                      if(in_array('viewCategory', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteCategory" <?php if($serialize_permission) {
                      if(in_array('deleteCategory', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr>
                  <tr>
                    <td>Inquiry</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createInquiry" <?php if($serialize_permission) {
                      if(in_array('createInquiry', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateInquiry" <?php if($serialize_permission) {
                      if(in_array('updateInquiry', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewInquiry" <?php if($serialize_permission) {
                      if(in_array('viewInquiry', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteInquiry" <?php if($serialize_permission) {
                      if(in_array('deleteInquiry', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr>

                  <tr>
                    <td>Inquiry Type</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createInquiryType" <?php if($serialize_permission) {
                      if(in_array('createInquiryType', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateInquiryType" <?php if($serialize_permission) {
                      if(in_array('updateInquiryType', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewInquiryType" <?php if($serialize_permission) {
                      if(in_array('viewInquiryType', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteInquiryType" <?php if($serialize_permission) {
                      if(in_array('deleteInquiryType', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr> 
                  <tr>
                    <td>Support Type</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createSupportType" <?php if($serialize_permission) {
                      if(in_array('createSupportType', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateSupportType" <?php if($serialize_permission) {
                      if(in_array('updateSupportType', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewSupportType" <?php if($serialize_permission) {
                      if(in_array('viewSupportType', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteSupportType" <?php if($serialize_permission) {
                      if(in_array('deleteSupportType', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                  </tr>  
                </tbody> 
              </table>
            </ul>
          </div></div></div>

         <!-- Part on Menu -->

        <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading bg-black">Menu</div>
              <div class="panel-body">

                <ul class="chart-legend" style="height:280px">

                <table class="table table-responsive">
                  <thead>
                    <tr>
                      <th></th>
                      <th>Create</th>
                      <th>Update</th>
                      <th>View</th>
                      <th>Delete</th>
                    </tr>
                  </thead>
                <tbody>                    
                  <tr>
                    <td>Dashboard</td>
                    <td> - </td>
                    <td> - </td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewDashboard" <?php if($serialize_permission) {
                      if(in_array('viewDashboard', $serialize_permission)) { echo "checked"; }} ?>></td>
                    <td> - </td>
                  </tr>
                  <td>News</td>
                    <td> - </td>
                    <td> - </td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewNews" <?php if($serialize_permission) {
                      if(in_array('viewNews', $serialize_permission)) { echo "checked"; }} ?>></td>
                    <td> - </td>
                  </tr>                   
                  <tr>
                  <td>Reports</td>
                    <td> - </td>
                    <td> - </td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewReport" <?php if($serialize_permission) {
                      if(in_array('viewReport', $serialize_permission)) { echo "checked"; }} ?>></td>
                    <td> - </td>
                  </tr>
                  <tr>
                  <td>Documentation</td>
                    <td> - </td>
                    <td> - </td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewDocumentation" <?php if($serialize_permission) {
                      if(in_array('viewDocumentation', $serialize_permission)) { echo "checked"; }} ?>></td>
                    <td> - </td>
                  </tr> 
                  <tr>
                    <td>My User</td>
                    <td> - </td>
                    <td> - </td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewMyUser" <?php if($serialize_permission) {
                      if(in_array('viewMyUser', $serialize_permission)) { echo "checked"; }} ?>></td>
                    <td> - </td>
                  </tr>
                   <tr>
                    <td>Search Consultant</td>
                    <td> - </td>
                    <td> - </td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewSearchConsultant" <?php if($serialize_permission) {
                      if(in_array('viewSearchConsultant', $serialize_permission)) { echo "checked"; }} ?>></td>
                    <td> - </td>
                  </tr>
              </table>
            </ul>
          </div></div></div>


          <!-- < Part on Admin -->

        <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading bg-black">System Admin</div>
              <div class="panel-body">

                <ul class="chart-legend" style="height:280px">

                <table class="table table-responsive">
                  <thead>
                    <tr>
                      <th></th>
                      <th>Create</th>
                      <th>Update</th>
                      <th>View</th>
                      <th>Delete</th>
                    </tr>
                  </thead>
                <tbody>
                  <tr>
                    <td>User</td>
                    <td><input type="checkbox" class="minimal" name="permission[]" id="permission" class="minimal" value="createUser" <?php if($serialize_permission) {
                      if(in_array('createUser', $serialize_permission)) { echo "checked"; }
                    } ?> ></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateUser" <?php
                    if($serialize_permission) {
                      if(in_array('updateUser', $serialize_permission)) { echo "checked"; }
                    }
                    ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewUser" <?php
                    if($serialize_permission) {
                      if(in_array('viewUser', $serialize_permission)) { echo "checked"; }
                    }
                    ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteUser" <?php
                    if($serialize_permission) {
                      if(in_array('deleteUser', $serialize_permission)) { echo "checked"; }
                    }
                     ?>></td>
                  </tr>
                  <tr>
                    <td>Profile</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="createProfile" <?php
                    if($serialize_permission) {
                      if(in_array('createProfile', $serialize_permission)) { echo "checked"; }
                    }
                     ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateProfile" <?php
                    if($serialize_permission) {
                      if(in_array('updateProfile', $serialize_permission)) { echo "checked"; }
                    }
                     ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="viewProfile" <?php
                    if($serialize_permission) {
                      if(in_array('viewProfile', $serialize_permission)) { echo "checked"; }
                    }
                     ?>></td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="deleteProfile" <?php
                    if($serialize_permission) {
                      if(in_array('deleteProfile', $serialize_permission)) { echo "checked"; }
                    }
                     ?>></td>
                  </tr>
                  <tr>
                    <td>System Maintenance</td>
                    <td>-</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateSystem" <?php if($serialize_permission) {
                      if(in_array('updateSystem', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td> - </td>
                    <td> - </td>
                  </tr>
                   <tr>
                    <td>Settings</td>
                    <td>-</td>
                    <td><input type="checkbox" name="permission[]" id="permission" class="minimal" value="updateSetting" <?php if($serialize_permission) {
                      if(in_array('updateSetting', $serialize_permission)) { echo "checked"; }
                    } ?>></td>
                    <td> - </td>
                    <td> - </td>
                  </tr>              
                </tbody> 
              </table>
            </ul>
          </div></div></div>

        </div>    <!-- /row -->


       <?php endif; ?> <!-- user permission info -->

       <button type="submit" class="btn btn-primary">Save</button>
       <a href="<?php echo base_url('profile/') ?>" class="btn btn-warning">Close</a>

  </section>   <!-- main section -->



  </div>  <!-- /.content-wrapper -->

<script type="text/javascript">
  $(document).ready(function() {
    $("#mainProfileNav").addClass('active');
    $("#addProfileNav").addClass('active');

    $('input[type="checkbox"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass   : 'iradio_minimal-blue'
    });
  });
</script>



