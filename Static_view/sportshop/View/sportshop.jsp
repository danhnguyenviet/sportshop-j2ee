<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Trang chủ | Sportshop</title>
    
    <%@ include file = "default/head.jsp" %>

</head>
<body class="main-menu-fixed common-home page-common-home layout-fullwidth">
	<div class="row-offcanvas row-offcanvas-left">
		<div id="page">
	
			<!-- Header -->
			<%@ include file = "default/header.jsp" %>
			
			
			<!-- Menu -->
			<%@ include file = "default/menu.jsp" %>
			
			
			
			<!-- Trang chủ -->
			<%@ include file ="home/index.jsp" %>
			
			
			<!-- Giới thiệu -->
			<%--
				<%@ include file= "about/about.jsp" %>
			--%>
			
			<!-- Tin tức -->
			<%--
				<%@ include file= "blog/blog.jsp" %>
			--%>
		
			
			<!-- Liên hệ -->
			<%--
				<%@ include file= "contact/contact.jsp" %>
			--%>
			
			
			<!-- Danh mục sản phẩm -->
			<%--
				<%@ include file= "product/category.jsp" %>
			--%>
			
			
			<!-- Giỏ hàng -->
			<%--
				<%@ include file= "cart/cart.jsp" %>
			--%>
			
			
			<!-- Footer -->
			<%@ include file= "default/footer.jsp" %>
			
			
			<!-- Copyright -->
			<%@ include file= "default/copyright.jsp" %>
			
			
		</div>
		
		
		<!-- Left Menu On Mobile -->
		<%@ include file= "default/mobile-menu.jsp" %>

		
	</div>
</body>
</html>