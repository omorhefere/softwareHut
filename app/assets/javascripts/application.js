//= require jquery
//= require jquery_ujs
//= require ajax_setup
//= require ajax_modal
//= require bootstrap
//= require flash_message
//= require visibility_map
//= require modal
//= require select2
//= require select2_init

$(document).ready(function () {

  $('.dropdown-toggle').dropdown();

  $('#project').hide();
  $('#comments').hide();

  $('#one').click(function (e) {
    e.preventDefault();
    $('#project').tab('show');
    $('#comments').hide();
    $('#project').show();
  });

  $('#two').click(function (e) {
    e.preventDefault();
    $('#comment').tab('show');
    $('#project').hide();
    $('#comments').show();
  });

});
