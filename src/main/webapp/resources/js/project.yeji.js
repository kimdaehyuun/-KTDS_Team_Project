$(function(){

    $(document).on('click', '#oneOnOne_btn', function(){
       $('#oneOnOne').css({
          'display': 'block'
       });
       $('#customer_faq').css({
          'display': 'none'
       });
		$('#notice_container').css({
          'display': 'none'
       });
		$('.wrapper').css({
          'display': 'none'
       });
		$('#oneOnOne_btn').css({
          'font-weight': 'bold'
       });
       $('#customer_faq_button').css({
          'font-weight': 'normal'
       });
		 $('#notice_container_btn').css({
		          'font-weight': 'normal'
		       });
		 $('#rule_container_btn').css({
		          'font-weight': 'normal'
       });
    });
    
    $(document).on('click', '#customer_faq_button', function(){
       $('#customer_faq').css({ 
          'display': 'block'
       });
       $('#oneOnOne').css({
          'display': 'none'
       });
		$('#notice_container').css({
          'display': 'none'
       });
		$('.wrapper').css({
          'display': 'none'
       });
		$('#customer_faq_button').css({
		          'font-weight': 'bold'
		       });
		$('#oneOnOne_btn').css({
		          'font-weight': 'normal'
		       });
		$('#notice_container_btn').css({
		          'font-weight': 'normal'
		       });
		$('#rule_container_btn').css({
		          'font-weight': 'normal'
       });
    })

	$(document).on('click', '#notice_container_btn', function(){
       $('#customer_faq').css({ 
          'display': 'none'
       });
       $('#oneOnOne').css({
          'display': 'none'
       });

		$('#notice_container').css({
          'display': 'block'
       });
		$('.wrapper').css({
          'display': 'none'
       });
		$('#notice_container_btn').css({
				          'font-weight': 'bold'
		       });
		$('#oneOnOne_btn').css({
				          'font-weight': 'normal'
		       });
		$('#customer_faq_button').css({
				          'font-weight': 'normal'
		       });
		$('#rule_container_btn').css({
				          'font-weight': 'normal'
       });
    })

	$(document).on('click', '#rule_container_btn', function(){
       $('#customer_faq').css({ 
          'display': 'none'
       });
       $('#oneOnOne').css({
          'display': 'none'
       });

		$('#notice_container').css({
          'display': 'none'
       });
		$('.wrapper').css({
          'display': 'block'
       });
		$('#rule_container_btn').css({
				          'font-weight': 'bold'
       });
		$('#oneOnOne_btn').css({
				          'font-weight': 'normal'
       });
		$('#customer_faq_button').css({
				          'font-weight': 'normal'
       });
		$('#notice_container_btn').css({
				          'font-weight': 'normal'
       });
    })
	
	
})






