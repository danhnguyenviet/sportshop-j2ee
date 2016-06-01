<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Trang chủ | Sportshop</title>
   
</head>
<body class="main-menu-fixed common-home page-common-home layout-fullwidth">
    
	<c:forEach items="${newsestList }" var="product">
		<p>${product.title} </p>
	</c:forEach>
</body>
</html>
