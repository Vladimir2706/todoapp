//= require jquery
//= require bootstrap/alert
//= require turbolinks
//= require_tree .

$(function(){
  setTimeout(function(){
    $(".alert").fadeTo(2000, 500).slideUp(500, function(){
      $(".alert").slideUp(500);
    });
  }, 1000);
});
