
//Affichage des fiches dans le tableau
var civilite;
$.ajax({
    url: "https://itescia-webservices.azurewebsites.net/api/Personnes/",
    method: "GET",
    async: false,
    contentType: "application/json",
    success: function (data) {
        var personne = '';
        $.each(data, function (i,item) {
            $.ajax({
                url: "https://itescia-webservices.azurewebsites.net/api/Civilites/" + item['id_civilite'],
                method: "GET",
                async: false,
                contentType: "application/json",
                success: function (data2) {
                    civilite = data2['libelle'];
                }
        });
        personne = personne + '<tr> ' +
            '<td>' + civilite + '</td>' +
            '<td><a href="#" onclick=editpersonne(' + item['id_personne'] + ');>' + item['nom'] + '</a></td>' +
            '<td><a href="#" onclick=editpersonne(' + item['id_personne'] + ');>' + item['prenom'] + '</a></td>' +
            '<td>' + item['date_naissance'].split('T')[0] + '</td>' +
            '<td>' + item['departement_naissance'] + '</td>' +
            '<td>' + item['ville_naissance'] + '</td>' +
            '<td>' + item['adresse'] + ' ' + item['code_postal'] + ' ' + item['ville'] + '<a href="#" onclick=checklocation(' + item['id_personne'] + ');><i class="fa fa-map-marker fa-2x pull-right"></i></a>' + '</td>' +
            '<td>' + '<button type="submit" class="btn btn-danger btn-sm pull-right" onclick="deleteperson(' + item['id_personne'] + ')"><i class="fa fa-trash"></i>  Supprimer</button>' + '</td>' +
            '</tr > ';
    });
        $('#personnes').html(personne);
    }
});
    
//ajout fiche
$("#add-btn").click(function () {

    //personne
    var person = {
        "id_personne": parseInt($('#idperson').val()),
        "nom": $("#nom").val(),
        "prenom": $("#prenom").val(),
        "date_naissance": $("#datenaissance").val(),
        "departement_naissance": parseInt($("#departementnaissance").val()),
        "ville_naissance": $("#villenaissance").val(),
        "adresse": $("#adresse").val(),
        "code_postal": parseInt($("#codepostal").val()),
        "ville": $("#ville").val(),
        "id_civilite": parseInt($("#civilite").val())
    };
//si on ajoute une fiche
    if ($('#action').val() == "ajout") {
        //ajax
        $.ajax({
            url: "https://itescia-webservices.azurewebsites.net/api/Personnes",
            method: "POST",
            data: JSON.stringify(person),
            contentType: "application/json",
            success: function () {
                $('#ajoutfiche').modal('hide');
                location.reload();
                var html = '<div class="alert alert-success alert-dismissible">' +
                    '<h5><i class="icon fa fa-check"></i> la Fiche ' + $("#nom").val() + ' ' + $("#prenom").val() + ' est bien ajoutée!</h5>' +
                    '</div >';
                $('#alert').html(html);
                $(".alert-dismissible").fadeTo(8000, 1.0).slideUp(500, function () {
                    $(".alert-dismissible").alert('close');

                });
            },
            error: function () {
                $('#ajoutfiche').modal('hide');
                var html = '<div class="alert alert-danger alert-dismissible">' +
                    '<h5><i class="icon fa fa-ban"></i> Il y a un problème lors de l\'enregistrement de la fiche!</h5>' +
                    '</div >';
                $('#alert').html(html);
                $(".alert-dismissible").fadeTo(8000, 1.0).slideUp(500, function () {
                    $(".alert-dismissible").alert('close');

                });
            }
        });
        //si on modifie une fiche
    } else {
        $.ajax({
            url: 'https://itescia-webservices.azurewebsites.net/api/Personnes/' + $('#idperson').val(),
            method: 'PUT',
            contentType: "application/json",
            data: JSON.stringify(person),
            success: function () {
                $('#ajoutfiche').modal('hide');
                location.reload();
                var html = '<div class="alert alert-success alert-dismissible">' +
                    '<h5><i class="icon fa fa-check"></i> la Fiche ' + $("#nom").val() + ' ' + $("#prenom").val()+ ' est bien modifiée!</h5>' +
                    '</div >';
                $('#alert').html(html);
                $(".alert-dismissible").fadeTo(8000, 1.0).slideUp(500, function () {
                    $(".alert-dismissible").alert('close');

                });
            },
            error: function () {
                $('#ajoutfiche').modal('hide');
                var html = '<div class="alert alert-danger alert-dismissible">' +
                    '<h5><i class="icon fa fa-ban"></i> Il y a un problème lors de la modification de la fiche!</h5>' +
                    '</div >';
                $('#alert').html(html);
                $(".alert-dismissible").fadeTo(8000, 1.0).slideUp(500, function () {
                    $(".alert-dismissible").alert('close');

                });
            }
        });
    }
});
    //departement de naissance, evenement 'onchange'
    $('#departementnaissance').change(function () {
        //ville de naissance
        $.ajax({
            url: "https://geo.api.gouv.fr/communes?codeDepartement=" + $('#departementnaissance').val() + "&fields=nom,codesPostaux&format=json",
            method: "GET",
            contentType: "application/json",
             success:function (data) {
                    $('#villenaissance').children().remove();
                    $('#codepostal').children().remove();
                    $.each(data, function (i, item) {
                        $('#villenaissance').append($('<option>', {

                            value: item['nom'],
                            text: item['nom']
                        }));
                        $('#codepostal').append($('<option>', {

                            value: item['codesPostaux'][0],
                            text: item['codesPostaux'][0]
                        }));
                    });
        }
            
        });
    });
    
//code postal, , evenement 'onchange'
$('#codepostal').change(function () {
    //ville de naissance
    $.ajax({
        url: "https://geo.api.gouv.fr/communes?codePostal=" + $('#codepostal').val() + "&fields=nom&format=json",
        method: "GET",
        contentType: "application/json",
        success: function (data) {
            $('#ville').children().remove();
            $.each(data, function (i, item) {
                $('#ville').append($('<option>', {
                    value: item['nom'],
                    text: item['nom']
                }));

            });
        }
    });
});
//function edit personne
function editpersonne(id) {

    $('#ajoutefiche').modal();
    if (id != 0) {
        $.ajax({
            url: "https://itescia-webservices.azurewebsites.net/api/Personnes/" + id,
            method: "GET",
            async: false,
            contentType: "application/json",
            success:function(data) {
                $("#idperson").val(data["id_personne"]);
                $("#action").val("modify");
                $("#nom").val(data["nom"]);
                $("#prenom").val(data["prenom"]);
                $("#datenaissance").val(data["date_naissance"].split('T')[0]);
                $("#adresse").val(data["adresse"]);
                $('#civilite').val(data["id_civilite"]);
                $('#civilite').change();
                $('#departementnaissance').val(data["departement_naissance"]);
                $('#departementnaissance').change();
                $('#villenaissance').val(data["ville_naissance"]);
                $('#villenaissance').change();
                $('#codepostal').val(data["code_postal"]);
                $('#codepostal').change();
                $('#ville').val(data["ville"]);
                $('#ville').change();
                $("#ajouttitre").html('Modifier ' + data["nom"] + ' ' + data["prenom"]);
                $("#add-btn").html('<i class="fa fa-pencil"></i> Modifier la fiche');
            }
        });
            
    } else {
        $("#idperson").val("0");
        $("#action").val("ajout");
        $("#nom").val('');
        $("#prenom").val('');
        $("#datenaissance").val('');
        $("#adresse").val('');
        $('#departementnaissance').change();
        $('#villenaissance').change();
        $('#codepostal').change();
        $("#ajouttitre").html('Ajouter une Persone');
        $("#add-btn").html('<i class="fa fa-user-plus"></i> Ajouter la fiche');
    }
}
//function localisation personne
function checklocation(id) {
    var adresse = "";
    $.ajax({
        url: "https://itescia-webservices.azurewebsites.net/api/Personnes/" + id,
        method: "GET",
        async: false,
        contentType: "application/json",
        success: function (data) {
            adresse = data['adresse'] + ' ' + data['code_postal'] + ' ' + data['ville'];
            $('#modal-map-title').html('Localisation de ' + data['nom'] + ' ' + data['prenom']);
        }
    });
        
    $('#mapModal').modal('show');
    
    initializeMap(adresse);

}

//delete peronne
function deleteperson(id) {
    $.ajax({
        url: "https://itescia-webservices.azurewebsites.net/api/Personnes/" + id,
        method: "DELETE",
        contentType: "application/json",
        success: function () {
            location.reload();
            var html = '<div class="alert alert-success alert-dismissible">' +
                '<h5><i class="icon fa fa-check"></i> la Fiche ' + $("#nom").val() + ' ' + $("#prenom").val() + ' est bien supprimée!</h5>' +
                '</div >';
            $('#alert').html(html);
            $(".alert-dismissible").fadeTo(8000, 1.0).slideUp(500, function () {
                $(".alert-dismissible").alert('close');

            });
        },
        error: function () {
            var html = '<div class="alert alert-danger alert-dismissible">' +
                '<h5><i class="icon fa fa-ban"></i> Il y a un problème lors de la modification de la fiche!</h5>' +
                '</div >';
            $('#alert').html(html);
            $(".alert-dismissible").fadeTo(8000, 1.0).slideUp(500, function () {
                $(".alert-dismissible").alert('close');

            });
        }
    });
        
}
//charger les civilites
$.ajax({
    url: "https://itescia-webservices.azurewebsites.net/api/Civilites/",
    method: "GET",
    contentType: "application/json",
    success: function (data) {
        $.each(data, function (i, item) {
            $('#civilite').append($('<option>', {

                value: item['id_civilite'],
                text: item['libelle']
            }));
            $('#civilite2').append($('<option>', {

                value: item['id_civilite'],
                text: item['libelle']
            }));
        });
    }
    });
    

//ajax departement
$.ajax({
    url: "https://geo.api.gouv.fr/departements?fields=nom,code",
    method: "GET",
    contentType: "application/json",
    success: function (data) {
        $.each(data, function (i, item) {
            $('#departementnaissance').append($('<option>', {

                value: item['code'],
                text: item['code'] + ' - ' + item['nom']
            }));
            $('#departementnaissance2').append($('<option>', {

                value: item['code'],
                text: item['code'] + ' - ' + item['nom']
            }));
        });

    }
})
    
//select2
$('.select2').select2()
//date picker
$('#datenaissance').datepicker({
    autoclose: true,
    format: 'yyyy-mm-dd',
    orientation: 'bottom right',
});
//fiche table
$('#fichelist').dataTable({
    'language': {
        "sProcessing": "Traitement en cours...",
        "sSearch": "Rechercher&nbsp;:",
        "sLengthMenu": "Afficher _MENU_ &eacute;l&eacute;ments",
        "sInfo": "Affichage de l'&eacute;l&eacute;ment _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
        "sInfoEmpty": "Affichage de l'&eacute;l&eacute;ment 0 &agrave; 0 sur 0 &eacute;l&eacute;ment",
        "sInfoFiltered": "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
        "sInfoPostFix": "",
        "sLoadingRecords": "Chargement en cours...",
        "sZeroRecords": "Aucun &eacute;l&eacute;ment &agrave; afficher",
        "sEmptyTable": "Aucune donn&eacute;e disponible dans le tableau",
        "oPaginate": {
            "sFirst": "Premier",
            "sPrevious": "Pr&eacute;c&eacute;dent",
            "sNext": "Suivant",
            "sLast": "Dernier"
        },
        "oAria": {
            "sSortAscending": ": activer pour trier la colonne par ordre croissant",
            "sSortDescending": ": activer pour trier la colonne par ordre d&eacute;croissant"
        },
        "select": {
            "rows": {
                _: "%d lignes séléctionnées",
                0: "Aucune ligne séléctionnée",
                1: "1 ligne séléctionnée"
            }
        }
    },
    'paging': true,
    'lengthChange': false,
    'searching': true,
    'ordering': true,
    'info': true,
    'autoWidth': false
});
//init map
function initializeMap(adresse) {
    var mapOptions = {
        center: new google.maps.LatLng(46.875390, 4.390674),
        zoom: 12,
        mapTypeControlOptions: {
            style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
            mapTypeIds: ['roadmap', 'terrain']
        }
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"),
        mapOptions);
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({ 'address': adresse }, function (results, status) {
        if (status == 'OK') {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            });
            marker.addListener('click', function () {
                new google.maps.InfoWindow({
                    content: "<b>Adresse: </b>" + adresse
                }).open(map, marker);
            });
        } else {
            alert('Geocode was not successful for the following reason: ' + status);
        }
    });
}
    $(".loader").fadeOut("slow");
