function sendRequest(e,s,c,o,t){$.ajaxSetup({headers:{"X-CSRF-Token":$('meta[name="csrf-token"]').attr("content")}}),$.ajax("/create_course",{type:"POST",dataType:"json",data:{ccode:e,ctitle:s,units:c,level:o,semester:t},success:function(e,s){alert("created: "+e.ctitle+"successfully\nStatus: "+s),$("#returnStatus").text("course created successfully")},error:function(e,s,c){alert("Error"+c)}})}function recSugestions(e){$.ajaxSetup({headers:{"X-CSRF-Token":$('meta[name="csrf-token"]').attr("content")}}),$.ajax("/all_courses",{type:"POST",dataType:"json",data:{query:e},success:function(e,s){$("#sugestions").text(e)},error:function(e,s,c){alert("Error"+c)}})}$(document).ready(function(){$(document).ajaxSend(function(){$("#sugestions").text("")}),$("body").click(function(e){var s=e.target.id;if(s)switch(s){case"hom":$(".page").css("display","none"),$("#dashboard").css("display","block");break;case"lect":$(".page").css("display","none"),$("#lecturer").css("display","block");break;case"stud":$(".page").css("display","none"),$("#students").css("display","block");break;case"cos":$(".page").css("display","none"),$("#courses").css("display","block");break;case"new":$(".page").css("display","none"),$("#news").css("display","block");break;case"create":$("#ccode_field").focus(),$(".create_course_op").css("display","none"),$(".edit_course_op").css("display","none"),$(".delete_course_op").css("display","none"),$("#create_course_op").css("display","block");break;case"edit":$("#ccode_field").focus(),$(".create_course_op").css("display","none"),$(".edit_course_op").css("display","none"),$(".delete_course_op").css("display","none"),$("#edit_course_op").css("display","block");break;case"delete":$("#ccode_field").focus(),$(".create_course_op").css("display","none"),$(".edit_course_op").css("display","none"),$(".delete_course_op").css("display","none"),$("#delete_course_op").css("display","block")}}),$("#create_course").click(function(e){var s=$("#create_units_field").val();sendRequest($("#create_ccode_field").val(),$("#create_ctitle_field").val(),s,$("#create_level_field").val(),$("#create_semester_field").val())}),$("#edit_ccode_field").keyup(function(e){var s=$("#edit_ccode_field").val();$("#sugestions").css("display","block"),recSugestions(s)}),$("#operations div").hover(function(e){$(this).css("border-bottom","medium solid blue"),$(this).css("border-bottom-width","thin"),$(this).css("cursor","pointer")},function(){$(this).css("border-bottom","medium solid white"),$(this).css("border-bottom-width","thin")}),$(document).ajaxStart(function(){$("#loader").addClass("loader")}).ajaxStop(function(){$("#loader").removeClass("loader")})});