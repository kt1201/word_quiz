<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/htm/4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>금칙어 수정</title>
</head>
<body>
</body>
<script type="text/javascript"> 
	var result = '${result}';
	
	if (result == 'updateOK') { 
		alert("수정 성공");
		window.opener.document.location.reload(); 
		window.close();
	} else if (result == 'updateError') { 
		alert("수정 실패");
		window.opener.document.location.reload();
		window.close();
	}
</script>
</html>
