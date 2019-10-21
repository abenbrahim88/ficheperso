<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="WebApplication2.main" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Web Services | Map des Fiches</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="Content/adminlte/components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="Content/mystyle.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="Content/adminlte/components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="Content/adminlte/components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="Content/adminlte/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="Content/adminlte/css/skins/_all-skins.min.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="Content/adminlte/components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <div class="loader" ></div>
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="main" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><i class="fa fa-cloud" aria-hidden="true"></i></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b><i class="fa fa-cloud-download" aria-hidden="true"></i>&nbsp;Web Services</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">NAVIGATION</li>
          <br>
              <li>
          <a href="main" class="mainpageactive">
            <i class="fa fa-map"></i> <span>Map des fiches</span>
          </a>
        </li>
              <br>
              <li>
          <a href="civilite" class="civilite">
            <i class="fa fa-venus-mars"></i> <span>Civilités</span>
          </a>
        </li>
              <br>
              <li>
          <a href="fiche" class="fiche">
            <i class="fa fa-file"></i> <span>Fiches</span>
          </a>
        </li>
          </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    
    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
        
          <div class="row">
              <div class="col-md-12 col-lg-12 col-sm-12">
              <div class="box box-info box-solid">
            <div class="box-header with-border">
              <h3 class="box-title"><i class="fa fa-map"></i> Map des fiches</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div id="map_canvas" style="width:auto; height: 500px;"></div>
            </div>
            <!-- /.box-body -->
          </div>
                  </div>
          </div>
      

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
    <footer class="main-footer">
        Projet Web services, Master M2I, Itescia, <strong>Ahmed BEN BRAHIM et Virgil Doerr</strong>
    </footer>

  <!-- Control Sidebar -->
 
    <!-- Create the tabs -->
   
    <!-- Tab panes -->
    
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="Content/adminlte/components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="Content/adminlte/components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="Content/adminlte/components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- datepicker -->
<script src="Content/adminlte/components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- AdminLTE App -->
<script src="Content/adminlte/js/adminlte.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCpRFQAJ6xyFUffpRdchiVF1lkm_SM7m8E"></script>
    <script src="Scripts/main.js"></script>
</body>
</html>
