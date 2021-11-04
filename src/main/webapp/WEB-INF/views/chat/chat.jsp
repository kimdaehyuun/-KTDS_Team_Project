<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="<c:url value='/resources/css/chat.css'/>" />

<script src="<c:url value='/resources/js/chat.js'/>"></script>

<style>
p {
	padding: 0;
	margin: 0;
}

.bg {
	background-color: #90DBE1;  
}

.bg .my {
	background-color: #FAFF7D;
}

.bg .opp {
	background-color: #ffffff;
}

</style>

<div class="container w-75 p-0">

	<div class="row row-cols-1 p-3"> 
		<div class="p-2 header bg-success text-light">
			<p>CHATROOM : ${chat_id}</p>
		</div>
		<div class="col border overflow-scroll bg" style="height: 600px; overflow-x: hidden !important;">
			<c:forEach var="msg" items="${message}">
				<c:choose>
					<c:when test="${msg.msg_writer == member.user_name}">
						<p class="card-title mb-1 text-end pe-2" style="font-size: 1em"><b>${msg.msg_writer}</b></p>
						<div class="card ms-auto mb-2 my" style="width: 25rem;">
							<div class="card-body p-1">
								<p class="card-text text-end pe-2">${msg.msg}</p>
								<p class="card-text text-end pe-2" style="font-size: x-small">${msg.msg_date}</p>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<p class="card-title mb-1 ps-2" style="font-size: 1em"><b>${msg.msg_writer}</b></p>
						<div class="card me-auto mb-2 opp" style="width: 25rem;">
							<div class="card-body p-1">
								<p class="card-text ps-2">${msg.msg}</p>
								<p class="card-text ps-2" style="font-size: x-small">${msg.msg_date}</p>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>

	<div class="input-group p-2">
		<input type="text" class="form-control" id="chatInputBox"
			name="chatInputBox">
		<button class="input-group-text" id="chatBtn" name="chatBtn">
			<i class="bi bi-cursor"></i>
		</button>
	</div>
</div>

<script>
	$(document).ready(function(e) {

		window.setTimeout('window.location.reload()',10000);

		document.getElementById('chatInputBox').onkeypress = function(e) {
			if (!e)
				e = window.event;
			var keyCode = e.code || e.key;
			if (keyCode == 'Enter') {
				$.ajax({
					url : "${pageContext.request.contextPath}/chat/msgSend.do",
					type : "GET",
					data : {
						"chat_id" : "${chat_id}",
						"msg_writer" : "${member.user_name}",
						"msg" : $('#chatInputBox').val()
					},
					success : function(data) {
						location.reload();
					},
					error : function() {
						alert("접속 실패 했습니다!!");
					}
				});
			}
		}

		$("#chatBtn").click(function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/chat/msgSend.do",
				type : "GET",
				data : {
					"chat_id" : "${chat_id}",
					"msg_writer" : "${member.user_name}",
					"msg" : $('#chatInputBox').val()
				},
				success : function(data) {
					location.reload();
				},
				error : function() {
					alert("접속 실패 했습니다!!");
				}
			});
		});
	});
</script>