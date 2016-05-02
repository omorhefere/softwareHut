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

$('#myTabs a:first').click(function (e) {
  e.preventDefault();
  $(this).tab('show');
})

$('#myTabs a:last').click(function (e) {
  e.preventDefault();
  $(this).tab('show');
})
