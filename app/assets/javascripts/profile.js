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

  //highlight links of page you're on
  $('.dropdown-toggle').dropdown();

  // hide project divs when you first open profile page
    $('#project').hide();
    $('#comments').hide();
  // keep footer at the bottom of the page.
  $('footer').css('margin-top',
    $(document).height()
    - ( $('header').height() + $('div').height() )
    - $('footer').height()
);

  // click project tab and to activate it and show projects
  $('#one').click(function (e) {
    e.preventDefault();
    $('#project').tab('show');
    $('#comments').hide();
    $('#project').show();
  });
  // click Comments tab and to activate it, hide projects amd show comments.
  $('#two').click(function (e) {
    e.preventDefault();
    $('#comment').tab('show');
    $('#project').hide();
    $('#comments').show();
  });


});
