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
    <section class="content">
        <div class="row" align="center">
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
                <?php foreach ($yearArray as $year) 
                {
                    // this allows you to select a particular year
                    $selected = ($year == $Startyear) ? 'selected' : '';
                    echo '<option '.$selected.' value="'.$year.'">'.$year.'</option>';
                }
                ?>
                </select>
                &nbsp;&nbsp;
                <button type="submit" id="submit" class="btn btn-primary btn-sm">Submit</button>
            </div>
        </div>
        <div class="row">
            <!-- small box -->
            <div class="small-box bg-red">
                <div class="inner">
                    <h3><?php echo $total_post ?></h3>
                    <p>Latest News</p>
                </div>
                <div class="icon">
                    <i class="ion ion-ios-book"></i>
                </div>
                <a href="<?php echo base_url('post/view') ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <div class="row">
            <!-- small box -->
            <div class="small-box bg-aqua">
                <div class="inner">
                    <h3><?php echo $total_consultation ?></h3>
                    <p>Total Consultations <?php echo $select_year ?></p>
                </div>
                <div class="icon">
                    <i class="ion ion-compose"></i>
                </div>
                <a href="<?php echo base_url('consultation/') ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <div class="row">
            <div class="small-box bg-yellow">
                <div class="inner">
                    <h3><?php echo $total_client; ?></h3>
                    <p>Total Clients Active</p>
                </div>
                <div class="icon">
                    <i class="ion ion-android-home"></i>
                </div>
                <a href="<?php echo base_url('client/') ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
    </section>
</form>


</div>  <!-- /.content-wrapper -->







