// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap


  var tabsShowing = false;
  var tabsCount = 0;
  var tabN = 0;


  $(function() {

    var upChevron = $('<span class="glyphicon glyphicon-chevron-up"></span>');
    var donwChevron = $('<span class="glyphicon glyphicon-chevron-down"></span>');

  	 $(document).on('click',".lift-up", function() {
  	 	$this = $(this);
  	 	console.log($this);
  	 	$("#container").slideUp();
  	 	$('.lift-up').removeClass('.lift-down');

  	 });
  })

  