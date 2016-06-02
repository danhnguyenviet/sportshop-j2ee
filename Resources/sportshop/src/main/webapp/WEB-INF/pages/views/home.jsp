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
<title>Trang chủ | Sportshop</title>

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
			<%-- <!-- Header -->
			<%@ include file="../views/templates/header.jsp"%>
			<!-- /Header -->

			<!-- Menu -->
			<%@ include file="../views/templates/menu.jsp"%>
			<!-- /Menu --> --%>
			
			<!-- Slide show -->
			<div class="slideshow " id="pavo-slideshow">
                <div class="container">
                    <div class="inner">
                        <div class="row">
                            <div class="col-lg-12 col-md-12  ">
                                <div class="bannercontainer banner-fullwidth" style="padding: 0;margin: 0;">
                                    <div id="sliderlayer341210982" class="rev_slider fullwidthbanner" style="width:100%;height:489px; ">
                                        <ul>
                                        	<%
												List<ProductModel> SlideShowList = (List<ProductModel>) request.getAttribute("SlideShowProductList");
												for (int i = 0; i < SlideShowList.size(); i++) {
											%>
	                                            <li data-masterspeed="300" data-transition="random" data-slotamount="7" data-thumb="../image/slider/<%= SlideShowList.get(i).getImages().get(0)%>">
	                                                <img src="../image/slider/<%= SlideShowList.get(i).getImages().get(0) %>" alt="Slide show "<%=i %> />
	                                                
	                                                <!-- THE MAIN IMAGE IN THE SLIDE -->
	                                                <div class="caption custom2 randomrotate easeInElastic easeInElastic" data-x="77" data-y="107" data-speed="300" data-start="800" data-easing="easeOutExpo">
	                                                    <%= SlideShowList.get(i).getTitle() %>
	                                                </div>
	
	                                                <!-- THE MAIN IMAGE IN THE SLIDE -->
	                                                <div class="caption custom3 sft easeOutExpo easeOutExpo" data-x="80" data-y="207" data-speed="300" data-start="1000" data-easing="easeOutExpo">
	                                                    <%= SlideShowList.get(i).getDescription() %>
	                                                </div>
	
	                                                <!-- THE MAIN IMAGE IN THE SLIDE -->
	                                                <div class="caption  randomrotate easeInOutBack easeInOutBack" data-x="80" data-y="315" data-speed="300" data-start="1200" data-easing="easeOutExpo">
	                                                    <a href="product.html" class="btn btn-primary btn-lg">Xem chi tiêt</a>
	                                                </div>
	                                            </li>
											<% } %>
										</ul>
                                        <div class="tp-bannertimer tp-top"></div>
                                    </div>
                                </div>

                                <!--
                    			##############################
                    			 - ACTIVATE THE BANNER HERE -
                    			##############################
                    			-->
                                <script type="text/javascript">
                                var tpj = jQuery;

                                if (tpj.fn.cssOriginal != undefined)
                                    tpj.fn.css = tpj.fn.cssOriginal;

                                tpj('#sliderlayer341210982').revolution({
                                    delay: 9000,
                                    startheight: 489,
                                    startwidth: 1170,


                                    hideThumbs: 0,

                                    thumbWidth: 100,
                                    thumbHeight: 50,
                                    thumbAmount: 5,

                                    navigationType: "bullet",
                                    navigationArrows: "verticalcentered",
                                    navigationStyle: "round",

                                    navOffsetHorizontal: 0,
                                    navOffsetVertical: 20,

                                    touchenabled: "on",
                                    onHoverStop: "on",
                                    shuffle: "off",
                                    stopAtSlide: -1,
                                    stopAfterLoops: -1,

                                    hideCaptionAtLimit: 0,
                                    hideAllCaptionAtLilmit: 0,
                                    hideSliderAtLimit: 0,
                                    fullWidth: "on",
                                    shadow: 0
                                });
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
			<!-- /Slide show -->
			
			<%-- <!-- Service -->
			<%@ include file="../views/templates/services.jsp"%>
			<!-- /Service -->
			
			<!-- Footer -->
			<%@ include file="../views/templates/footer.jsp"%>
			<!-- /Footer --> --%> --%>
			
		</div>
	</div>
</body>
</html>
