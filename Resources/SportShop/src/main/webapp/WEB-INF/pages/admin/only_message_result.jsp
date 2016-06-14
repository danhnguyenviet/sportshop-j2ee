<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<c:choose>
		<c:when test="${not empty error }">
			<p style="color: red; font-style: italic; font-size: 14px;">${msg}</p>
		</c:when>
		<c:otherwise>
			<p style="color: green; font-style: italic; font-size: 14px;">${msg}</p>
		</c:otherwise>
	</c:choose>

</body>
</html>