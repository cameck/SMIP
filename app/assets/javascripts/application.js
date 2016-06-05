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

  $('.form-control').click(function() {
    $(this).css('font-size', '3em');
  });


  // Copy to Clipboard function

    // Get OS for appropriate key commands
  var tooltipText = ( navigator.platform.toLowerCase().includes("mac") ) ? "cmd" : "ctrl";
    // Select text
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

    // Click to select text and initiate tooltip
  $(document).on('click', '#create-button', function(e) {
      // keep formatting the same
    $('.form-control').css('font-size', '3em');
    $('#url-holder').slideUp(400);
    if (e.target.id === 'create-button') {
      // Start Loading Animation
      $( document ).ajaxStart(function() {
        $('.loader').css('display', 'block');
      });

        // When ajaxStart is finished create selection text + tooltip
      $( document ).ajaxComplete(function() {
        $('.loader').fadeOut();
        SelectText('copy-link');
        $('#copy-link').tooltip({title: 'Press "' + tooltipText + ' + c" to copy', trigger: "click"});
        $("[data-toggle='tooltip']").tooltip('show');
      })
    };
  });
    // Hide tooltip if user clicks off of it
  $(document).on('click', function() {
    $("[data-toggle='tooltip']").tooltip('hide');
  });
});
