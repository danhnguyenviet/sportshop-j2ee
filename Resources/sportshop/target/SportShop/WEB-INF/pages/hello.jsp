<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>

</head>
<body>
	<p>${temVar}</p>
	<div >
		<ul>
	   <%--  <c:forEach items="${listUser}" var="userInfo">
	        <li>${userInfo.username}</li>
	    </c:forEach> --%>
		</ul>
	</div>
    <br/>
</body>
</html>