$(document).ready(function() {
    $('#tabla_personas').DataTable( {
        "pageLength": 10,
        "pagingType": "simple",
        "searching": true,
        "bLengthChange": false,
        "language": {
            "paginate": {
                "previous": "Anterior",
                "next":"Siguiente",
                "first":"Primero",
                "last":"Ultimo"
            }
        }
    } );



} );


