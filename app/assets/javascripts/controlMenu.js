$(document).ready(function () {
    //For the alumni page
      $(".img").hover(function(){
          $(".hide", this).css("visibility", "visible");
          $(this).addClass('transition');
        }, function(){
          $(".hide",this).css("visibility", "hidden");
          $(this).removeClass('transition');
        });

    //for adding rows
   
    //Resource menu controller
    $("#resource").hover(function () {
        $("#resource-sub-list").slideDown(200);
    }, function () {
        $("#resource-sub-list").slideUp(100);
    });

    //The about menu controller
    $("#about").hover(function () {
        $("#about-sub-list").slideDown(200);
    }, function () {
        $("#about-sub-list").slideUp(200);
    });

    //Programmes menu controller
    $("#programmes").hover(function () {
        $("#programmes-sub-list").slideDown(200);
    }, function () {
        $("#programmes-sub-list").slideUp(200);
    });


    //Programmes sub menu controller
    //post graduate sub menu controller

    var forward = 9656;
    var backwardArrow = 9666;
    $("#post-graduate").hover(function () {
        $("#post-graduate-sub-list").show(10);
    }, function () {
        $("#post-graduate-sub-list").hide(10);
    });


    //under graduate sub menu controller
    $("#under-graduate").hover(function () {
        $("#under-graduate-sub-list").show(10);
    }, function () {
        $("#under-graduate-sub-list").hide(10);
    });

    //Login menu controller
    $("#login").hover(function () {
        $("#login-sub-list").slideDown(200);
    }, function () {
        $("#login-sub-list").slideUp(200);
    });

});
