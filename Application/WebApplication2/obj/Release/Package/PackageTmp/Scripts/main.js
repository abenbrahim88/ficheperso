$(document).ready(function () {
    //ajax personne
    var personnes = [];
    $.ajax({
        url: "https://itescia-webservices.azurewebsites.net/api/Personnes/",
        method: "GET",
        async: false,
        headers: { "accept": "application/json" }
    })
        .done(function (data) {
            $.each(data, function (i, item) {

                $.ajax({
                    url: "https://itescia-webservices.azurewebsites.net/api/Civilites/" + item['id_civilite'],
                    method: "GET",
                    async: false,
                    headers: { "accept": "application/json" }
                })
                    .done(function (data2) {
                        item['id_civilite'] = data2['libelle'];

                    });
                personnes.push(item);

            });

        });

    function initializeMap(objet) {
        var mapOptions = {
            center: new google.maps.LatLng(46.875390, 4.390674),
            zoom: 6,
            mapTypeControlOptions: {
                style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
                mapTypeIds: ['roadmap', 'terrain']
            }
        };
        var map = new google.maps.Map(document.getElementById("map_canvas"),
            mapOptions);
        
        var geocoder = new google.maps.Geocoder();
        objet.forEach(function (item) {
            geocoder.geocode({ 'address': item['adresse'] + ' ' + item['code_postal'] + ' ' + item['ville'] }, function (results, status) {
                if (status == 'OK') {
                    var marker = new google.maps.Marker({
                        map: map,
                        position: results[0].geometry.location
                    });

                    marker.addListener('click', function () {
                        new google.maps.InfoWindow({
                            content: "<b>" + item['id_civilite'] + " " + item['nom'] + " " + item['prenom'] + "</b><br\>" +
                                "<b>Adresse: </b>" + item['adresse'] + ' ' + item['code_postal'] + ' ' + item['ville']
                        }).open(map, marker);
                    });
                } else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        })

    }
    initializeMap(personnes);

    
})
$(".loader").fadeOut("slow");