<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Lỗi</title>
</head>
<body >
	<div align="center">
		<p style="color:red;font-size:30px;">Lỗi 403</p>
		<p style="color:red;font-size:20px;">Rất tiếc! ${msg }</p>
		<a href="${pageContext.request.contextPath}/view/home">Nhấp vào đây để về trang chủ!!</a>
	</div>
	
</body>
</html>