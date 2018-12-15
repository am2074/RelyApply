
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= rails-ujs
//= require popper
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require_tree 

$(function() {
  initPage();
});
$(window).bind('page:change','page:restore',function() {
  initPage();
});
function initPage() { 
  function initialize() {

  var input = document.getElementById('location');
  var autocomplete = new google.maps.places.Autocomplete(input);
  }

}


//$(document).on 'turbolinks:load', ->
//my_func()

//document.addEventListener("turbolinks:load", function() {
//my_func();
//})

//$(document).on('turbolinks:load', function() {
//console.log('(document).turbolinks:load')
//});

//$(document).on('page:load', function() {
//$(document).trigger('ready');
//});

//$(document).ready(loadMap)
//$(document).on('page:load', loadMap)

//$('#myTab a').click(function(e) {
//e.preventDefault();
//$(this).tab('show');
//});

// store the currently selected tab in the hash value
$("ul.nav-tabs > li > a").on("shown.bs.tab", function(e) {
  var id = $(e.target).attr("href").substr(1);
  window.location.hash = id;
});

// on load of the page: switch to the currently selected tab
var hash = window.location.hash;
$('#myTab a[href="' + hash + '"]').tab('show');
//omniauth facebook
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '{your-app-id}',
      cookie     : true,
      xfbml      : true,
      version    : '{api-version}'
    });
      
    FB.AppEvents.logPageView();   
      
  };
