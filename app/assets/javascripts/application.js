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
// require jquery.metisMenu
//= require_folder js
//= require websocket_rails/main
//= require_tree .


var dispatcher = new WebSocketRails('192.168.63.68:3000/websocket');
channel = dispatcher.subscribe('reception');
channel.bind('new', function(patient) {
  console.log('a new order about '+patient+' arrived!');
  $(".order-body").append("<tr><td>" +  patient.first_name+ "</td><td> " +  "04929-324234" + "</td></tr>");
})

