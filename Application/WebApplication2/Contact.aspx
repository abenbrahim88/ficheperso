<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication2.Contact" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>M2I | Web Services</title>
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
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="WebForm1" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>W</b>S</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Web Services</span>
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
    <section class="sidebar">-->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">NAVIGATION</li>
          <li class="treeview">
          <a href="#">
            <i class="fa fa-venus-mars"></i> <span>Civilite</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
        <li>
          <a href="createcivilite">
            <i class="fa fa-plus"></i> <span>Creer une Civilite</span>
            
          </a>
        </li>
          <li>
          <a href="modifycivilite">
            <i class="fa fa-pencil"></i> <span>Modifier une Civilite</span>
            
          </a>
        </li>
          <li>
          <a href="removecivilite">
            <i class="fa fa-ban"></i> <span>Supprimer une Civilite</span>
            
          </a>
        </li>
          <li>
          <a href="checkcivilite">
            <i class="fa fa-search"></i> <span>Consulter Civilite(s)</span>
            
          </a>
        </li>
               </ul>
        </li>
          <li class="treeview">
          <a href="#">
            <i class="fa fa-user"></i> <span>Personne</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
        <li>
          <a href="pages/widgets.html">
            <i class="fa fa-user-plus"></i> <span>Creer une Peronne</span>
            
          </a>
        </li>
          <li>
          <a href="pages/widgets.html">
            <i class="fa fa-pencil-square-o"></i> <span>Modifier une Peronne</span>
            
          </a>
        </li>
          <li>
          <a href="pages/widgets.html">
            <i class="fa fa-user-times"></i> <span>Supprimer une Peronne</span>
            
          </a>
        </li>
          <li>
          <a href="pages/widgets.html">
            <i class="fa fa-address-card"></i> <span>Consulter  Peronne(s)</span>
            
          </a>
        </li>
              
      </ul>
              <br>
              <li>
          <a href="fiche" class="fiche">
            <i class="fa fa-play"></i> <span>Fiche</span>
          </a>
        </li>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    
    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
        
          <div class="row">
              <%--<script type="text/javascript">
          var postal_code;
          var url_api = "https://geo.api.gouv.fr/communes?codePostal=" + postal_code + "&fields=nom&format=json&geometry=centre";
            
          $.getJSON(url_api, function (data) {
          })
      </script>--%>
      <div>
          <form id="form" runat="server">
           <div class="form-group col-lg-2 col-md-3 col-sm-5">
          <asp:Label ID="Label1" runat="server" Text="Label">addresse</asp:Label>
           <asp:TextBox ID="addresse" class="form-control" runat="server"></asp:TextBox>
          <asp:Label ID="Label2" runat="server" Text="Label">Code Postale</asp:Label><asp:TextBox class="form-control" ID="codepostale" runat="server"></asp:TextBox><br/>
               <asp:ListBox ID="villelist" runat="server" class="form-control"></asp:ListBox>
          <asp:Button class="btn btn-primary" ID="valider" runat="server" Text="Valider" OnClick="valider_Click" />
               <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
      </div>
        </form>
              </div>
    <div id="map"></div>
    <script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: {lat: -33, lng: 151},
          zoomControl: false,
          scaleControl: true
          });
          var iconBase = 'http://maps.google.com/mapfiles/ms/icons/';
          var icons = {
          markerred: {
            icon: iconBase + 'red-pushpin.png'
          },
          markergreen: {
            icon: iconBase + 'grn-pushpin.png'
          },
          markerblue: {
            icon: iconBase + 'ltblu-pushpin.png'
          }
          };
          var features = [
              {
                  position: new google.maps.LatLng(49.168068, 2.196242),
                  type: 'markerred'
              }, {
                  position: new google.maps.LatLng(49.048829, 2.768103),
                  type: 'markergreen'
              }, {
                  position: new google.maps.LatLng(48.861721, 1.602695),
                  type: 'markerblue'
              }];
          features.forEach(function(feature) {
          var marker = new google.maps.Marker({
            position: feature.position,
            icon: icons[feature.type].icon,
            map: map
          });
        });
		var geocoder = new google.maps.Geocoder();
          var contentString;

        var infowindow = new google.maps.InfoWindow({
          content: contentString
        });
		var address;
		geocoder.geocode( { 'address': address}, function(results, status) {
		  if (status == 'OK') {
			map.setCenter(results[0].geometry.location);
			var marker = new google.maps.Marker({
				map: map,
                position: results[0].geometry.location,
                 icon: {
                        url: "http://maps.google.com/mapfiles/ms/icons/blue-dot.png"
                    }
              });
              marker.addListener('click', function() {
          infowindow.open(map, marker);
        });
		  } else {
			alert('Geocode was not successful for the following reason: ' + status);
		  }
		});

		
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAbxowJqgHXMQb9ksJJVD9l-X4O_WdWIFA&callback=initMap"
    async defer></script>
      <script src="Scripts/bootstrap.min.js"></script>
          </div>

      

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <strong>Projet Web services, Master M2I, Itescia</strong>
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
</body>
</html>
