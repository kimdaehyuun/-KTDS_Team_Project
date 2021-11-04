$(function() {
	$(document).on('click', '#btn', function() {
		var text = $("#editform").text();
		$("#editform").html("<input type='text' value='" + text +  "' id='editDo'>");
		$("#editbtn").html("<button type='button' id='btnDo'>수정하기</button>");
	});

	$(document).on('click', '#btnDo', function() {
		$("#editform").text($("#editDo").val());
		$("#editbtn").html("<button type='button' id='btn'>수정</button>");
	});

	//마이 페이지 동작
	$(document).on('click', '#call_item_btn', function() {
		document.getElementById('call_item_btn').className = 'btn btn-danger col mx-4';
		document.getElementById('call_wish_btn').className = 'btn btn-secondary col mx-4';
		document.getElementById('call_review_btn').className = 'btn btn-secondary col mx-4';
		document.getElementById('call_ship_btn').className = 'btn btn-secondary col mx-4';
		$(".item_container").attr('class', 'item_container d-block justify-content-start mt-3 flex-wrap');
		$(".wish_container").attr('class', 'wish_container d-none');
		$(".review_container").attr('class', 'review_container d-none');
		$(".deliver_container").attr('class', 'deliver_container d-none');
	}); 

	$(document).on('click', '#call_wish_btn', function() {
		document.getElementById('call_item_btn').className = 'btn btn-secondary col mx-4';
		document.getElementById('call_wish_btn').className = 'btn btn-danger col mx-4';
		document.getElementById('call_review_btn').className = 'btn btn-secondary col mx-4';
		document.getElementById('call_ship_btn').className = 'btn btn-secondary col mx-4';
		$(".item_container").attr('class', 'item_container d-none');
		$(".wish_container").attr('class', 'wish_container d-block justify-content-start mt-3 flex-wrap');
		$(".review_container").attr('class', 'review_container d-none');
		$(".deliver_container").attr('class', 'deliver_container d-none');
	});
	
	$(document).on('click', '#call_review_btn', function()  {
		document.getElementById('call_item_btn').className = 'btn btn-secondary col mx-4';
		document.getElementById('call_wish_btn').className = 'btn btn-secondary col mx-4';
		document.getElementById('call_review_btn').className = 'btn btn-danger col mx-4';
		document.getElementById('call_ship_btn').className = 'btn btn-secondary col mx-4';
		$(".item_container").attr('class', 'item_container d-none');
		$(".wish_container").attr('class', 'wish_container d-none');
		$(".review_container").attr('class', 'review_container d-block w-100 justify-content-start text-center my-3 flex-wrap');
		$(".deliver_container").attr('class', 'deliver_container d-none');
	});
	
	$(document).on('click', '#call_ship_btn', function() {
		document.getElementById('call_item_btn').className = 'btn btn-secondary col mx-4';
		document.getElementById('call_wish_btn').className = 'btn btn-secondary col mx-4';
		document.getElementById('call_review_btn').className = 'btn btn-secondary col mx-4';
		document.getElementById('call_ship_btn').className = 'btn btn-danger col mx-4';
		$(".item_container").attr('class', 'item_container d-none');
		$(".wish_container").attr('class', 'wish_container d-none');
		$(".review_container").attr('class', 'review_container d-none');
		$(".deliver_container").attr('class', 'deliver_container d-block w-100 justify-content-center mt-3 flex-wrap border-top');
	});
	

	//상대페이지 동작
	$(document).on('click', '#call_item_btn2', function() {
		$('#call_item_btn2').attr('class', 'btn btn-danger col mx-4');
		$('#call_review_btn2').attr('class', 'btn btn-secondary col mx-4');
		$(".item_container").attr('class', 'item_container d-block justify-content-start mt-3 flex-wrap');
		$(".review_container").attr('class', 'review_container d-none');
	});

	$(document).on('click', '#call_review_btn2', function() {
		$('#call_item_btn2').attr('class', 'btn btn-secondary col mx-4');
		$('#call_review_btn2').attr('class', 'btn btn-danger col mx-4'); 
		$(".item_container").attr('class', 'item_container d-none');
		$(".review_container").attr('class', 'review_container d-block w-100 justify-content-start text-center my-3 flex-wrap');
	});
});








