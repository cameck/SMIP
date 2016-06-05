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
//= require bootstrap-sprockets
//= require jquery_ujs
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

  // Copy to Clipboard function
  function SelectText(element) {
      var doc = document;
      var text = doc.getElementById(element);
      var range;
      var selection;

      if (doc.body.createTextRange) {
          range = document.body.createTextRange();
          range.moveToElementText(text);
          range.select();
      } else if (window.getSelection) {
          selection = window.getSelection();
          range = document.createRange();
          range.selectNodeContents(text);
          selection.removeAllRanges();
          selection.addRange(range);
      }
  }


  $(document).on('click', '#url-holder', function(e) {
    console.log("CLICKED!");
    if (e.target.id === 'd_clip_button') {
          SelectText('copy-link');
          $('#copy-link').tooltip({title: "Yolo"});
          $("[data-toggle='tooltip']").tooltip('show');

          console.log("DONE!");
        }
  });


});
