$(document).ready(function() {
	var price = Number($("#pt_price").val());

	var tax = Number($("#pt_tax").val());

	var total = price + tax;

	$("#pt_totala").val(total);
	$("#pt_totalb").val(total);

	$(document).on('click', '#submitBtn', function() {
		var chkBox = $("#chkBox").is(":checked");
		alert(chkBox);
	});
})