<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/htm|4/loose.dtd">
<html>
<head>

<title>퀴즈</title>

<!-- jQuery -->
<script src="/jquery/jquery/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/jquery/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="/jquery/ui/1.12.1/jquery-ui.js"></script>

<!-- bootstrap 4.5.0 -->
<link rel="stylesheet" href="/bootstrap-4.5.0/css/bootstrap.min.css">
<script src="/bootstrap-4.5.0/js/bootstrap.min.js"></script>


<style type="text/css">
body {
	width: 100%;
	height: 100%;
	margin: 0px;
	padding: 0px;
	overflow: auto;
	position: relative
}
.col {
	margin : 10px;
}
#container {
	margin-top: 0px;
	margin-bottom: 0px;
	width : 100%;
}
.table td, .table th {
    vertical-align: middle;
}
</style>

</head>
<body>
	<div class="container-fluid">
		<div class="col pt-3 quiz">
			<div class="row border-bottom">
				<div class="col-5" style="margin: 0px;">
					<h2><b>단어 퀴즈</b></h2>
				</div>
				<div class="col" style="margin: 0px;">
					<button id="word" class="btn btn-primary" onClick="location.href='word.do'" style="float: right;">단어장</button>
				</div>
			</div>
			<h4 class="mt-2">단어 : ${quiz.word}</h4>
			<div class="form-group">
				<textarea class="form-control" id="mean" name="mean" rows="5" placeholder="뜻을 입력해 주세요" autocomplete="off"></textarea>
			</div>
			<div class="form-group" style="float: right;">
				<button id="answer" class="btn btn-primary" this.onclick=null'>정답 보기</button>
				<button id="next" class="btn btn-primary">다음 문제</button>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$('#answer').one("click", function(e) {
		var arr = []
		var str = '${quiz.mean_list}'.replace(/(\[|\])/g,"")
		arr = str.split(',')
		for(var i=0; i<arr.length; i++) {
 			$('.quiz').append(
				'<textarea class="form-control" style="margin_top: 5px;" rows="3" autocomplete="off">' + arr[i] + '</textarea><br>'
			)
		}
	})
	
	$('#next').click (function() {
		location.reload(true)
	})
</script>

</html>
