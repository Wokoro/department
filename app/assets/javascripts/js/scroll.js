//Control the scrolling on the header part
$(document).ready(function(){
  $(window).scroll(function() {
    if ($(document).scrollTop() > 110) {
      $("#heade").addClass("fixed");
      $("#heade").addClass("blue-background");
      $("#heade").removeClass("trans-background");
      $("#heade").css("z-index", "9");
    } else {
      $("heade").removeClass("fixed");
      $("#heade").addClass("trans-background");
      $("#heade").removeClass("fixed");
      $("#heade").removeClass("blue-background");
    }
  });
});
