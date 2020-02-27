  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h3></h3>
        <ol class="breadcrumb">
          <li><a href="<?php echo base_url('documentation/presentation/') ?>"><i class="fa fa-folder"></i> BSJME</a></li>
          <li><a href="<?php echo base_url('dashboard') ?>"><i class="fa fa-dashboard"></i> Home</a></li>
          <li class="active">Dashboard</li>
        </ol>
    </section>



<!-----------------------------------------------------------  Main ------------------------------------------------------------------>

  <form role="form" action="<?php base_url('dashboard') ?>" method="post" enctype="multipart/form-data">
    <section class="content" >


    <div class="row">

      <div class="col-lg-2 col-xs-2">
        <div class="small-box bg-red">
          <div class="inner">
            <h2><?php echo $total_client_pending; ?></h2>
            <p>Pending Client</p>
          </div>
          <div class="icon">
            <i class="ion ion-ios-clock"></i>
          </div>
          <a href="<?php echo base_url('client/') ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>


      <div class="col-lg-2 col-xs-2">
        <div class="small-box bg-yellow">
          <div class="inner">
            <h2><?php echo $total_client; ?></h2>
            <p>Active Client</p>
          </div>
          <div class="icon">
            <i class="ion ion-android-home"></i>
          </div>
          <a href="<?php echo base_url('client/') ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>

      
      <div class="col-lg-2 col-xs-2">
        <div class="small-box bg-aqua">
          <div class="inner">
            <h2><?php echo $total_consultation ?></h2>
            <p>Consultations <?php echo $select_year ?></p>
          </div>
          <div class="icon">
            <i class="ion ion-compose"></i>
          </div>
          <a href="<?php echo base_url('consultation/') ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>
      

      <div class="col-lg-2 col-xs-2">
        <div class="small-box bg-blue">
          <div class="inner">
            <h2><?php echo $total_post ?></h2>
            <p>Latest News</p>
          </div>
          <div class="icon">
            <i class="ion ion-ios-book"></i>
          </div>
          <a href="<?php echo base_url('post/view') ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
        </div>
      </div>   

       <div class="col-md_4 col-xs-4" align="right">
        <div class="form-group">
          <label for="year">Year</label>
            <?php
            //get the current year
            $Startyear=date('Y');
            $endYear=$Startyear-10;

            // set start and end year range i.e the start year
            $yearArray = range($Startyear,$endYear);
            ?>
            <!-- here you displaying the dropdown list -->
            <select name="year">
                <?php foreach ($yearArray as $year) {
                    // this allows you to select a particular year
                    $selected = ($year == $Startyear) ? 'selected' : '';
                    echo '<option '.$selected.' value="'.$year.'">'.$year.'</option>';
                }?>
            </select>
            &nbsp;&nbsp;
            <button type="submit" id="submit" class="btn btn-primary">Submit</button>
          </div>
        </div>   

    </div>        <!-- /.row -->


 
  



<svg baseprofile="tiny" fill="#d4af37" height="397" stroke="#ffffff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" version="1.2" viewbox="0 0 1000 397" width="1000" xmlns="http://www.w3.org/2000/svg">

 <a xlink:title="Clarendon (<?php echo $total_consultation_parish_1370 ?>)" stroke="#ffffff"  stroke-width="2" fill="#d4af37"; >  
 <path d="M532.2 164.1l12.9 33 1.8 8.5-1.7 3.5-1.3 4.5-1 6.9 0.5 4.1 5.1 7.7 2.6 4.7 1.7 5.6 0.1 16.8 0.4 3.6 0.5 2.8 1.1 2.5 8.9 11.8 1.2 4.1-0.2 1.6 2.2 22.9-3.3 1.9-7.5 15-1.7 4.4 3.4 13.3-3.3 1.3-5.8 3.6-3.3 1.4 1.2 2.5 0.7 4.9 1.2 3-4.9-2.2-4.9-0.3-4.8 1.7-4.4 3.7 8 5 8.5 1.9 8.9-0.8 9.2-2.8 4.6 18.1-1.4 8.2-11.2 3.5-9.5-0.5-8.5-1.9-8.4-4.1-39.6-35.5-8.3-10.4-33.6-19.6 2.2-1.9 1.4-0.4 4 0.5 2.6-0.3 1.7-1.6 0.5-1.2 1-5.9 2.7-8.9 0.2-1.5-0.5-1.6-1-1.7-5.2-4.6-2.1-2.8-1.6-5-1-6.5-0.3-3.2 0.2-2.3 1.3-3.8 0.6-2.7-49.7-102.1-1.1-7.2 10.8 3.6 11.6 2 4.1-0.5 3.3-1.3 1.7-1 3.2-2.5 1.1-0.6 15.4-3.5 4.3 0.4 8.8 3.6 22.3 4.1 41.4 0.5z" id="1370" name="Clarendon"
 onmouseover="this.style['fill'] = '#c1c1c1'"  onmouseout="this.style['fill'] = '#d4af37'">
 </path>
</a>

<a xlink:title="Hanover (<?php echo $total_consultation_parish_1371 ?>)" stroke="#ffffff"  stroke-width="2" fill="#d4af37"; >  
 <path d="M171.9 38.8l0 4.5-0.3 1.5-3 10.8 0.8 1.7 1.6 1.9 7.4 6.2 1.9 3.6 0.7 3.5 1.3 3 5.1 9.6 2.3 5.2 2.6 2.2 6.4 3.3 2.2 2.2 1.2 1.5 5.8 11.7-38.3-2.2-10-1.9-25.1-14.6-4-1.1-4.2-0.6-56.7 0.3-2.6 0.6-17.1 20.3-2.3 1.8-2.3 0.5-2.5 0-24.6-3.6-4.1-0.4 0.7-3.5-0.6-14.5 0.8-4.1 3.5-5.7 0.4-3.7 1.6-1.9 7.1-0.5 4.5-3 3.6-5.6 4.7-3.8 7.6 2.5 4.7-13.6 14-13 16.3-5.4 11.7 9 6.8-8 7.3-0.2 8.4 3.2 10.4 2 29.5-3.6 9.9 0 4.9 1.9z" id="1371" name="Hanover"
 onmouseover="this.style['fill'] = '#c1c1c1'"  onmouseout="this.style['fill'] = '#d4af37'">
 </path>
</a>

<a xlink:title="Manchester (<?php echo $total_consultation_parish_1372 ?>)" stroke="#ffffff"  stroke-width="2" fill="#d4af37"; >  
 <path d="M404.2 159.3l1.1 7.2 49.7 102.1-0.6 2.7-1.3 3.8-0.2 2.3 0.3 3.2 1 6.5 1.6 5 2.1 2.8 5.2 4.6 1 1.7 0.5 1.6-0.2 1.5-2.7 8.9-1 5.9-0.5 1.2-1.7 1.6-2.6 0.3-4-0.5-1.4 0.4-2.2 1.9-0.5-0.3-10-3.7-10.7-1.5-8.4 3.5-9.7 6.6-9.6 0.8-20-5.7-8.7-1.5-1.1-2.2-31.1-129.5-2.3-43.1 5.8-1.4 2.8-1.1 5.1-3.1 3.3-1.5 2.6-0.7 2.6 0 17.5 2.7 1.4-0.1 6.5 2.9 20.4 14.2z" id="1372" name="Manchester"
onmouseover="this.style['fill'] = '#c1c1c1'"  onmouseout="this.style['fill'] = '#d4af37'">
 </path>
</a>

<a xlink:title="Saint Elizabeth (<?php echo $total_consultation_parish_1373 ?>)" stroke="#ffffff"  stroke-width="2" fill="#d4af37"; >  
 <path d="M336.2 147.4l2.3 43.1 31.1 129.5 1.1 2.2-10.8-1.9-61.9 3.6-3.1-0.6-9.5-6.5-16.1-8-4-3.2-2-3.6-4.7-12.3-1-3.9-1.7-3-8.2-3-2.5-2-0.7-10.1 0.8-12.1-2.8-10.2-11.6-4.3-31.7-0.3-7.3-2.7-3.8-8.8 3.2-6.2 9-26 1.1-7.2-1.1-3.6 0-2.8 0.8-3 2.9-6.1 5-8 3.6-3.4 6.9-3.4 52.3-18.7 64.4 6.5z" id="1373" name="Saint Elizabeth"
 onmouseover="this.style['fill'] = '#c1c1c1'"  onmouseout="this.style['fill'] = '#d4af37'">
 </path>
</a>

<a xlink:title="Saint James (<?php echo $total_consultation_parish_1374 ?>)" stroke="#ffffff"  stroke-width="2" fill="#d4af37"; >  
 <path d="M292.7 9.9l-0.2 0.8-20.7 130.2-52.3 18.7 4.4-12.7 0.2-4.6-3.7-11.6-1.3-2.4-1.5-1.8-2.1-1.3-2.6-3.2-5-10.8-5.8-11.7-1.2-1.5-2.2-2.2-6.4-3.3-2.6-2.2-2.3-5.2-5.1-9.6-1.3-3-0.7-3.5-1.9-3.6-7.4-6.2-1.6-1.9-0.8-1.7 3-10.8 0.3-1.5 0-4.5 3.6 1.3 5 1.2 5.2-0.8 4.6-3.3 0.5-3.1-0.2-3.7 2.9-5 10.3-13.3 4.7-4.4 8.1-3.7 18.4-3 20.9 0.8 36.8 8.1z" id="1374" name="Saint James"
 onmouseover="this.style['fill'] = '#c1c1c1'"  onmouseout="this.style['fill'] = '#d4af37'">
 </path>
</a>

<a xlink:title="Trelawny (<?php echo $total_consultation_parish_1375 ?>)" stroke="#ffffff"  stroke-width="2" fill="#d4af37"; >  
 <path d="M416 24.6l-1.1 10.6 0.3 3.9 5.3 13.7 0.3 3.4-0.3 2.8-1.2 3.1 0 1.7 0.6 1.3 2.4 3.1 0 4.5-18.1 86.6-20.4-14.2-6.5-2.9-1.4 0.1-17.5-2.7-2.6 0-2.6 0.7-3.3 1.5-5.1 3.1-2.8 1.1-5.8 1.4-64.4-6.5 20.7-130.2 0.2-0.8 32.4 7.1 44.4 0.8 19.6 4.8 26.9 2z" id="1375" name="Trelawny"
 onmouseover="this.style['fill'] = '#c1c1c1'"  onmouseout="this.style['fill'] = '#d4af37'">
 </path>
</a>

<a xlink:title="Westmoreland (<?php echo $total_consultation_parish_1376 ?>)" stroke="#ffffff"  stroke-width="2" fill="#d4af37"; >  
 <path d="M207.9 111.2l5 10.8 2.6 3.2 2.1 1.3 1.5 1.8 1.3 2.4 3.7 11.6-0.2 4.6-4.4 12.7-6.9 3.4-3.6 3.4-5 8-2.9 6.1-0.8 3 0 2.8 1.1 3.6-1.1 7.2-9 26-3.2 6.2-7-16.3-3.6-5.2-3.9-2.8-4.5-2.3-3.7-0.9-2.8-2.6-2.2-5.8-2.8-11.4-8.6-17.4-11.3-6.4-33.6 0.9-20.5-3.5-7.5-0.1-4.3 3.9-3.5 2-3.1-0.7-11.3-4.5-1.1-0.7-6.4-1-14-4.6-7.9-1-8-2-7.8-5.2-5.7-7.4-2-8.4 2.5-4 6.8-4.8 3.2-4 0.6-2.8 4.1 0.4 24.6 3.6 2.5 0 2.3-0.5 2.3-1.8 17.1-20.3 2.6-0.6 56.7-0.3 4.2 0.6 4 1.1 25.1 14.6 10 1.9 38.3 2.2z" id="1376" name="Westmoreland"
 onmouseover="this.style['fill'] = '#c1c1c1'"  onmouseout="this.style['fill'] = '#d4af37'">
 </path>
</a>

<a xlink:title="Kingston (<?php echo $total_consultation_parish_1377 ?>)" stroke="#ffffff"  stroke-width="2" fill="#d4af37"; >  
 <path d="M753 275.8l-3.4-3.3-5.9-1.4-13.8-0.2-9.4 0.2-6.5-3.9 1.5-4.4 0.8-1.8 3.5-2.3 4.6-1.9 3.8-1 11.8-0.6 6.8 1.6 4.5 2.4 3.8 8.9 0.4 6.2-2.5 1.5z" id="1377" name="Kingston"  onclick="readCounty('1377')"
 onmouseover="this.style['fill'] = '#c1c1c1'"  onmouseout="this.style['fill'] = '#d4af37'">
 </path>
</a>

<a xlink:title="Portland (<?php echo $total_consultation_parish_1378 ?>)" stroke="#ffffff"  stroke-width="2" fill="#d4af37"; >  
 <path d="M967.6 255.3l-13 4.1-4.8 0.5-16.6-2.2-6.2-1.6-3.1-2.8-3-4.4-1.6-1.6-2.4-1-13.5-4-14.9-2.4-10.1-5.8-2.2-0.6-1.9-0.1-2.3 1-3.1 1.7-3.9 0.7-6.4 0.1-1.9 0.2-2 1.3-2 2-1.8 1.1-3.7 1.4-3.8 0-3.2-1.8-21.7-6.9-3.4-1.6-3-2.1-1.8-1.7-3.5-4.7-8.5-5.9-20.6-8.6-6-0.9-1.5 1.8-2 3.8-2.2 0.9-4.5 0.9-6-1.3-2.9-0.9-1.7-1-2-2.9-4.1-12.1-0.1-1.2-2.9-9.7 21.5-60.1 1.4-1.6 2.6 0.6 6.7 3.6 8.7 8.8 6.7 4.4 7.7 2.4 15.2-1 7.9 5.7 2.5 0.6 2.3 2.2 2.8 2 3.8 0.9 34.2 0 2.4 1.4 3.6 6.9 1.7 2.1 33.6 6.4 17.4 6.3 2.3 10 12.9 12.5 10.1 14.4 14.6 32.1 3.2 7.7z" id="1378" name="Portland"
 onmouseover="this.style['fill'] = '#c1c1c1'"  onmouseout="this.style['fill'] = '#d4af37'">
 </path>
</a>

<a xlink:title="Saint Ann (<?php echo $total_consultation_parish_1379 ?>)" stroke="#ffffff"  stroke-width="2" fill="#d4af37"; >  
 <path d="M596.3 54.8l0.4 2.2 3.9 17.6 0.3 2.5 0.9 3.4 0.9 1.7 2.4 2.4 1.3 1.7 0.8 1.8-1 10.8 0.2 1.5 0.9 1.7 5.7 6.8 1.9 3 1.4 4.5 0.7 4.1 1.3 3.9 3 4 8.7 8.9-27.4 15.5-9.2 3.6-61.2 7.7-41.4-0.5-22.3-4.1-8.8-3.6-4.3-0.4-15.4 3.5-1.1 0.6-3.2 2.5-1.7 1-3.3 1.3-4.1 0.5-11.6-2-10.8-3.6 18.1-86.6 0-4.5-2.4-3.1-0.6-1.3 0-1.7 1.2-3.1 0.3-2.8-0.3-3.4-5.3-13.7-0.3-3.9 1.1-10.6 4.7 0.4 12 2.9 9.4 5.7 14.4-3.7 23.4 0 24.1 2.8 16.5 4.2 2.1 2.2 1.7 5.9 2.2 2.1 2.7 0 2.4-1.2 1.5-1.5-0.4-0.9 20.4 3.6 2.5 1.5 7.7 6.8 2.4 1.5 14.9 0.6 15.7-2.7z" id="1379" name="Saint Ann"
 onmouseover="this.style['fill'] = '#c1c1c1'"  onmouseout="this.style['fill'] = '#d4af37'">
</a>

<a xlink:title="Saint Catherine (<?php echo $total_consultation_parish_1380 ?>)" stroke="#ffffff"  stroke-width="2" fill="#d4af37"; >  
 <path d="M686.4 182.3l-1 12.6 0.9 4.9 3 6.3 0.5 2.4-0.1 1.8-1.6 3.5-1.3 1.9-1.8 1.5-1.4 2.5-1.6 4.1-2.7 9.7-0.6 4.1 0.1 2.8 3.3 2.9 0.8 1.3 0.9 2.2 1.4 1.7 1.1 0.5 2.4-0.3 3.6-1.3 3.1 4.3 1.5 5.6-1.4 4.9-2.2 5.1-5.7 6.4-1.7 3.7-6-0.7-1.8 3.5-1.8 11-8.1 29-6.1 8.6-7.3 4.7-6 0-4-1.8-3.7-2.5-5-2-25.2 0 0-3.5 9.6-3.3-4.9-4.3-6.1-8.4-4.8-3.7-5.6-2.2-13.2-1.4-11.9 4.2-7 4.1-2.2-22.9 0.2-1.6-1.2-4.1-8.9-11.8-1.1-2.5-0.5-2.8-0.4-3.6-0.1-16.8-1.7-5.6-2.6-4.7-5.1-7.7-0.5-4.1 1-6.9 1.3-4.5 1.7-3.5-1.8-8.5-12.9-33 61.2-7.7 9.2-3.6 27.4-15.5 7-2.1 2.8-0.4 8.7 1 1.5 1.1 1.4 1.7 2.7 6.6 1.6 2.1 3.6 2.7 1.9 2.1 1.8 3.7 1 3.9 0.5 4.1 1 2.1 5.3 7.3 4.9 4.7 10.7 4.4z" id="1380" name="Saint Catherine"
 onmouseover="this.style['fill'] = '#c1c1c1'"  onmouseout="this.style['fill'] = '#d4af37'">
 </path>
</a>

<a xlink:title="Saint Mary (<?php echo $total_consultation_parish_1381 ?>)" stroke="#ffffff"  stroke-width="2" fill="#d4af37"; >  
 <path d="M764.7 125.3l-1.4 1.6-21.5 60.1-25.3-12.1-7.6-1.5-2.7 0.5-5.8 0.1-2.8 0.4-1.7 0.8-1.1 2.4-2.2 2.2-6.2 2.5-10.7-4.4-4.9-4.7-5.3-7.3-1-2.1-0.5-4.1-1-3.9-1.8-3.7-1.9-2.1-3.6-2.7-1.6-2.1-2.7-6.6-1.4-1.7-1.5-1.1-8.7-1-2.8 0.4-7 2.1-8.7-8.9-3-4-1.3-3.9-0.7-4.1-1.4-4.5-1.9-3-5.7-6.8-0.9-1.7-0.2-1.5 1-10.8-0.8-1.8-1.3-1.7-2.4-2.4-0.9-1.7-0.9-3.4-0.3-2.5-3.9-17.6-0.4-2.2 8.4-1.4 5.4 1.4 9.6 4.5 5.4 0.9 27-1.1 5.2-2.8 7.5-0.9 6 0.4 5.6 1 3.2 4.2-1.4 5.1 0 6.5 5.1 4.6 16.2 10.3 14.4 8.4 2.3 4.7 4.2 12.6 2.7 4.2 4.4 2.6 8.3 2.3 23.6 1.9 5.3 1.1z" id="1381" name="Saint Mary"
 onmouseover="this.style['fill'] = '#c1c1c1'"  onmouseout="this.style['fill'] = '#d4af37'">
 </path>
</a>

<a xlink:title="Saint Andrew (<?php echo $total_consultation_parish_1382 ?>)" stroke="#ffffff"  stroke-width="2" fill="#d4af37"; >  
 <path d="M741.8 187l2.9 9.7 0.1 1.2 4.1 12.1 2 2.9 1.7 1 2.9 0.9 6 1.3 4.5-0.9 2.2-0.9 2-3.8 1.5-1.8 6 0.9 20.6 8.6-4.2 3.9-0.8 3-0.6 3.9-0.2 7.3 0.6 2.9 1.1 2.7 1.2 2.2 2.6 9 0.8 1.6 3.3 4.7 1.4 2.7 0 1.6-0.7 1-1.2 0.2-4.6-0.4-1.8 0.4-1.8 0.8-2 3.1-0.5 2.8 0.3 4.4-0.7 3.7-2.9 3.3-2.7 4.3-12.7-3-3.4-1.9-7-2.9-9.5 0.6-16.5 3.9-7 0.9-23.9-0.9 0-3.3 50.2-2.9-2.1-2 2.5-1.5-0.4-6.2-3.8-8.9-4.5-2.4-6.8-1.6-11.8 0.6-3.8 1-4.6 1.9-3.5 2.3-0.8 1.8-1.5 4.4-3-1.8-8.1-5.3-6-2.8-1.5-5.6-3.1-4.3-3.6 1.3-2.4 0.3-1.1-0.5-1.4-1.7-0.9-2.2-0.8-1.3-3.3-2.9-0.1-2.8 0.6-4.1 2.7-9.7 1.6-4.1 1.4-2.5 1.8-1.5 1.3-1.9 1.6-3.5 0.1-1.8-0.5-2.4-3-6.3-0.9-4.9 1-12.6 6.2-2.5 2.2-2.2 1.1-2.4 1.7-0.8 2.8-0.4 5.8-0.1 2.7-0.5 7.6 1.5 25.3 12.1z" id="1382" name="Saint Andrew"
onmouseover="this.style['fill'] = '#c1c1c1'"  onmouseout="this.style['fill'] = '#d4af37'">
 </path>
</a>

<a xlink:title="Saint Thomas (<?php echo $total_consultation_parish_1383 ?>)" stroke="#ffffff"  stroke-width="2" fill="#d4af37"; >  
 <path d="M967.6 255.3l3.7 8.9 6.7 11.5 8.6 9.1 12.4 9.4-4.8 3.8-23.5 6-16.7 9.2-9.5 2.7-8.1-2.1 3.2-2.3 1.2-1.6 1.8-5.9-8.2 3-7.3 11-8 2.4-7.1-2-8.2-3.9-8.4-2.1-13.7 5.1-35.9 3.2-25.3-3.9-3.6 0.1-3.5 0.7-3.7-0.5-4.7-3.3-2.1-4.3-0.9-5.6-1.4-4.7-3.6-2.1-3.7-1.1-2.4-2.7-2.1-3.2-2.8-2.5-1.1-0.3 2.7-4.3 2.9-3.3 0.7-3.7-0.3-4.4 0.5-2.8 2-3.1 1.8-0.8 1.8-0.4 4.6 0.4 1.2-0.2 0.7-1 0-1.6-1.4-2.7-3.3-4.7-0.8-1.6-2.6-9-1.2-2.2-1.1-2.7-0.6-2.9 0.2-7.3 0.6-3.9 0.8-3 4.2-3.9 8.5 5.9 3.5 4.7 1.8 1.7 3 2.1 3.4 1.6 21.7 6.9 3.2 1.8 3.8 0 3.7-1.4 1.8-1.1 2-2 2-1.3 1.9-0.2 6.4-0.1 3.9-0.7 3.1-1.7 2.3-1 1.9 0.1 2.2 0.6 10.1 5.8 14.9 2.4 13.5 4 2.4 1 1.6 1.6 3 4.4 3.1 2.8 6.2 1.6 16.6 2.2 4.8-0.5 13-4.1z" id="1383" name="Saint Thomas"
 onmouseover="this.style['fill'] = '#c1c1c1'"  onmouseout="this.style['fill'] = '#d4af37'">
 </path>
</a>

 <circle cx="47.4" cy="95.9" id="0">
 </circle>
 <circle cx="864.2" cy="285.6" id="1">
 </circle>
 <circle cx="453.4" cy="29.1" id="2">
 </circle>
</svg>



        </div>



    </section>    <!-- /.content -->
  </div>  <!-- /.content-wrapper -->
</form>

  <!-----------------------------------------------------------  Javascript ------------------------------------------------------------------>

  <script type="text/javascript">
    $(document).ready(function() {
      $("#dashboardMainMenu").addClass('active');
    });



function readCounty(county_code)
{
   alert ('Information to bring on click ...');

  /*  To develop for listing the of the consultation by County
  manageTableConsultation = $('#manageTableConsultation').DataTable({
    'ajax': base_url+'dashboard/fetchConsultationCounty/' + county_code,    
    'order': [[0, "asc"]],
    'searching': false,
    'paging': false,
    'info': false,
    'bDestroy': true
  });
*/



}
  </script>






