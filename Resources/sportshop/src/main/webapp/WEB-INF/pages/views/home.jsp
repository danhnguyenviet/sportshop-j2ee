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

<script type="text/javascript">
	function addCart(){
		$.post( "../view/addToCart", { id: "1", quantity: "102" })
		  .done(function( data ) {
			  $('#topCartPanelToAjax').html(data+"");
		  })
		  .fail(function() {
		    alert( "error" );
		  });
	}
</script>
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
			
			<!-- Top product list: newest and most purchase -->
			<div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12  ">
                        <div class="box producttabs  module_class ">
                            <div class="tab-nav">
                                <ul class="nav nav-pills" id="producttabs1038579234">
                                    <li><a href="#tab-latest1038579234" data-toggle="tab">Mới nhất</a></li>
                                    <li><a href="#tab-mostviewed1038579234" data-toggle="tab">Mua nhiều</a></li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane products-rows  tabcarousel1038579234 slide" id="tab-latest1038579234">
                                    <div class="carousel-controls">
                                        <a class="carousel-control left" href="#tab-latest1038579234" data-slide="prev">
                                            <i class="fa fa-angle-left"></i>
                                        </a>
                                        <a class="carousel-control right" href="#tab-latest1038579234" data-slide="next">
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                    
                                    <div class="carousel-inner products-block">
                                    	<% List<ProductModel> NewestList =  (List<ProductModel>)request.getAttribute("NewestProductList");%>
                                        
                                        <!-- List active item -->
                                        <div class="item active">
                                            <div class="row products-row">
                                            	<% for(int i=0;i < 4; i++){ %>
                                            		<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 product-col">
	                                                    <div class="product-block">
	                                                        <div class="product-label">
	                                                            <div class="product-label-wapper">
	                                                                Mới </div>
	                                                        </div>
	                                                        <div class="image">
	                                                            <a class="img" href="product.html"><img src="../image/product/<%=NewestList.get(i).getImages().get(0)%>" alt="<%=NewestList.get(i).getTitle()%>" class="img-responsive" /></a>
	                                                            <a href="../image/product/<%=NewestList.get(i).getImages().get(0)%>" class="btn btn-outline-inverse colorbox product-zoom cboxElement" title="<%=NewestList.get(i).getTitle()%>"><i class="fa fa-search-plus"></i></a>
	                                                            <div class="quickview">
	                                                                <a class="pav-colorbox btn btn-outline-inverse cboxElement" href="product.html" title="Xem nhanh" data-toggle="modal" data-target="#myModal"><em class="fa fa-eye"></em><span>Xem nhanh</span></a>
	                                                            </div>
	                                                        </div>
	
	                                                        <div class="product-meta">
	                                                            <div class="left">
	                                                                <div class="rating">
	                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
	                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
	                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
	                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
	                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
	                                                                </div>
	                                                                <div class="price">
	                                                                	<% if(NewestList.get(i).getPricePromotion() != null &&
	                                                                		NewestList.get(i).getPricePromotion() < NewestList.get(i).getPrice()){ %>
		                                                                    <span class="price-new"><%=NewestList.get(i).getPricePromotion()%>đ</span>
		                                                                    <span class="price-old"><%=NewestList.get(i).getPrice()%>đ</span>
		                                                                <% }else{ %>
		                                                                	<span class="price-new"><%=NewestList.get(i).getPrice()%>đ</span>
		                                                                <% } %>
	                                                                </div>
	                                                            </div>
	                                                            <h3 class="name"><a href="product.html"><%=NewestList.get(i).getTitle()%></a></h3>
	
	                                                            <div class="description"><p><%=NewestList.get(i).getDescription()%></p></div>
	
	                                                            <div class="right">
	                                                                <div class="action">
	                                                                    <div class="cart">
	                                                                        <button onclick="window.location.href='cart.html'" class="btn btn-shopping-cart btn-outline-inverse">
	                                                                            <span class="fa fa-shopping-cart"></span>
	                                                                            Mua ngay
	                                                                        </button>
	                                                                    </div>
	                                                                    <div class="wishlist">
	                                                                        <a data-toggle="tooltip" data-placement="top" title="Xem chi tiết" class="btn btn-outline" href="product.html">
	                                                                            <span>Chi tiết</span>
	                                                                        </a>
	                                                                    </div>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                </div>
                                            	<% } %>
                                          	</div>
                                        </div>
                                          
                                       	<!-- All item -->
                                       	<% for(int i=4; i < NewestList.size();i++){ %>
                                       		<div class="item">
                                            	<div class="row products-row">
                                            	<% for(int j=i; (j < i+4 && j < NewestList.size());j++){ %>
                                            		<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 product-col">
	                                                    <div class="product-block">
	                                                        <div class="product-label">
	                                                            <div class="product-label-wapper">
	                                                                Mới </div>
	                                                        </div>
	                                                        <div class="image">
	                                                            <a class="img" href="product.html"><img src="../image/product/<%=NewestList.get(j).getImages().get(0)%>" alt="<%=NewestList.get(j).getTitle()%>" class="img-responsive" /></a>
	                                                            <a href="../image/product/<%=NewestList.get(j).getImages().get(0)%>" class="btn btn-outline-inverse colorbox product-zoom cboxElement" title="<%=NewestList.get(j).getTitle()%>"><i class="fa fa-search-plus"></i></a>
	                                                            <div class="quickview">
	                                                                <a class="pav-colorbox btn btn-outline-inverse cboxElement" href="product.html" title="Xem nhanh" data-toggle="modal" data-target="#myModal"><em class="fa fa-eye"></em><span>Xem nhanh</span></a>
	                                                            </div>
	                                                        </div>
	
	                                                        <div class="product-meta">
	                                                            <div class="left">
	                                                                <div class="rating">
	                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
	                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
	                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
	                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
	                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
	                                                                </div>
	                                                                <div class="price">
	                                                                	<% if(NewestList.get(j).getPricePromotion() != null &&
	                                                                			NewestList.get(j).getPricePromotion() < NewestList.get(j).getPrice()){ %>
		                                                                    <span class="price-new"><%=NewestList.get(j).getPricePromotion()%>đ</span>
		                                                                    <span class="price-old"><%=NewestList.get(j).getPrice()%>đ</span>
		                                                                <% }else{ %>
		                                                                	<span class="price-new"><%=NewestList.get(j).getPrice()%>đ</span>
		                                                                <% } %>
	                                                                </div>
	                                                            </div>
	                                                            <h3 class="name"><a href="product.html"><%=NewestList.get(j).getTitle()%></a></h3>
	
	                                                            <div class="description"><p><%=NewestList.get(j).getDescription()%></p></div>
	
	                                                            <div class="right">
	                                                                <div class="action">
	                                                                    <div class="cart">
	                                                                        <button onclick="window.location.href='cart.html'" class="btn btn-shopping-cart btn-outline-inverse">
	                                                                            <span class="fa fa-shopping-cart"></span>
	                                                                            Mua ngay
	                                                                        </button>
	                                                                    </div>
	                                                                    <div class="wishlist">
	                                                                        <a data-toggle="tooltip" data-placement="top" title="Xem chi tiết" class="btn btn-outline" href="product.html">
	                                                                            <span>Chi tiết</span>
	                                                                        </a>
	                                                                    </div>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                </div>
                                            	<% } %>
                                            	</div>
                                            </div>
                                       	<% i = (i+4)-1; } %>
                                    </div>
                                </div>

                                <div class="tab-pane products-rows  tabcarousel1038579234 slide" id="tab-mostviewed1038579234">

                                    <div class="carousel-controls">
                                        <a class="carousel-control left" href="#tab-mostviewed1038579234" data-slide="prev">
                                            <i class="fa fa-angle-left"></i>
                                        </a>
                                        <a class="carousel-control right" href="#tab-mostviewed1038579234" data-slide="next">
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                    <div class="carousel-inner products-block">
                                    	<% List<ProductModel> MostPurchaseList =  (List<ProductModel>)request.getAttribute("MostPurchaseProductList");%>
                                        
                                        <!-- List active item -->
                                        <div class="item active">
                                            <div class="row products-row">
                                            	<% for(int i=0;i < 4; i++){ %>
                                            		<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 product-col">
	                                                    <div class="product-block">
	                                                        <div class="product-label">
	                                                            <div class="product-label-wapper">
	                                                                Hot </div>
	                                                        </div>
	                                                        <div class="image">
	                                                            <a class="img" href="product.html"><img src="../image/product/<%=MostPurchaseList.get(i).getImages().get(0)%>" alt="<%=MostPurchaseList.get(i).getTitle()%>" class="img-responsive" /></a>
	                                                            <a href="../image/product/<%=MostPurchaseList.get(i).getImages().get(0)%>" class="btn btn-outline-inverse colorbox product-zoom cboxElement" title="<%=MostPurchaseList.get(i).getTitle()%>"><i class="fa fa-search-plus"></i></a>
	                                                            <div class="quickview">
	                                                                <a class="pav-colorbox btn btn-outline-inverse cboxElement" href="product.html" title="Xem nhanh" data-toggle="modal" data-target="#myModal"><em class="fa fa-eye"></em><span>Xem nhanh</span></a>
	                                                            </div>
	                                                        </div>
	
	                                                        <div class="product-meta">
	                                                            <div class="left">
	                                                                <div class="rating">
	                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
	                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
	                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
	                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
	                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
	                                                                </div>
	                                                                <div class="price">
	                                                                	<% if(MostPurchaseList.get(i).getPricePromotion() != null &&
	                                                                			MostPurchaseList.get(i).getPricePromotion() < MostPurchaseList.get(i).getPrice()){ %>
		                                                                    <span class="price-new"><%=MostPurchaseList.get(i).getPricePromotion()%>đ</span>
		                                                                    <span class="price-old"><%=MostPurchaseList.get(i).getPrice()%>đ</span>
		                                                                <% }else{ %>
		                                                                	<span class="price-new"><%=MostPurchaseList.get(i).getPrice()%>đ</span>
		                                                                <% } %>
	                                                                </div>
	                                                            </div>
	                                                            <h3 class="name"><a href="product.html"><%=MostPurchaseList.get(i).getTitle()%></a></h3>
	
	                                                            <div class="description"><p><%=MostPurchaseList.get(i).getDescription()%></p></div>
	
	                                                            <div class="right">
	                                                                <div class="action">
	                                                                    <div class="cart">
	                                                                        <button onclick="window.location.href='cart.html'" class="btn btn-shopping-cart btn-outline-inverse">
	                                                                            <span class="fa fa-shopping-cart"></span>
	                                                                            Mua ngay
	                                                                        </button>
	                                                                    </div>
	                                                                    <div class="wishlist">
	                                                                        <a data-toggle="tooltip" data-placement="top" title="Xem chi tiết" class="btn btn-outline" href="product.html">
	                                                                            <span>Chi tiết</span>
	                                                                        </a>
	                                                                    </div>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                </div>
                                            	<% } %>
                                          	</div>
                                        </div>
                                          
                                       	<!-- All item -->
                                       	<% for(int i=4; i< MostPurchaseList.size();i++){ %>
                                       		<div class="item">
                                            	<div class="row products-row">
                                            	<% for(int j=i; (j < i+4 && j < MostPurchaseList.size());j++){ %>
                                            		<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 product-col">
	                                                    <div class="product-block">
	                                                        <div class="product-label">
	                                                            <div class="product-label-wapper">
	                                                                Hot </div>
	                                                        </div>
	                                                        <div class="image">
	                                                            <a class="img" href="product.html"><img src="../image/product/<%=MostPurchaseList.get(j).getImages().get(0)%>" alt="<%=MostPurchaseList.get(j).getTitle()%>" class="img-responsive" /></a>
	                                                            <a href="../image/product/<%=MostPurchaseList.get(j).getImages().get(0)%>" class="btn btn-outline-inverse colorbox product-zoom cboxElement" title="<%=MostPurchaseList.get(j).getTitle()%>"><i class="fa fa-search-plus"></i></a>
	                                                            <div class="quickview">
	                                                                <a class="pav-colorbox btn btn-outline-inverse cboxElement" href="product.html" title="Xem nhanh" data-toggle="modal" data-target="#myModal"><em class="fa fa-eye"></em><span>Xem nhanh</span></a>
	                                                            </div>
	                                                        </div>
	
	                                                        <div class="product-meta">
	                                                            <div class="left">
	                                                                <div class="rating">
	                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
	                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
	                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
	                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
	                                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
	                                                                </div>
	                                                                <div class="price">
	                                                                	<% if(MostPurchaseList.get(j).getPricePromotion() != null &&
	                                                                			MostPurchaseList.get(j).getPricePromotion() < MostPurchaseList.get(j).getPrice()){ %>
		                                                                    <span class="price-new"><%=MostPurchaseList.get(j).getPricePromotion()%>đ</span>
		                                                                    <span class="price-old"><%=MostPurchaseList.get(j).getPrice()%>đ</span>
		                                                                <% }else{ %>
		                                                                	<span class="price-new"><%=MostPurchaseList.get(j).getPrice()%>đ</span>
		                                                                <% } %>
	                                                                </div>
	                                                            </div>
	                                                            <h3 class="name"><a href="product.html"><%=MostPurchaseList.get(j).getTitle()%></a></h3>
	
	                                                            <div class="description"><p><%=MostPurchaseList.get(j).getDescription()%></p></div>
	
	                                                            <div class="right">
	                                                                <div class="action">
	                                                                    <div class="cart">
	                                                                        <button onclick="window.location.href='cart.html'" class="btn btn-shopping-cart btn-outline-inverse">
	                                                                            <span class="fa fa-shopping-cart"></span>
	                                                                            Mua ngay
	                                                                        </button>
	                                                                    </div>
	                                                                    <div class="wishlist">
	                                                                        <a data-toggle="tooltip" data-placement="top" title="Xem chi tiết" class="btn btn-outline" href="product.html">
	                                                                            <span>Chi tiết</span>
	                                                                        </a>
	                                                                    </div>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                </div>
                                            	<% } %>
                                            	</div>
                                            </div>
                                       	<% i = (i+4)-1; } %>
                                    </div>
                                </div>
                                
		                        <script>
		                        $(function() {
		                            $('#producttabs1038579234 a:first').tab('show');
		                        })
		                        $('.tabcarousel1038579234').carousel({
		                            interval: false,
		                            auto: false,
		                            pause: 'hover'
		                        });
		                        </script>
                    		</div>
                		</div>
            		</div>
            	</div>
            </div>
			<!-- /Top product list: newest and most purchase -->
			
			<!-- Middle banner -->
			<div class="mass-bottom " id="pavo-mass-bottom">
                <div class="container">
                    <div class="inner">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                <div id="carousel1" class="box-banner box hidden-sm hidden-xs">
                                    <ul class="slides img-overlay">
                                        <li>
                                            <a href="javascript:void(0);"><img src="../image/banner/${MiddleBannerImage }" alt="banner" class="img-responsive" /></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
			<!-- /Middle banner -->
			
			<!-- Content: left menu & suggest product list -->
			<div class="container">
                <div class="row">
                    <aside id="sidebar-left" class="col-md-3">
                        <div id="column-left" class="hidden-xs sidebar">
                            <div class="category box box-success">
                                <div class="box-heading"><span>Chuyên mục</span></div>
                                <div class="box-content tree-menu">
                                    <ul class="box-category list-group accordion">
                                    	<c:forEach items="${CategoryList}" var="category">
                                    		<li class="list-group-item accordion-group">
                                            	<a href="category.html">${category.title }</a>
                                        	</li>
                                    	</c:forEach>
                                    </ul>
                                </div>
                            </div>
                            <script type="text/javascript">
                            $(document).ready(function() {
                                var active = $('.collapse.in').attr('id');
                                $('span[data-target=#' + active + ']').html("-");

                                $('.collapse').on('show.bs.collapse', function() {
                                    $('span[data-target=#' + $(this).attr('id') + ']').html("-");
                                });
                                $('.collapse').on('hide.bs.collapse', function() {
                                    $('span[data-target=#' + $(this).attr('id') + ']').html("+");
                                });
                            });
                            </script>

                            <div id="carousel0" class="box-banner box hidden-sm hidden-xs">
                                <ul class="slides img-overlay">
                                    <li>
                                        <a href="javascript:void(0);"><img src="../image/banner/${LeftBannerImage }" alt="banner" class="img-responsive" /></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </aside>

                    <section id="sidebar-main" class="col-md-9">
                        <div class="showcase " id="pavo-showcase">
                                <div class="inner">
                                    <div class="row products-row">
                                        <div class="col-xs-12">
                                            <h2 style="margin-top: 0px;">Sản phẩm nổi bật</h2>
                                        </div>
                                    </div>
                                    <% List<ProductModel> FeatureList = (List<ProductModel>)request.getAttribute("FeatureProductList");%>
                                    <% for(int i=0; i< FeatureList.size();i++){%>
                                     	<div class="row products-row">
                                     	<% for(int j=i;(j< i+3 && j < FeatureList.size());j++){ %>
                                      		<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 product-col">
		                                            <div class="product-block">
		                                                <div class="product-label">
		                                                    <div class="product-label-wapper">
		                                                        Xem Nhiều </div>
		                                                </div>
		                                                <div class="image">
		                                                    <a class="img" href="product.html"><img src="../image/product/<%=FeatureList.get(j).getImages().get(0) %>" alt="<%=FeatureList.get(j).getTitle() %>" class="img-responsive" /></a>
		                                                    <a href="../image/product/<%=FeatureList.get(j).getImages().get(0) %>" class="btn btn-outline-inverse colorbox product-zoom cboxElement" title="<%=FeatureList.get(j).getTitle() %>"><i class="fa fa-search-plus"></i></a>
		                                                    <div class="quickview">
		                                                        <a class="pav-colorbox btn btn-outline-inverse cboxElement " href="product.html" title="Xem nhanh" data-toggle="modal" data-target="#myModal"><em class="fa fa-eye"></em><span>Xem nhanh</span></a>
		                                                    </div>
		                                                </div>
		
		                                                <div class="product-meta">
		                                                    <div class="left">
		                                                        <div class="rating">
		                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
		                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
		                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
		                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
		                                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
		                                                        </div>
		                                                        <div class="price">
		                                                        	<% if(FeatureList.get(j).getPricePromotion() != null && 
		                                                        			FeatureList.get(j).getPricePromotion() < FeatureList.get(j).getPrice()){ %>
			                                                            <span class="price-new"><%=FeatureList.get(j).getPricePromotion()%>đ</span>
			                                                            <span class="price-old"><%=FeatureList.get(j).getPrice()%>đ</span>
			                                                        <% }else{ %>
			                                                        	<span class="price-new"><%=FeatureList.get(j).getPrice()%>đ</span>
			                                                        <% } %>
		                                                        </div>
		                                                    </div>
		                                                    <h3 class="name"><a href="product.html"><%=FeatureList.get(j).getTitle() %></a></h3>
		
		                                                    <div class="description"><p><%=FeatureList.get(j).getDescription() %></p></div>
		
		                                                    <div class="right">
		                                                        <div class="action">
		                                                            <div class="cart">
		                                                                <button onclick="window.location.href='cart.html'" class="btn btn-shopping-cart btn-outline-inverse">
		                                                                    <span class="fa fa-shopping-cart"></span>
		                                                                    Mua ngay
		                                                                </button>
		                                                            </div>
		                                                            <div class="wishlist">
		                                                                <a data-toggle="tooltip" data-placement="top" title="Xem chi tiết" class="btn btn-outline" href="product.html">
		                                                                    <span>Chi tiết</span>
		                                                                </a>
		                                                            </div>
		                                                        </div>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                        </div>
                                      	<% } %>
                                      	</div>
                                    <% i = i+3;} %>
                               </div>
                        </div>
                    </section>
                </div>
            </div>
            <!-- /Content: left menu & suggest product list -->
			
            <!-- Brand -->
            ${BrandHtml}
            <!-- /Brand -->
			
			<!-- Footer -->
			<%@ include file="../views/templates/footer.jsp"%>
			<!-- /Footer -->
			
		</div>
	</div>
</body>
</html>
