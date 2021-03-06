$(document).ready(function(){
	//Get the divs holding the modals
	var modalHolder = $('.my-modal');
	var createModal = $('#create_modal');
	var editModal = $('#edit_modal');
	var deleteModal = $('#delete_modal');

	



	// Get the buttons that opens the modals
	var createBtn = $("#new_course_menu_item");
	var editBtn = $("#edit_course_menu_item");
	var deleteBtn = $("#delete_course_menu_item");

	// Get the <span> element that closes the modals
	var modalCloseBtn = $(".close");

	createBtn.click(function(){
		modalHolder.css("display", "block");
		createModal.css("display", "block");
		editModal.css("display", "none");
		deleteModal.css("display", "none");
	});

	editBtn.click(function(){
		modalHolder.css("display", "block");
		editModal.css("display", "block");
		createModal.css("display", "none");
		deleteModal.css("display", "none");
	});

	deleteBtn.click(function(){
		modalHolder.css("display", "block");
		deleteModal.css("display", "block");
		editModal.css("display", "none");
		createModal.css("display", "none");
	});
	// When the user clicks on <span> (x), close the modal
	modalCloseBtn.click(function(){
		deleteModal.css("display", "none");
		editModal.css("display", "none");
		createModal.css("display", "none");
		modalHolder.css("display", "none");
	});
});