<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>금칙어 삭제</title>
</head>
<body>
</body>
<script type="text/javascript"> 
	var result = '${result}';
	
	if (result == 'deleteOK') { 
		alert("삭제 성공")
		window.opener.document.location.reload();
		window.close();
	} else if (result == 'deleteError') { 
		alert("삭제 실패")
		window.opener.document.location.reload();
		window.close();
	}
</script>
</html>
