// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.pjax
//= require bootstrap-sprockets
//= require moment
//= require mediaelement_rails
//= require bootstrap-datetimepicker
//= require selectize
//= require tinymce
//= require_tree .

$(function() {
  $(document).pjax('a:not([data-remote]):not([data-behavior]):not([data-skip-pjax])', '[data-pjax-container]')
});

  $("#hideshow").click(function() { 
    // assumes element with id='button'
    $("#about").toggle();
  });
$(function() {
  $('#article_band_id').selectize({
    create: true
  });
});