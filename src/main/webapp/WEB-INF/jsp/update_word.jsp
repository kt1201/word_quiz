<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/htm|4/loose.dtd">
<html>
<head>

<title>단어 수정 및 삭제</title>

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

#container {
	margin-top: 0px;
	margin-bottom: 0px;
	width : 100%;
}
.card {
	height: 100%;
}

.row {
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>

</head>
<body>
	<form id="updateform" action='update.do' method="post">
		<div id="container" class="container-fluid">
			<div class="card">
				<div class="card-header">
					<div class="col">
						<div class="form-inline">
							<div class="mr-2">
								<b>수정 / 삭제 페이지</b>&nbsp;&nbsp;
							</div>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="col">
						<div class="row mb24">
							<div class="form-group" style="width: 80%">
								<label for="word"><b>단어</b>&nbsp;
									<b style="color: red">*</b>
								</label> <input type="text" class="form-control" id="word"
									name="word" value="${wordVO.word}" style="width: 70%;" readonly /> <br>
								<label for="mean"><b>뜻</b></label>
								<div class="form-inline buttons">
									<c:forEach var="list" items="${wordVO.mean_list}"
										varStatus="theCount">
										<textarea class="form-control" id="mean" name="mean_list" rows="3"
											style="width: 80%; margin-right: 10px; margin-bottom: 10px;" autocomplete="off">${list}</textarea>
										<input type="button" class="btn btn-danger btnRemove"
											value="삭제" style="margin-bottom: 10px;">
										<br>
									</c:forEach>
								</div>
								<input type="button" class="btn btn-primary Add" value="추가"
									style="margin-bottom: 10px;" />
								<br>
								<br>
								<button type="button" class="btn btn-primary" id="btn_update">수정</button>
								<button type="button" class="btn btn-danger" id="btn_remove">전체삭제</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<form id="deleteform" action="delete.do" method="post">
		<input type="hidden" name="word" value="${wordVO.word}" />
	</form>
</body>

<script> 
	$('.Add').click (function() {
		$('.buttons').append(
			'<textarea class="form-control" id="mean" name="mean_list" rows="3" placeholder="뜻을 입력해 주세요" style="width: 80%; margin-right: 10px; margin-bottom: 10px;" autocomplete="off"></textarea> <input type="button" class="btn btn-danger btnRemove" value="삭제" style="margin-bottom: 10px;"><br>' 
		);
		$('.btnRemove').on("click", function () { 
			$(this).prev().remove() // remove the textbox
			$(this).next().remove() // remove the <br> 
			$(this).remove() // remove the button
		});
	});

	$('.btnRemove').on("click", function () {
		$(this).prev().remove() // remove the textbox
		$(this).next().remove() // remove the <br> 
		$(this).remove() // remove the button
	});
	
	$('#btn_update').click(function() {
		$('#updateform').submit()
	})
	
	$('#btn_remove').click(function() { 
		if (confirm("정말로 삭제하시겠습니까?") == true) {
			$('#deleteform').submit()
		} else {
			return false
		}
	})
</script>
</html>