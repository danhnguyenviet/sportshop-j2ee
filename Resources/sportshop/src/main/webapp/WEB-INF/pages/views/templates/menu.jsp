<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="j2ee.group01.sportshop.model.ProductModel"%>
<%@ page import="j2ee.group01.sportshop.model.CategoryModel"%>
<%@ page import="java.util.List"%>

<script type="text/javascript">

	function goToSearchResultSport(){
		var keyword = document.getElementById("txtSearchValueInput").value;
		keyword = keyword.trim();
		if(keyword.length < 1){
			alert("Vui lòng nhập từ khóa tìm kiếm. Xin cám ơn!");
			return;
		}
		window.location.href = "../view/search?id="+keyword;	
	}

</script>


<div id="pav-mainnav">
    <div class="container">
        <div class="inner">
            <div class="row">
                <div class="col-lg-9 col-md-9 col-sm-9 col-sx-12">
                    <div class="mainnav-wrap">
                        <button data-toggle="offcanvas" class="btn btn-primary canvas-menu hidden-lg hidden-md" type="button">
                            <span class="fa fa-bars"></span> Menu</button>
                        <div class="pav-megamenu">
                            <div class="navbar">
                                <div id="mainmenutop" class="megamenu" role="navigation">
                                    <div class="navbar-header">
                                        <a href="javascript:;" data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle">
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </a>
                                        <div class="collapse navbar-collapse navbar-ex1-collapse">
                                            <ul class="nav navbar-nav megamenu">
                                                <li class="home"><a href="../view/home"><span class="menu-title">Trang chủ</span></a></li>
                                                <li><a href="../view/about"><span class="menu-title">Giới thiệu</span></a></li>
                                                <li class=" aligned-left parent dropdown "><a href="../view/category" class="dropdown-toggle" data-toggle="dropdown"><span class="menu-title">Sản phẩm</span><b class="caret"></b></a>
                                                    <div class="dropdown-menu" style="width:700px">
                                                        <div class="dropdown-menu-inner">
                                                            <div class="row">
                                                            	<% List<CategoryModel> CategoryMenuList = (List<CategoryModel>)request.getAttribute("CategoryList");%>
                                                            	<% for(int i=0;i<CategoryMenuList.size();i++){ %>
                                                            		<% if(CategoryMenuList.get(i).getIdParent() == null){ %>
                                                            			<div class="mega-col col-xs-12 col-sm-12 col-md-3 ">
		                                                                    <div class="mega-col-inner">
		                                                                        <div class="pavo-widget" id="pavowid-50">
		                                                                            <div class="pavo-widget" id="pavowid-790836132">
		                                                                                <div class="widget-heading box-heading">
		                                                                                	<a href="../view/category?id=<%=CategoryMenuList.get(i).getId()%>"> 
		                                                                                		<span class="title"><%=CategoryMenuList.get(i).getTitle() %>
		                                                                                		</span>
		                                                                                	</a>
		                                                                                </div>
		                                                                                <div class="">
		                                                                                    <ul>
		                                                                                    	<% for(int j=0;j<CategoryMenuList.size();j++){ %>
		                                                                                    		<% if(CategoryMenuList.get(j).getIdParent() == CategoryMenuList.get(i).getId()){ %>
		                                                                                    			<li><a href="../view/category?id=<%=CategoryMenuList.get(j).getId()%>"><span class="title"><%=CategoryMenuList.get(j).getTitle() %></span></a></li>
		                                                                                    		<% } %>
		                                                                                    	<% } %>
		                                                                                    </ul>
		                                                                                </div>
		                                                                            </div>
		                                                                        </div>
		                                                                    </div>
		                                                                </div>
                                                            		<% } %>
                                                            	<% } %>
                                                            	</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class=" aligned-left parent dropdown "><a href="../view/sale" class="dropdown-toggle" data-toggle="dropdown"><span class="menu-title">Khuyến mãi</span><b class="caret"></b></a>
                                                    <div class="dropdown-menu" style="width:350px">
                                                        <div class="dropdown-menu-inner">
                                                            <div class="row">
                                                                <div class="mega-col col-xs-12 col-sm-12 col-md-12 ">
                                                                    <div class="mega-col-inner">
                                                                        <div class="pavo-widget">
                                                                            <div class="pavo-widget">
                                                                                <div class="widget-product-list sidebar">
                                                                                    <div class="widget-inner">
                                                                                    	<% List<ProductModel> SaleList = (List<ProductModel>)request.getAttribute("SaleProductList"); %>
                                                                                    	<% for(int i =0; i < SaleList.size();i++){ %>
                                                                                    		<div class="w-product clearfix col-lg-12 col-md-12 col-sm-12 col-xs-12">
	                                                                                            <div class="product-block">
	                                                                                                <div class="image">
	                                                                                                    <a class="img" href="../view/product?id=<%=SaleList.get(i).getId() %>"><img width="50px" height="50px" src="../image/product/<%=SaleList.get(i).getImages().get(0) %>" alt="<%=SaleList.get(i).getTitle() %>" class="img-responsive" /></a>
	                                                                                                </div>
	
	                                                                                                <div class="product-meta">
	                                                                                                    <div class="left">
	                                                                                                        <div class="price">
	                                                                                                        	<span class="special-price"><%=SaleList.get(i).getPricePromotion()%>đ</span>
                                                                                                                <span class="price-old"><%=SaleList.get(i).getPrice()%>đ</span>
	                                                                                                        </div>
	                                                                                                    </div>
	                                                                                                    <h3 class="name"><a href="../view/product?id=<%=SaleList.get(i).getId() %>"><%=SaleList.get(i).getTitle() %></a></h3>
	                                                                                                </div>
	                                                                                            </div>
	                                                                                        </div>
                                                                                    	<% } %>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class=""><a href="../view/news"><span class="menu-title">Tin tức</span></a></li>
                                                <li class=""><a href="../view/contact"><span class="menu-title">Liên hệ</span></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 hidden-xs">
                    <div  class="search-box search-inline">
                        <div class="input-group">
                            <input id="txtSearchValueInput" type="text" name="search" placeholder="Tìm kiếm..." value="" class="input-search form-control" />
                            <span class="input-group-addon">       
                               <button class="button-search fa fa-search" type="button" onclick="goToSearchResultSport();"></button>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</header>
<!-- /header -->


<!-- sys-notification -->
            <div id="sys-notification">
                <div class="container">
                    <div id="notification"></div>
                </div>
            </div>
            <!-- /sys-notification -->