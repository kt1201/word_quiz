<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-// 
W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>금칙어 등록</title>
</head>
<body>
</body>
<script type="text/javascript"> 
	var result = '${result}'; 
	
	if (result == 'insertOK') {
		/* alert("등록 성공"); */
		location.replace('word.do');
	} else if (result == 'insertError') { 
		/* alert("등록 실패"); */
		location.replace('word.do');
	}
</script>
</html>
