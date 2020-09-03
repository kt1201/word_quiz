<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/htm|4/loose.dtd">
<html>
<head>

<title>단어 관리</title>

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
.row {
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
	
	<!-- 단어검색창 start -->
	<div class="container-fluid">
		<div class="row border-bottom">
			<div class="col-5" style="margin: 0px;">
				<h2><b>단어장</b></h2>
			</div>
			<div class="col" style="margin: 0px;">
				<button id="quiz" class="btn btn-primary" onClick="location.href='quiz.do'" style="float: right;">퀴즈풀기</button>
			</div>
		</div>
		
		<div class = "row">
			<div class="form-inline">
				<input class="form-control" type="text" id="word"
					name="word" placeholder="단어를 입력하세요" />
				&nbsp;&nbsp;
				<button id="searchBtn" class="btn btn-primary">조회</button>
			</div>
		</div>
		<!-- 단어검색창 end -->
		
		<!-- 테이블 start -->
		<div class="row">
			<div class="table">
				<table class="table table-sm table-hover table-bordered text-center">
					<thead class="thead-dark">
						<tr>
							<th scope="col" style="width: 70px;">번호</th>
							<th scope="col">단어</th>
							<th scope="col">뜻</th>
							<th scope="col">수정/삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="word" items="${word}"
							varStatus="theCount">
							<tr>
								<td style="width: 70px">${word.rn}</td>
								<td style="width: 200px">${word.word}</td>
								<td style="text-align: left;">
								<c:forEach var="mean" items="${word.mean_list}" varStatus="theCount">
									&nbsp; - ${mean}<br>
								</c:forEach>
								</td>
								<td style="width: 100px">
									<c:url value="update_word.do" var="url">
										<c:param name="word" value="${word.word}" />
									</c:url>
								
									<button class="btn btn-primary btn-sm" id="update_btn"
										onclick="window.open('${url}','','width=800, height=700, left=50, top=50, scrollbars=1');return false;">
										수정/삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 페이지 번호 -->
				<div class="text-center">
					<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-end">
						<!-- prev 버튼 -->
						<li class="page-item">
							<a class="page-link" id="page-prev"
								href="word.do${pageMaker.word(pageMaker.startPage-1)}"
								aria-label="Prev">
								<span aria-hidden="true">«</span>
							</a>
						</li>
						<!-- 페이지 번호(시작 페이지 번호부터 끝 페이지 번호까지) -->
						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li class="page-item" id="page${idx}">
							<a class="page-link"
								href="word.do${pageMaker.word(idx)}">
							<span>${idx}<span class="sr-only">(current)</span></span>
							</a></li>
						</c:forEach>
						<!-- next 버튼  -->
						<li class="page-item">
							<a class="page-link" id="page-next"
								href="word.do${pageMaker.word(pageMaker.endPage + 1)}"
								aria-label="Next">
								<span aria-hidden="true">»</span>
							</a>
						</li>
					</ul>
					</nav>
				</div>
			</div>
		</div>
		<!-- 테이블 end -->
		
		<!-- 단어 등록창 start -->
		<form id="registerform" action='insert.do' method="post">
			<div class="row border-top pt-3">
			<h3><b>단어 등록</b></h3>
				<div class="form-group">
					<label for="reg_word">단어</label>
					<input type="text" class="form-control" id="reg_word" name="word" placeholder="단어를 입력해 주세요" autocomplete="off">
				</div>
				<div class="form-group">
					<label for="reg_mean">뜻</label>
					<textarea class="form-control" id="reg_mean" name="mean" rows="3" placeholder="뜻을 입력해 주세요" autocomplete="off"></textarea>
				</div>
				<button id="reg_btn" class="btn btn-primary">등록</button>
			</div>
		</form>
		<!-- 단어 등록창 end -->
	</div>
</body>

<script>
	$(function() {
		var word = $("#word");
		var wordVal = word.val();
	
		group_url = "${pageContext.request.contextPath}/data/word_list.json?word="
			+ encodeURI(encodeURIComponent(wordVal));
	
		$.ajax({
			type: 'get',
			url : group_url,
			dataType: "json",
			success: function(data) {
				autocomplete(data);
			}
		});
		
		function autocomplete(data) {
			
			$("#word").autocomplete({
				source: data.word_list,
				select: function(event, ui) {
				},
				focus: function(event, ui) {
					return false;
				}
			});
		}
	});

	$(function() { 
		setCondition1() 
		//prev 버튼 활성화, 비활성화 처리
		var canPrev = '${pageMaker.prev}'
		if (canPrev != 'true') { 
			$('#page-prev').attr("href", "#")
		}
		
		//next 버튼 활성화, 비활성화 처리
		var canNext = '${pageMaker.next}'
		if (canNext != 'true') { 
			$('#page-next').attr("href", "#")
		}
		
		//현재 페이지 파란색으로 활성화 
		var thisPage = '${pageMaker.cri.page}'
		//매번 refresh 되므로 다른 페이지 removeClass 할 필요는 없음-> Ajax 이용시엔 해야함 
		$('#page' + thisPage).addClass('active') 
	})
	
	function setCondition1() { 
		var word = $('#word')
		
		$('#searchBtn').on('click', function() { 
			var wordVal = word.val()
	
			var url = "word.do?page=1&perPageNum=10"
				+ "&word="
				+ encodeURIComponent(wordVal)
			
			window.location.href = url
		})
	}

	$('#reg_btn').click(function() { 
		var reg_word = $('#reg_word')
		var reg_mean = $('#reg_mean')
		
		var reg_wordVal = reg_word.val()
		var reg_meanVal = reg_mean.val()
		
		//검색 조건 입력 안했으면 경고창
		if(reg_wordVal == null || reg_wordVal == ""){
			alert("단어를 입력하세요.")
			reg_word.focus()
			return false
		} else if(reg_meanVal == null || reg_meanVal == ""){
			alert("뜻을 입력하세요.")
			reg_mean.focus()
			return false
		} else { 
			$('#registerform').submit()
		}
	})
</script>

</html>
