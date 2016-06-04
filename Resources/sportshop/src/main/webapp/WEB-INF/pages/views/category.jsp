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
<title>${PageTitle} | Sportshop</title>
<%@ include file="../views/templates/head.jsp" %>
	
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
                    <li><a href="${SiteMapUrl}">${SiteMapTitle}</a></li>
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

							 <div class="box box-info products-latest">
                                <div class="box-heading">
                                    <span>Mới nhất</span>
                                    <em class="line"></em>
                                </div>
                                <div class="box-content">
                                    <div class="row products-row">
                                    	<% List<ProductModel> NewestList =  (List<ProductModel>)request.getAttribute("NewsestProductList");%>
                                        <% for(int i=0; i < NewestList.size(); i++){ %>
                                        	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 product-col">
	                                            <div class="product-block">
	                                                <div class="image">
	                                                    <a class="img" href="../view/product?id=<%=NewestList.get(i).getId()%>"><img src="../image/product/<%=NewestList.get(i).getImages().get(0) %>" alt="<%=NewestList.get(i).getTitle() %>" class="img-responsive" /></a>
	                                                </div>
	
	                                                <div class="product-meta">
	                                                    <div class="left">
	                                                        <div class="price">
	                                                            <span class="special-price">
	                                                            	<% if(NewestList.get(i).getPricePromotion() != null &&
	                                                            			NewestList.get(i).getPricePromotion() < NewestList.get(i).getPrice()){ %>
	                                                            		<%=NewestList.get(i).getPricePromotion() %>đ
	                                                            	<% }else{ %>
	                                                            		<%=NewestList.get(i).getPrice() %>đ
	                                                            	<% } %>
	                                                            </span>
	                                                        </div>
	                                                    </div>
	                                                    <h3 class="name"><a href="../view/product?id=<%=NewestList.get(i).getId()%>"><%=NewestList.get(i).getTitle() %></a></h3>
	                                                </div>
	                                            </div>
	                                        </div>
                                        <% } %>
                                   </div>
                                </div>
                            </div>
                            
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
                        <div id="content">
                        	<c:if test="${not empty CategoryInfoImage }">
                        		<div class="category-info clearfix hidden-xs hidden-sm">
	                                <div class="image"><img src="../image/category/${CategoryInfoImage}" alt="" class="img-responsive" /></div>
	                                <div class="category-description wrapper">
	                                    <div>${CategoryInfoDescription }</div>
	                                </div>
	                            </div>
                        	</c:if>
                        </div>
                        <div class="product-filter clearfix">
                            <div class="inner clearfix">
                                <div class="display">
                                    <div class="btn-group group-switch">
                                        <button type="button" id="list-view" class="btn btn-switch" data-toggle="tooltip" title="Danh sách"></button>
                                        <button type="button" id="grid-view" class="btn btn-switch active" data-toggle="tooltip" title="Lưới"></button>
                                        <span style="background:white;" class="btn btn-switch" data-toggle="tooltip" title="${MainTitle}">${MainTitle}</span>
                                    </div>
                                </div>
                                <div class="filter-right">
                                    <div class="sort pull-right">
                                    	<script type="text/javascript">
                                    		function changeSortMode(value){
                                    			window.location.href = "${PageLinkUrl}?id=${PageId}&page=${CurrentPage}&sort="+value;
                                    		}
                                    	</script>
                                    
                                        <span for="input-sort">Sắp xếp:</span>
                                        <select id="input-sort" class="form-control" onchange="changeSortMode(this.value);">
                                            <option value="0" selected="selected">Mặc định</option>
                                            <option value="1">Tên (A - Z)</option>
                                            <option value="2">Tên (Z - A)</option>
                                            <option value="3">Giá (Thấp &gt; Cao)</option>
                                            <option value="4">Giá (Cao &gt; Thấp)</option>
											<option value="5">Mua Nhiều (Thấp &gt; Cao)</option>
                                            <option value="6">Mua Nhiều (Cao &gt; Thấp)</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="products" class="product-grid">
                            <div class="products-block">
                            	<% List<ProductModel> MainProductList = (List<ProductModel>)request.getAttribute("ProductListResult"); %>
                                <% for(int i=0; i < MainProductList.size();i++){ %>
                                	<div class="row products-row">
                                	<% for(int j=i;(j < i+3 && j < MainProductList.size());j++){ %>
                                		<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 product-col">
	                                        <div class="product-block">
	                                            <div class="product-label">
	                                                <div class="product-label-wapper">
	                                                	<% if(MainProductList.get(j).getPricePromotion() != null &&
	                                                			MainProductList.get(j).getPricePromotion() < MainProductList.get(j).getPrice()){ %>  
	                                                		Giảm Giá
	                                                	<% }else{ %>
	                                                		Hot
	                                                	<% } %>  
													</div>
	                                            </div>
	                                            <div class="image">
	                                                <a class="img" href="../view/product?id=<%=MainProductList.get(j).getId()%>"><img src="../image/product/<%=MainProductList.get(j).getImages().get(0) %>" alt="<%=MainProductList.get(j).getTitle() %>" class="img-responsive" /></a>
	                                                <a href="../image/product/<%=MainProductList.get(j).getImages().get(0) %>" class="btn btn-outline-inverse colorbox product-zoom cboxElement" title="<%=MainProductList.get(j).getTitle() %>"><i class="fa fa-search-plus"></i></a>
	                                                <div class="quickview">
	                                                    <a class="pav-colorbox btn btn-outline-inverse cboxElement " href="../view/product?id=<%=MainProductList.get(j).getId()%>" title="Xem nhanh"  data-toggle="modal" data-target="#myModal"><em class="fa fa-eye"></em><span>Xem nhanh</span></a>
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
	                                                    	<% if(MainProductList.get(j).getPricePromotion() != null &&
	                                                			MainProductList.get(j).getPricePromotion() < MainProductList.get(j).getPrice()){ %>  
		                                                		<span class="price-new"><%=MainProductList.get(j).getPricePromotion() %>đ</span>
	                                                        	<span class="price-old"><%=MainProductList.get(j).getPrice() %>đ</span>
		                                                	<% }else{ %>
		                                                		<span class="price-new"><%=MainProductList.get(j).getPrice() %>đ</span>
		                                                	<% } %> 
	                                                        
	                                                    </div>
	                                                </div>
	                                                <h3 class="name"><a href="../view/product?id=<%=MainProductList.get(j).getId()%>"><%=MainProductList.get(j).getTitle() %></a></h3>
	
	                                                <div class="description"><p><%=MainProductList.get(j).getDescription() %></p></div>
	
	                                                <div class="right">
	                                                    <div class="action">
	                                                        <div class="cart">
	                                                            <button onclick="window.location.href='../view/cart'" class="btn btn-shopping-cart btn-outline-inverse">
	                                    							<span class="fa fa-shopping-cart"></span>
	                                    							Mua ngay
	                                                            </button>
	                                                        </div>
	                                                        <div class="wishlist">
	                                                            <a data-toggle="tooltip" data-placement="top" title="Xem chi tiết" class="btn btn-outline" href="../view/product?id=<%=MainProductList.get(j).getId()%>">
	                                                                <span>Chi tiết</span>
	                                                            </a>
	                                                        </div>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
                                	<%} %>
                                	</div>
                                <% i = (i+3)-1; } %>
                           	</div>
                        </div>
                        <div class="paging clearfix">
                            <div class="pull-left">
                                <ul class="pagination">
                                	<% if(((Integer)request.getAttribute("CurrentPage")).intValue()<=1){ %>
                                		<li class="disabled"><a href="#">&laquo;</a></li>
                                	<% }else{%>
                                		<li><a href="${PageLinkUrl}?id=${PageId}&page=${PrevPage}&sort=${SortMode}">&laquo;</a></li>
                                	<% } %>
                                    
                                    <% for(int i=0;i < ((Integer)request.getAttribute("CountPage")).intValue();i++){ %>
                                    	<% if((i+1) == ((Integer)request.getAttribute("CurrentPage")).intValue()){ %>
                                    		<li class="active"><a href="${PageLinkUrl}?id=${PageId}&page=<%=i+1 %>&sort=${SortMode}"><%=i+1 %></a></li>
                                    	<% }else{ %>
                                    		<li><a href="${PageLinkUrl}?id=${PageId}&page=<%=i+1 %>&sort=${SortMode}"><%=i+1 %></a></li>
                                    	<% } %>
                                    <% } %>
                                    
                                    <% if(((Integer)request.getAttribute("CurrentPage")).intValue()>=
                                    	((Integer)request.getAttribute("CountPage")).intValue()){ %>
                                    	<li class="disabled"><a href="#">&raquo;</a></li>
                                	<% }else{%>
                                		<li><a href="${PageLinkUrl}?id=${PageId}&page=${NextPage}&sort=${SortMode}">&raquo;</a></li>
                                	<% } %>
                                </ul>
                            </div>
                            <div class="pull-right">Đang hiển thị 1 - ${CountProduct } sản phẩm (trong ${CountPage } trang)</div>
                        </div>
                    </section>
                
                
               	</div>
            </div>
            <!-- /Content: left menu & suggest product list -->
			
			<!-- Footer -->
			<%@ include file="../views/templates/footer.jsp"%>
			<!-- /Footer -->
			
		</div>
	</div>
</body>
</html>
