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
<title>${ProductInformation.title } | Sportshop</title>
<%@ include file="../views/templates/head.jsp"%>

<script type="text/javascript">
	function addCart(){
		var rquantity = document.getElementById("input-quantity").value;
		var producId = ${ProductInformation.id};
		if(!parseInt(rquantity) || parseInt(rquantity) < 1){
			document.getElementById('input-quantity').value = "1";
			document.getElementById('input-quantity').focus();
			alert("Số lượng tối thiểu là 1. Xin cám ơn!");
			return;
		}
		$.post( "../view/addToCart", { id: producId, quantity: rquantity })
		  .done(function( data ) {
			  $('#topCartPanelToAjax').html(data+"");
		  })
		  .fail(function() {
		    alert( "Đã xảy ra lỗi trong quá trình thêm vào giỏ hàng. Vui lòng thử lại." );
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
			
			<!-- Content: left menu & suggest product list -->
			<div class="container">
				<!-- Site map -->
				<ul class="breadcrumb">
                    <li><a href="../view/home"><i class="fa fa-home"></i></a></li>
                    <li><a href="../view/category?id=${CategoryInformation.id }">${CategoryInformation.title }</a></li>
                    <li><a href="../view/product?id=${ProductInformation.id }">${ProductInformation.title }</a></li>
             	</ul>
				<!-- /Site map -->
                <div class="row">
                    <aside id="sidebar-left" class="col-md-3">
                        <div id="column-left" class="hidden-xs sidebar">
                            <div class="category box box-success">
                                <div class="box-heading"><span>Chuyên mục</span></div>
                                <div class="box-content tree-menu">
                                    <ul class="box-category list-group accordion">
                                    	<c:forEach items="${CategoryList}" var="category">
                                    		<li class="list-group-item accordion-group">
                                            	<a href="../view/category?id=${category.id }">${category.title }</a>
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
                        </div>
                    </aside>

                    <section id="sidebar-main" class="col-md-9">
                        <div id="content">
                            <div class="product-info">
                                <div class="row">
                                    <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12 image-container">
                                        <div id="img-detail" class="image">
                                            <div class="product-label">
                                                <div class="product-label-wapper">
                                                	<c:choose>
													  <c:when test="${not empty ProductInformation.pricePromotion && ProductInformation.price > ProductInformation.pricePromotion}">
													    Giảm Giá
													  </c:when>
													  <c:otherwise>
													    Hot
													  </c:otherwise>
													</c:choose>
                                                </div>
                                            </div>
                                            <a href="../image/product/${ProductInformation.images.get(0) }" title="Crossed Shirt - Belugas" class="imagezoom">
                                                <img itemprop="image" src="../image/product/${ProductInformation.images.get(0) }" title="Crossed Shirt - Belugas" alt="Crossed Shirt - Belugas" id="image" data-zoom-image="../image/product/${ProductInformation.images.get(0) }" class="product-image-zoom img-responsive" />
                                            </a>
                                        </div>

                                        <div class="thumbs-preview">
                                            <div class="image-additional slide carousel vertical" id="image-additional">
                                                <div id="image-additional-carousel" class="carousel-inner">
                                                    <% List<String> ListImage = (List<String>)((ProductModel)request.getAttribute("ProductInformation")).getImages();%>
                                                    <% for(int i=0; i < ListImage.size();i++){ %>
                                                    	<div class="item clearfix">
                                                    	<% for(int j = i;(j < 3+i && j < ListImage.size());j++){ %>
                                                    		<a href="../image/product/<%=ListImage.get(j) %>" title="Crossed Shirt - Belugas" class="imagezoom" data-zoom-image="../image/product/<%=ListImage.get(j) %>" data-image="../image/product/<%=ListImage.get(j) %>">
	                                                            <img src="../image/product/<%=ListImage.get(j) %>" style="max-width:87px" title="Crossed Shirt - Belugas" alt="${ProductInformation.title }" data-zoom-image="../image/product/<%=ListImage.get(j) %>" class="product-image-zoom img-responsive" />
	                                                        </a>
                                                    	<% } %>
                                                    	</div>
                                                    <% i = (i+3)-1;} %>
                                                </div>

                                                <!-- Controls -->
                                                <a class="carousel-control left center" href="#image-additional" data-slide="next">
                                                    <i class="fa fa-angle-left"></i>
                                                </a>
                                                <a class="carousel-control right center" href="#image-additional" data-slide="prev">
                                                    <i class="fa fa-angle-right"></i>
                                                </a>
                                            </div>
                                            <script type="text/javascript">
                                            $('#image-additional .item:first').addClass('active');
                                            $('#image-additional').carousel({
                                                interval: false
                                            })
                                            </script>

                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7">
                                        <h1 class="title-product">${ProductInformation.title }</h1>

                                        <div class="rating">
                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
                                        </div>
                                        <ul class="list-unstyled description">
                                            <li><br></li>
                                            <li><i class="fa fa-chevron-down"></i><b>Nhãn:</b> ${ProductInformation.alias }</li>
                                            <li><i class="fa fa-chevron-down"></i><b>Mã sản phẩm:</b> ${ProductInformation.code }</li>
                                            <li><i class="fa fa-chevron-down"></i><b class="availability">Trạng thái:</b>
                                            		<c:choose>
													  <c:when test="${not empty ProductInformation.quantity && ProductInformation.quantity > 0}">
													    Còn Hàng
													  </c:when>
													  <c:otherwise>
													    Tạm Hết Hàng
													  </c:otherwise>
													</c:choose> 
											</li>
                                        </ul>

                                        <div class="price">
                                            <ul class="list-unstyled">
                                            	<c:choose>
													  <c:when test="${not empty ProductInformation.pricePromotion && ProductInformation.price > ProductInformation.pricePromotion}">
													   	<li> <span class="price-new"> ${ProductInformation.pricePromotion }đ </span> <span class="price-old">${ProductInformation.price }đ</span> </li>
													  </c:when>
													  <c:otherwise>
													    <li> <span class="price-new"> ${ProductInformation.price }đ </span> </li>
													  </c:otherwise>
													</c:choose>
                                            </ul>
                                        </div>

                                        <div id="product" class="product-extra ">
                                            <div class="qty">
                                                <div class="quantity-adder clearfix">
                                                    <div class="quantity-number pull-left">
                                                        <span>Số lượng</span>
                                                        <input type="text" name="quantity" value="1" size="2" id="input-quantity" class="form-control" />
                                                    </div>

                                                    <div class="quantity-wrapper pull-left">
                                                        <span class="add-up add-action fa fa-plus"></span>
                                                        <span class="add-down add-action fa fa-minus"></span>
                                                    </div>
                                                </div>
                                                <input type="hidden" name="product_id" value="40" />
                                            </div>

                                            <div class="btn-group-justified">
                                                <div class="cart pull-left">
                                                    <button type="button" id="button-cart" data-loading-text="Loading..." class="btn btn-outline-inverse" onclick="addCart()"><span class="fa fa-shopping-cart" "></span>Thêm vào giỏ hàng</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tabs-group box">
                                <div class="htabs" id="tabs">
                                    <ul class="nav nav-pills clearfix">
                                        <li class="active"><a href="#tab-description" data-toggle="tab">Mô tả</a></li>
                                        <li><a href="#tab-review" data-toggle="tab">Bình luận</a></li>
                                    </ul>
                                </div>

                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab-description">
                                        <div>
                                       		${ProductInformation.description}
                                       	</div>
                                    </div>

                                    <div class="tab-pane" id="tab-review">
										 <div class="panel-body">
                                               		<div id="fb-root"></div>
													<script>(function(d, s, id) {
														$(".fb-comments").attr("data-href", window.location.href);
													  var js, fjs = d.getElementsByTagName(s)[0];
													  if (d.getElementById(id)) return;
													  js = d.createElement(s); js.id = id;
													  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.6";
													  fjs.parentNode.insertBefore(js, fjs);
													}(document, 'script', 'facebook-jssdk'));</script>
													<div class="fb-comments" data-href="" data-numposts="5"></div>
                                               	</div>
                                </div>

                                    </div>
                                </div>
                            </div>
                            <div class="box products-related">
                                <div class="tab-nav">
                                    <ul class="nav nav-pills">
                                        <li class="active"><a data-toggle="tab">Sản phẩm liên quan (${ProductListResult.size() })</a></li>
                                    </ul>
                                </div>
                                <div id="product-related" class="slide" data-interval="0">
                                    <div class="carousel-controls">
                                        <a class="carousel-control left" href="#product-related" data-slide="prev">
                                            <i class="fa fa-angle-left"></i>
                                        </a>
                                        <a class="carousel-control right" href="#product-related" data-slide="next">
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                    <div class="products-block carousel-inner">
                                    	<% List<ProductModel> RecommandList = (List<ProductModel>)request.getAttribute("ProductListResult"); %>
                                    	<div class="item active">
                                            <div class="row products-row">
	                                    	<% for(int i=0; (i < 3 && i < RecommandList.size());i++){ %>
	                                    		<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 product-col">
                                                    <div class="product-block">
                                                        <div class="product-label">
                                                            <div class="product-label-wapper">
                                                            	<% if(RecommandList.get(i).getPricePromotion() != null &&
                                                            			RecommandList.get(i).getPricePromotion() < RecommandList.get(i).getPrice()){ %>
                                                            	Giảm Giá
                                                            	<% }else{ %>
                                                            	Hot
                                                            	<% } %>
                                                            </div>
                                                        </div>
                                                        <div class="image">
                                                            <a class="img" href="../view/product?id=<%=RecommandList.get(i).getId() %>"><img src="../image/product/<%=RecommandList.get(i).getImages().get(0) %>" alt="<%=RecommandList.get(i).getTitle() %>" class="img-responsive" /></a>
                                                            <a href="<%=RecommandList.get(i).getTitle() %>" class="btn btn-outline-inverse colorbox product-zoom cboxElement" title="<%=RecommandList.get(i).getTitle() %>"><i class="fa fa-search-plus"></i></a>
                                                            <div class="quickview">
                                                                <a class="pav-colorbox btn btn-outline-inverse cboxElement " href="../view/product?id=<%=RecommandList.get(i).getId() %>" title="Xem nhanh"><em class="fa fa-eye"></em><span>Xem nhanh</span></a>
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
                                                                	<% if(RecommandList.get(i).getPricePromotion() != null &&
                                                            			RecommandList.get(i).getPricePromotion() < RecommandList.get(i).getPrice()){ %>
		                                                            		<span class="price-new"><%=RecommandList.get(i).getPricePromotion() %>đ</span>
                                                                    		<span class="price-old"><%=RecommandList.get(i).getPrice() %>đ</span>
		                                                            	<% }else{ %>
		                                                            		<span class="price-new"><%=RecommandList.get(i).getPrice() %>đ</span>
		                                                            	<% } %>
                                                                    
                                                                </div>
                                                            </div>
                                                            <h3 class="name"><a href="../view/product?id=<%=RecommandList.get(i).getId() %>"><%=RecommandList.get(i).getTitle() %></a></h3>

                                                            <div class="description"><p><%=RecommandList.get(i).getDescription() %></p></div>

                                                            <div class="right">
                                                                <div class="action">
                                                                    <div class="cart">
                                                                        <button onclick="window.location.href='../view/cart'" class="btn btn-shopping-cart btn-outline-inverse">
                                                                            <span class="fa fa-shopping-cart"></span>
                                                                            Mua ngay
                                                                        </button>
                                                                    </div>
                                                                    <div class="wishlist">
                                                                        <a data-toggle="tooltip" data-placement="top" title="Xem chi tiết" class="btn btn-outline" href="../view/product?id=<%=RecommandList.get(i).getId() %>">
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
                                        
                                        	<% for(int i=3; (i < RecommandList.size());i++){ %>
	                                        	<div class="item">
	                                            	<div class="row products-row">
	                                            	<% for(int j=i; (j < i+3 && j < RecommandList.size());j++){ %>
			                                    		<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 product-col">
		                                                    <div class="product-block">
		                                                        <div class="product-label">
		                                                            <div class="product-label-wapper">
		                                                            	<% if(RecommandList.get(j).getPricePromotion() != null &&
		                                                            			RecommandList.get(j).getPricePromotion() < RecommandList.get(j).getPrice()){ %>
		                                                            	Giảm Giá
		                                                            	<% }else{ %>
		                                                            	Hot
		                                                            	<% } %>
		                                                            </div>
		                                                        </div>
		                                                        <div class="image">
		                                                            <a class="img" href="../view/product?id=<%=RecommandList.get(j).getId() %>"><img src="../image/product/<%=RecommandList.get(j).getImages().get(0) %>" alt="<%=RecommandList.get(j).getTitle() %>" class="img-responsive" /></a>
		                                                            <a href="<%=RecommandList.get(j).getTitle() %>" class="btn btn-outline-inverse colorbox product-zoom cboxElement" title="<%=RecommandList.get(j).getTitle() %>"><i class="fa fa-search-plus"></i></a>
		                                                            <div class="quickview">
		                                                                <a class="pav-colorbox btn btn-outline-inverse cboxElement " href="../view/product?id=<%=RecommandList.get(j).getId() %>" title="Xem nhanh"><em class="fa fa-eye"></em><span>Xem nhanh</span></a>
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
		                                                                	<% if(RecommandList.get(j).getPricePromotion() != null &&
		                                                            			RecommandList.get(j).getPricePromotion() < RecommandList.get(j).getPrice()){ %>
				                                                            		<span class="price-new"><%=RecommandList.get(j).getPricePromotion() %>đ</span>
		                                                                    		<span class="price-old"><%=RecommandList.get(j).getPrice() %>đ</span>
				                                                            	<% }else{ %>
				                                                            		<span class="price-new"><%=RecommandList.get(j).getPrice() %>đ</span>
				                                                            	<% } %>
		                                                                    
		                                                                </div>
		                                                            </div>
		                                                            <h3 class="name"><a href="../view/product?id=<%=RecommandList.get(j).getId() %>"><%=RecommandList.get(j).getTitle() %></a></h3>
		
		                                                            <div class="description"><p><%=RecommandList.get(j).getDescription() %></p></div>
		
		                                                            <div class="right">
		                                                                <div class="action">
		                                                                    <div class="cart">
		                                                                        <button onclick="window.location.href='../view/cart'" class="btn btn-shopping-cart btn-outline-inverse">
		                                                                            <span class="fa fa-shopping-cart"></span>
		                                                                            Mua ngay
		                                                                        </button>
		                                                                    </div>
		                                                                    <div class="wishlist">
		                                                                        <a data-toggle="tooltip" data-placement="top" title="Xem chi tiết" class="btn btn-outline" href="../view/product?id=<%=RecommandList.get(j).getId() %>">
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
                                            <% i = (i+3)-1;} %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
               	</div>
            </div>
            <script type="text/javascript" src="../catalog/view/javascript/jquery/elevatezoom/elevatezoom-min.js"></script>
            <script type="text/javascript">
            var zoomCollection = '#image';
            $(zoomCollection).elevateZoom({
                lensShape: "basic",
                lensSize: 150,
                easing: true,
                gallery: 'image-additional-carousel',
                cursor: 'pointer',
                galleryActiveClass: "active"
            });
            </script>
            <!-- /Content: left menu & suggest product list -->
			
			<!-- Footer -->
			<%@ include file="../views/templates/footer.jsp"%>
			<!-- /Footer -->
			
		</div>
	</div>
</body>
</html>
