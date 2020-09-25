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

    <form role="form" action="<?php base_url('profile/create') ?>" method="post">

        <?php echo validation_errors(); ?>
        
        <div class="row">
          <div class="col-md-9 col-xs-9">
            <div class="form-profile">
              <label for="name">Profile Name <font color="red">*</font></label>
              <input type="text" class="form-control" id="name" name="name" >
            </div>
          </div>  

           <div class="col-md-3 col-xs-3">
            <div class="form-profile" align="right">
              <input type="checkbox" name="protected" id="protected" class="minimal" value="1">
              <label for="proctected" data-toggle="tooltip" data-placement="bottom" title="A protected profile must be kept because the system will depend on the current profile for certain functions.">&nbsp;&nbsp;&nbsp;Profile Protected</label>
          </div>  
        </div>
      </div>

        <br>

    <div class="row">

       <!-- < Part on Client -->

        <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading bg-black">Client</div>
              <div class="panel-body">

                <ul class="chart-legend" style="height:300px">

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
                    <td><input type="checkbox" name="permission[]" id="permission" value="createClient" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateClient" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewClient" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteClient" class="minimal"></td>
                  </tr>  
                  <tr>
                    <td>Pending Client</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createPendingClient" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updatePendingClient" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewPendingClient" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deletePendingClient" class="minimal"></td>
                  </tr>  

                   <tr>
                    <td>Activity</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createActivity" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateActivity" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewActivity" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteActivity" class="minimal"></td>
                  </tr> 

                  <tr>
                    <td>Requirement</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createRequirement" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateRequirement" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewRequirement" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteRequirement" class="minimal"></td>
                  </tr>                   
                                
                      
                </tbody> 
              </table>
            </ul>
          </div></div></div>



 <!-- < Part on Consultation -->

        <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading bg-black">Consultation</div>
              <div class="panel-body">

                <ul class="chart-legend" style="height:300px">

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
                    <td>Consultation</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createConsultation" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateConsultation" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewConsultation" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteConsultation" class="minimal"></td>
                  </tr>
                  <tr>
                    <td>Program</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createProgram" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateProgram" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewProgram" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteProgram" class="minimal"></td>
                  </tr>
                  <tr>
                    <td>Phase</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createPhase" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updatePhase" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewPhase" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deletePhase" class="minimal"></td>
                  </tr>
                  <tr>
                    <td>Status</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createStatus" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateStatus" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewStatus" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteStatus" class="minimal"></td>
                  </tr>
                  <tr>
                    <td>Sector</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createSector" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateSector" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewSector" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteSector" class="minimal"></td>
                  </tr>               
                </tbody> 
              </table>
            </ul>
          </div></div></div>

          <!-- < Part on Technical Advice -->

        <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading bg-black">Technical Advice</div>
              <div class="panel-body">

                <ul class="chart-legend" style="height:300px">

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
                    <td>Technical Advice</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createTechnicalAdvice" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateTechnicalAdvice" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewTechnicalAdvice" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteTechnicalAdvice" class="minimal"></td>
                  </tr>
                  <tr>
                    <td>Needs Assessment</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createNeedsAssessment" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateNeedsAssessment" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewNeedsAssessment" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteNeedsAssessment" class="minimal"></td>
                  </tr>
                  <tr>
                    <td>Client Work Plan</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createWorkPlan" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateWorkPlan" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewWorkPlan" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteWorkPlan" class="minimal"></td>
                  </tr>
                  <tr>
                    <td>Internal Cost Plan</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createInternalCostPlan" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateInternalCostPlan" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewInternalCostPlan" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteInternalCostPlan" class="minimal"></td>
                  </tr>

                  <tr>
                    <td>Billing</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createBilling" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateBilling" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewBilling" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteBilling" class="minimal"></td>
                  </tr>
                </tbody> 
              </table>
            </ul>
          </div></div></div>
       </div>
       

       

        <div class="row">

        <!-- < Part on QMS -->

        <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading bg-black">Quality Management System</div>
              <div class="panel-body">

                <ul class="chart-legend" style="height:240px">

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
                    <td>Standard</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createStandard" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateStandard" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewStandard" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteStandard" class="minimal"></td>
                  </tr>
                  <tr>
                    <td>Clause</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createClause" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateClause" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewClause" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteClause" class="minimal"></td>
                  </tr>
                  <tr>
                    <td>Sub Clause</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createSubClause" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateSubClause" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewSubClause" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteSubClause" class="minimal"></td>
                  </tr>
                  <tr>
                    <td>Question</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createQuestion" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateQuestion" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewQuestion" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteQuestion" class="minimal"></td>
                  </tr> 

                  <tr>
                    <td>Answer</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createAnswers" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateAnswers" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewAnswers" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteAnswers" class="minimal"></td>
                  </tr>                    
                                
                </tbody> 
              </table>
            </ul>
          </div></div></div>

          <!-- < Part on Document -->

        <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading bg-black">Document</div>
              <div class="panel-body">

                <ul class="chart-legend" style="height:240px">

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
                    <td>Manual</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createManual" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateManual" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewManual" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteManual" class="minimal"></td>
                  </tr>
                  <tr>
                    <td>Document</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createDocument" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateDocument" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewDocument" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteDocument" class="minimal"></td>
                  </tr>
                  <tr>
                    <td>Document Type</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createDocumentType" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateDocumentType" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewDocumentType" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteDocumentType" class="minimal"></td>
                  </tr> 
                  <tr>
                    <td>Document Class</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createDocumentClass" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateDocumentClass" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewDocumentClass" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteDocumentClass" class="minimal"></td>
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

                <ul class="chart-legend" style="height:240px">

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
                    <td><input type="checkbox" name="permission[]" id="permission" value="createCounty" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateCounty" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewCounty" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteCounty" class="minimal"></td>
                  </tr>                 
                  <tr>
                    <td>Parish</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createParish" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateParish" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewParish" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteParish" class="minimal"></td>
                  </tr> 
                   <tr>
                    <td>City</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createCity" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateCity" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewCity" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteCity" class="minimal"></td>
                  </tr>                
                </tbody> 
              </table>
            </ul>
          </div></div></div>
   </div>   <!-- < /row -->
      

   


        

        <div class="row">

        <!-- < Part on Inquiry -->

        <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading bg-black">Inquiry</div>
              <div class="panel-body">

                <ul class="chart-legend" style="height:240px">

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
                    <td>Inquiry</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createInquiry" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateInquiry" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewInquiry" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteInquiry" class="minimal"></td>
                  </tr>
                  <tr>
                    <td>Inquiry Type</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createInquiryType" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateInquiryType" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewInquiryType" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteInquiryType" class="minimal"></td>
                  </tr>
                  <tr>
                    <td>Support Type</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createSupportType" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateSupportType" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewSupportType" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteSupportType" class="minimal"></td>
                   </tr>               
                </tbody> 
              </table>
            </ul>
          </div></div></div>

          <!-- < Part on News -->

        <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading bg-black">News</div>
              <div class="panel-body">

                <ul class="chart-legend" style="height:240px">

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
                    <td><input type="checkbox" name="permission[]" id="permission" value="createPost" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updatePost" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewPost" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deletePost" class="minimal"></td>
                  </tr>
                  <tr>
                    <td>Category Post</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createCategory" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateCategory" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewCategory" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteCategory" class="minimal"></td>
                  </tr>
                  
                </tbody> 
              </table>
            </ul>
          </div></div></div>

          <!-- < Part on Admin -->

        <div class="col-md-4">
          <div class="panel panel-primary">
            <div class="panel-heading bg-black">System Admin</div>
              <div class="panel-body">

                <ul class="chart-legend" style="height:240px">

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
                    <td><input type="checkbox" name="permission[]" id="permission" value="createUser" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateUser" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewUser" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteUser" class="minimal"></td>
                  </tr>
                  <tr>
                    <td>Profile</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="createProfile" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateProfile" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewProfile" class="minimal"></td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="deleteProfile" class="minimal"></td>
                  </tr>
                  <tr>
                    <td>System Maintenance</td>
                    <td>-</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateSystem" class="minimal"></td>
                    <td> - </td>
                    <td> - </td>
                  </tr>
                  <tr>
                    <td>Settings</td>
                    <td>-</td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="updateSetting" class="minimal"></td>
                    <td> - </td>
                    <td> - </td>
                  </tr>                 
                </tbody> 
              </table>
            </ul>
          </div></div></div>

          </div>    <!-- /row -->


          <div class="row">
          <!-- < Part on Menu -->

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
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewDashboard" class="minimal"></td>
                    <td> - </td>
                  </tr>
                  <tr>
                    <td>News</td>
                    <td> - </td>
                    <td> - </td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewNews" class="minimal"></td>
                    <td> - </td>
                  </tr>                 
                  <tr>
                    <td>Reports</td>
                    <td> - </td>
                    <td> - </td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewReport" class="minimal"></td>
                    <td> - </td>
                  </tr>
                  <tr>
                    <td>Documentation</td>
                    <td> - </td>
                    <td> - </td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewDocumentation" class="minimal"></td>
                    <td> - </td>
                  </tr> 
                  <tr>
                    <td>My User</td>
                    <td> - </td>
                    <td> - </td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewMyUser" class="minimal"></td>
                    <td> - </td>
                  </tr> 
                  <tr>
                    <td>Search Consultant</td>
                    <td> - </td>
                    <td> - </td>
                    <td><input type="checkbox" name="permission[]" id="permission" value="viewSearchConsultant" class="minimal"></td>
                    <td> - </td>
                  </tr> 
                </tbody> 
              </table>
            </ul>
          </div></div></div>
          </div> <!--end of row-->

        


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
    
    $('[data-toggle="tooltip"]').tooltip();   
  });
</script>



