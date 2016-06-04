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
//= require zeroclipboard
//= require turbolinks
//= require_tree .

// Replicate hover effect for input form when user hovers over button

$(document).ready(function(){
  // Hide border of input form when hovering submit button
  $( "#create-button" ).hover(
    function() {
      $( ".form-control" ).css("border-color", "transparent");
    }, function() {
      $( ".form-control" ).css("border-color", "#000");
    }
  );

});
