$(document).ready(function() {
    $('.eliminar').click(function(e) {
            if(!confirm("Desea eliminar")) {
                e.preventDefault();
            }
        }
    );
    $('#tabla').DataTable( {
        "pagingType": "simple",
        "searching": false,
        "pageLength": 10,
        "bLengthChange": false,
        "order": [[ 0, 'desc' ]],
        "language": {
            "paginate": {
                "previous": "Anterior",
                "next":"Siguiente",
                "fisrt":"Primero",
                "last":"Ultimo"
            }
        }
    } );
$('.datetimepicker').daterangepicker({
    "locale": {
        "format": "DD/MM/YYYY",
        "separator": " - ",
        "applyLabel": "Aceptar",
        "cancelLabel": "Cancelar",
        "fromLabel": "Desde",
        "toLabel": "Hasta",
        "customRangeLabel": "Custom",
        "daysOfWeek": [
            "Do",
            "Lu",
            "Ma",
            "Mi",
            "Ju",
            "Vi",
            "Sa"
        ],
        "monthNames": [
            "Enero",
            "Febrero",
            "Marzo",
            "Abril",
            "Mayo",
            "Junio",
            "Julio",
            "Agusto",
            "Septiembre",
            "Octubre",
            "Noviembre",
            "Diciembre"
        ],
        "firstDay": 1
    },


           singleDatePicker: true,
showDropdowns: true
}, function(start, end, label) {
  console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
});


} );


