//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .
//= require bootstrap-datepicker
//= require jquery.inputmask
//= require jquery.inputmask.extensions
//= require jquery.inputmask.numeric.extensions
//= require jquery.inputmask.date.extensions
$(document).ready(function(){
$('.datepicker').datepicker({format: 'dd-mm-yyyy'});
$('#matricula').inputmask("9999999-99");
});.


