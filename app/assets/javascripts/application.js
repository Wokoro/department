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
//= require turbolinks
//= require_tree .
//= require jquery.remotipart



/* function activateTab(elem){
	var tabs = $('.tab-title');
	var tabCont = $(".tab-content");
	for(var i=0; i<tabs.length; i++){
		tabs[i].css("backgroundColor", "gray");
		tabCont[i].hide();
		if(tabs[i].id == elem.id){
			tabCont[i].show
			tabs[i].css("backgroundColor", "white");
		}
	}
} */

function activateTab(elem){
	var tabs = document.getElementsByClassName('tab-title');
	var tabCont = document.getElementsByClassName("tab-content");
	for(var i=0; i<tabs.length; i++){
		tabs[i].style.backgroundColor = "gray";
		tabCont[i].style.display = 'none';
		if(tabs[i].id == elem.id){
			tabCont[i].style.display='inline-table';
			tabs[i].style.backgroundColor = "white";
		}
	}
}