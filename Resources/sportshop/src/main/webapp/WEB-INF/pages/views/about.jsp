<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="j2ee.group01.sportshop.model.ProductModel"%>
<%@ page import="j2ee.group01.sportshop.model.CategoryModel"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>About | Sportshop</title>

	<link href="../image/catalog/cart.png" rel="icon" />
<link href="../catalog/view/theme/pav_sportshop/stylesheet/bootstrap.css" rel="stylesheet" />
<link href="../catalog/view/theme/pav_sportshop/stylesheet/stylesheet.css" rel="stylesheet" />
<link href="../catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<link href="../catalog/view/javascript/jquery/magnific/magnific-popup.css" rel="stylesheet" />
<link href="../catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" rel="stylesheet" />
<link href="../catalog/view/javascript/jquery/owl-carousel/owl.transitions.css" rel="stylesheet" />
<link href="../catalog/view/theme/default/stylesheet/pavproducttabs.css" rel="stylesheet" />
<link href="../catalog/view/theme/pav_sportshop/stylesheet/sliderlayer/css/typo.css" rel="stylesheet" />
<link href="../catalog/view/theme/pav_sportshop/stylesheet/pavcarousel.css" rel="stylesheet" />
<link href="../catalog/view/theme/pav_sportshop/stylesheet/pavreassurance.css" rel="stylesheet" />
<link href="../catalog/view/theme/pav_sportshop/stylesheet/pavblog.css" rel="stylesheet" />
<link href="../catalog/view/theme/pav_sportshop/stylesheet/pavnewsletter.css" rel="stylesheet" />
<script type="text/javascript" src="../catalog/view/javascript/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="../catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="../catalog/view/javascript/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../catalog/view/javascript/common.js"></script>
<script type="text/javascript" src="../catalog/view/theme/pav_sportshop/javascript/common.js"></script>
<script type="text/javascript" src="../catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js"></script>
<script type="text/javascript" src="../catalog/view/javascript/layerslider/jquery.themepunch.plugins.min.js"></script>
<script type="text/javascript" src="../catalog/view/javascript/layerslider/jquery.themepunch.revolution.min.js"></script>
<script type="text/javascript" src="../catalog/view/javascript/jquery/elevatezoom/elevatezoom-min.js"></script>
</head>
<body class="main-menu-fixed common-home page-common-home layout-fullwidth">
	<div class="row-offcanvas row-offcanvas-left">
		<div id="page">
			<!-- Header -->
			<%@ include file="../views/templates/header.jsp"%>
			<!-- /Header -->

			<!-- Menu -->
			<%@ include file="../views/templates/menu.jsp"%>
			<!-- /Menu -->
			
			<!-- About document -->
			<c:import var="testHtml" url="../document/about.html" />
			${testHtml}
			<!-- /About document -->
			
			<!-- Footer -->
			<%@ include file="../views/templates/footer.jsp"%>
			<!-- /Footer -->
			
		</div>
	</div>
</body>
</html>
