<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fiche.aspx.cs" Inherits="WebApplication2.fiche" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Web Services | Fiches</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="Content/adminlte/components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="Content/mystyle.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="Content/adminlte/components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="Content/adminlte/components/Ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="Content/adminlte/components/select2/dist/css/select2.min.css">
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
          <a href="main" class="mainpage">
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
          <a href="fiche" class="ficheactive">
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
     <div class="row">
         <div class="col-md-12 col-lg-12 col-sm-12">
         <div id="alert"></div>
             </div>
         <div class="col-md-12 col-lg-12 col-sm-12">
          <div class="box box-info box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Liste des fiches</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="fichelist" class="table table-bordered table-striped">
                <thead class="btn-success">
                <tr>
                  <th>Civilité</th>
                  <th>Nom</th>
                  <th>Prénom</th>
                  <th>Date de naisssance</th>
                  <th>Département de naissance</th>
                  <th>Ville de naissance</th>
                  <th>Adresse complète(adresse, ville, code postal)</th>
                  <th>Supprimer</th>

                </tr>
                </thead>
                <tbody id="personnes">
                
                    </tbody>
                  </table>
            </div>
              <div class="box-footer clearfix no-border">
              <button type="button" class="btn btn-info pull-left" onclick="editpersonne(0)"><i class="fa fa-user-plus"></i>  Ajouter Fiche</button>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
     </div>
        
        
        <%-- ajout  modifier personne --%>
        <div class="modal fade" id="ajoutefiche">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span></button>
                <h4 class="modal-title" id="ajouttitre">Ajouter une fiche</h4>
              </div>
              <div class="modal-body">
                  <input type="hidden"  id="action" value=""/>
                  <input type="hidden"  id="idperson" value=""/>
                        <div class="form-group">
							  <label class="col-lg-5 col-md-6 col-sm-6">Civilité: </label>
                            <select name="civilite" class="form-control select2" style="width: 50%;" id="civilite">
                            </select>
						</div>
						<div class="form-group">
							  <label class="col-lg-5 col-md-6 col-sm-6">Nom: </label>
                            <input type="text" name="nom" placeholder="Nom" id="nom" class="form-control" style="width: 50%;">
						</div>
                       <div class="form-group">
							  <label class="col-lg-5 col-md-6 col-sm-6">Prénom: </label>
                           <input type="text" name="prenom" placeholder="Prénom" id="prenom" class="form-control" style="width: 50%;">
						</div>
						<div class="form-group">
							  <label class="col-lg-5 col-md-6 col-sm-6">Date de naissance: </label>
                            <input type="text" name="datenaissance" placeholder="YYYY-MM-DD" id="datenaissance"class="form-control" style="width: 50%;">
						</div>
                  <div class="form-group">
							  <label class="col-lg-5 col-md-6 col-sm-6">Département de naissance: </label>
                            <select name="departementnaissance" style="width: 50%;" class="form-control select2" id="departementnaissance" >
                            </select>
						</div>
                  <div class="form-group">
							  <label class="col-lg-5 col-md-6 col-sm-6">Ville de naissance: </label>
                            <select name="villenaissance" style="width: 50%;" class="form-control select2" id="villenaissance">
                            </select>
						</div>
                  <div class="form-group">
							  <label class="col-lg-5 col-md-6 col-sm-6">Adresse: </label>
                      <input type="text" name="adresse" placeholder="Adresse" id="adresse" class="form-control" style="width: 50%;">
						</div>
                  <div class="form-group">
							  <label class="col-lg-5 col-md-6 col-sm-6">Code Postal: </label>
                            <select name="codepostal" class="form-control select2" style="width: 50%;" required id="codepostal">
                            </select>
						</div>
                  <div class="form-group">
							  <label class="col-lg-5 col-md-6 col-sm-6">Ville: </label>
                            <select name="ville" class="form-control select2" style="width: 50%;" required id="ville">
                                
                            </select>
						</div>
              </div>
              <div class="modal-footer">
              	 <button type="submit" class="btn btn-info btn-sm pull-left" id="add-btn"></button>
                <button type="button" class="btn btn-default pull-right btn-sm" data-dismiss="modal">Fermer</button>

              </div>
            </div>
              <%-- end modal ajout --%>
                 
              </div>
            </div>

            <div class="modal fade" id="mapModal" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">x</button>
                    <h4 class="modal-title" id="modal-map-title"></h4>
                </div>
                <div class="modal-body">

                    <div id="map_canvas" style="width:auto; height: 500px;"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
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
<script src="Content/adminlte/components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="Content/adminlte/components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="Content/adminlte/components/select2/dist/js/select2.full.min.js"></script>
<script src="Scripts/fiche.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCpRFQAJ6xyFUffpRdchiVF1lkm_SM7m8E"></script>
</body>
</html>
