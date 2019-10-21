
$(document).ready(function () {
    //ajax civilite

    $.ajax({
        url: "https://itescia-webservices.azurewebsites.net/api/Civilites/"
        , method: "GET"
        , headers: { "accept": "application/json" }
    })
        .done(function (data) {
            $('#oldlib').children().remove();
            $('#seldellib').children().remove();
            $.each(data, function (i, item) {
                $('#seldellib').append($('<option>', {

                    value: item['id_civilite'],
                    text: item['libelle']
                }));
                $('#oldlib').append($('<option>', {

                    value: item['id_civilite'],
                    text: item['libelle']
                }));

            });
        });

    //select
    $('.select2').select2({
        placeholder: {
            id: '-1',
            text: 'Selectionner une option'
        }
    }
    );


    // Ajout un libelle
    $('#ajout-btn').click(function () {
        $(".loader").fadeIn("slow");
        var libelle = $('#lib').val();
        if (libelle == '') {
            //erreur si l'utilisateur ne donne pas un libelle
            var html = '<div class="alert alert-danger alert-dismissible">' +
                '<h5><i class="icon fa fa-warning"></i> Veuillez saisir un libellé!</h5>' +
                '</div >';
            $('#alert1').html(html);
            $(".alert-dismissible").fadeTo(8000, 1.0).slideUp(500, function () {
                $(".alert-dismissible").alert('close');
            });
        } else {
            var civ = {
                "id_civilite": 0,
                "libelle": libelle
            };
            $.ajax({
                url: "https://itescia-webservices.azurewebsites.net/api/Civilites",
                method: "POST",
                data: JSON.stringify(civ),
                contentType: "application/json",
                success: function (data) {
                    $('#oldlib').append($('<option>', {

                        value: data['id_civilite'],
                        text: data['libelle']
                    }));
                    $('#seldellib').append($('<option>', {

                        value: data['id_civilite'],
                        text: data['libelle']
                    }));
                    var html = '<div class="alert alert-success alert-dismissible">' +
                        '<h5><i class="icon fa fa-check"></i> la civilité ' + libelle + ' est bien enregistrée!</h5>' +
                        '</div >';
                    $('#alert1').html(html);
                    $(".alert-dismissible").fadeTo(8000, 1.0).slideUp(500, function () {
                        $(".alert-dismissible").alert('close');

                    });
                },
                error: function () {
                    var html = '<div class="alert alert-danger alert-dismissible">' +
                        '<h5><i class="icon fa fa-warning"></i> Il y a problème lors de l\'enregistrement de la civilité!</h5>' +
                        '</div >';
                    $('#alert1').html(html);
                    $(".alert-dismissible").fadeTo(8000, 1.0).slideUp(500, function () {
                        $(".alert-dismissible").alert('close');
                    });

                }
            });
        }
        $(".loader").fadeOut("slow");
    });


    // Modifier un libelle
    $('#mod-btn').click(function () {
        $(".loader").fadeIn("slow");
        var libelle = $('#newlib').val();
        var id = $('#oldlib').val();
        if (libelle == '') {
            //erreur si l'utilisateur ne donne pas un libelle
            var html = '<div class="alert alert-danger alert-dismissible">' +
                '<h5><i class="icon fa fa-warning"></i> Veuillez saisir le nouveau libellé!</h5>' +
                '</div >';
            $('#alert2').html(html);
            $(".alert-dismissible").fadeTo(8000, 1.0).slideUp(500, function () {
                $(".alert-dismissible").alert('close');
            });
        } else {
            var civ = {
                "id_civilite": id,
                "libelle": libelle
            };
            $.ajax({
                url: "https://itescia-webservices.azurewebsites.net/api/Civilites/" + id,
                method: "PUT",
                contentType: "application/json",
                data: JSON.stringify(civ),
                success: function () {
                    $("#seldellib option[value='" + id + "']").remove();
                    $("#oldlib option[value='" + id + "']").remove();
                    $('#seldellib').append($('<option>', {

                        value: id,
                        text: libelle
                    }));
                    $('#oldlib').append($('<option>', {

                        value: id,
                        text: libelle
                    }));
                    var html = '<div class="alert alert-success alert-dismissible">' +
                        '<h5><i class="icon fa fa-check"></i> la civilité ' + libelle + ' est bien modifiée!</h5>' +
                        '</div >';
                    $('#alert2').html(html);
                    $(".alert-dismissible").fadeTo(8000, 1.0).slideUp(500, function () {
                        $(".alert-dismissible").alert('close');
                    });
                },
                error: function () {
                    var html = '<div class="alert alert-danger alert-dismissible">' +
                        '<h5><i class="icon fa fa-warning"></i> Il y a problème lors de la modification de la civilité!</h5>' +
                        '</div >';
                    $('#alert2').html(html);
                    $(".alert-dismissible").fadeTo(8000, 1.0).slideUp(500, function () {
                        $(".alert-dismissible").alert('close');
                    });

                }
            });
            
        }
        $(".loader").fadeOut("slow");
    });


    // Supprimer un libelle
    $('#del-btn').click(function () {
        $(".loader").fadeIn("slow");
        var id = $("#seldellib").val();
        $.ajax({
            url: "https://itescia-webservices.azurewebsites.net/api/Civilites/" + id,
            method: "DELETE",
            headers: { "accept": "application/json" },

            success: function (data) {
                $("#seldellib option[value='" + data['id_civilite'] + "']").remove();
                $("#oldlib option[value='" + data['id_civilite'] + "']").remove();
                var html = '<div class="alert alert-success alert-dismissible">' +
                    '<h5><i class="icon fa fa-check"></i> la civilité ' + data["libelle"] + ' est bien supprimée!</h5>' +
                    '</div >';
                $('#alert4').html(html);
                $(".alert-dismissible").fadeTo(8000, 1.0).slideUp(500, function () {
                    $(".alert-dismissible").alert('close');

                });
            },
            error: function () {
                var html = '<div class="alert alert-danger alert-dismissible">' +
                    '<h5><i class="icon fa fa-warning"></i> Il y a problème lors de la suppression de la civilité!</h5>' +
                    '</div >';
                $('#alert4').html(html);
                $(".alert-dismissible").fadeTo(8000, 1.0).slideUp(500, function () {
                    $(".alert-dismissible").alert('close');
                });

            }


        });
            
        $(".loader").fadeOut("slow");
    });

    //  Consulter un libelle
    $('#consult-btn').click(function () {
        $(".loader").fadeIn("slow");
        var checkbox = $('#all-civ').is(':checked'); 
        var idlibelle = $('#id-civ').val();
        if (idlibelle == '' && !checkbox) {
            //erreur si l'utilisateur ne donne pas un id libelle
            var html = '<div class="alert alert-danger alert-dismissible">' +
                '<h5><i class="icon fa fa-warning"></i> Veuillez saisir un Id ou cochez la case!</h5>' +
                '</div >';
            $('#alert3').html(html);
            $(".alert-dismissible").fadeTo(8000, 1.0).slideUp(500, function () {
                $(".alert-dismissible").alert('close');
            });
        } else {
            var result = '<table class="table table-bordered">' +
                '<thead class="btn-info">' +
                '<tr>' +
                '<th scope="col">Id</th>' +
                '<th scope="col">Libellé</th>' +
                '</tr>' +
                '</thead >' +
                '<tbody>';
            var lien = "";
            if (checkbox) {
                lien = "https://itescia-webservices.azurewebsites.net/api/Civilites";
            } else {
                lien = "https://itescia-webservices.azurewebsites.net/api/Civilites/" + idlibelle;
                };
            $.ajax({
                url: lien,
                method: "GET",
                async: false,
                contentType: "application/json",
                success: function (data) {
                    if (checkbox) {
                        $.each(data, function (i, item) {
                            result = result + '<tr>' +
                                '<td>' + item["id_civilite"] + '</td>' +
                                '<td>' + item["libelle"] + '</td>' +
                                '</tr>';
                        });
                    } else {
                        result = result + '<tr>' +
                            '<td>' + data["id_civilite"] + '</td>' +
                            '<td>' + data["libelle"] + '</td>' +
                            '</tr>';
                    }
                    result = result +
                        '</tbody >' +
                        '</table >';
                    $('#result').html(result);

                },
                error: function () {
                    var html = '<div class="alert alert-danger alert-dismissible">' +
                        '<h5><i class="icon fa fa-warning"></i>l\'Id saisi ne correspond à aucune civilité!</h5>' +
                        '</div >';
                    $('#alert3').html(html);
                    $(".alert-dismissible").fadeTo(8000, 1.0).slideUp(500, function () {
                        $(".alert-dismissible").alert('close');
                    });

                }

            });
        }
        $(".loader").fadeOut("slow");
    });

    $(".loader").fadeOut("slow");
})
