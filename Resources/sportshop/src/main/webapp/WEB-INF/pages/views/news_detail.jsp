<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="j2ee.group01.sportshop.model.NewsModel"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>${NewsInformation.title } | Sportshop</title>
<%@ include file="../views/templates/head.jsp"%>

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
                    <li><a href="../view/news">Tin Tức</a></li>
                    <li><a href="../view/read_news?id=${NewsInformation.id }">${NewsInformation.title }</a></li>
             	</ul>
				<!-- /Site map -->
                <div class="row">
                  <aside id="sidebar-left" class="col-md-3">
                        <div id="column-left" class="hidden-xs sidebar">
                            <div class="box box-info latest_blog">
                                <div class="box-heading"><span class="box-title">Xem nhiều nhất</span></div>
                                <div class="box-content">
                                    <div class="pavblog-latest row">
                                    	<c:forEach items="${NewsMostViewListResult}" var="mostViewNews">
                                    		<div class="col-lg-12 col-md-12 col-sm-12">
	                                            <div class="blog-item">
	                                                <div class="blog-body">
	                                                    <div class="image">
	                                                        <img src="../image/news/${mostViewNews.image}" title="${mostViewNews.title}" alt="${mostViewNews.title}" class="img-responsive" />
	                                                    </div>
	                                                    <div class="create-info">
	                                                        <div class="blog-header">
	                                                            <h4 class="blog-title">
	                                                              <a href="../view/read_news?id=${mostViewNews.id}" title="${mostViewNews.title}">${mostViewNews.title}</a>
	                                                            </h4>
	                                                        </div>
	                                                        <div class="description">
	                                                            ${mostViewNews.shortDetail}...</div>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                        </div>
                                    	</c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div id="carousel0" class="box-banner box hidden-sm hidden-xs">
                                <ul class="slides img-overlay">
                                    <li>
                                        <a href="javascript:void(0);"><img src="../image/banner/${LeftBannerImage}" alt="banner" class="img-responsive" /></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </aside>
                  
                  <section id="sidebar-main" class="col-md-9">
                        <div id="content" class="">
                            <!-- Start Div Content -->

                            <div id="blog-info" class="pav-blog  wrapper blog-wrapper">
                                <header>
                                    <h1 class="blog-title">${NewsInformation.title }</h1></header>
                                <div class="content">
                                    <div class="image">
                                        <img class="img-responsive" src="../image/news/${NewsInformation.image }" title="Weatherproof Vintage Sweater " />
                                    </div>
                                </div>
                                <div class="blog-meta">
                                    <span class="author"><span>Đăng bởi: </span> ${NewsInformation.author }</span>
                                    <span class="created"><span>Đăng vào:  ${NewsInformation.dateCreate }</span></span>
                                </div>

                                <div class="description clearfix">
                                    <p>${NewsInformation.shortDetail}</p>
                                </div>
                                <div class="blog-content clearfix">
                                    <div class="content-wrap clearfix">
                                        <div class="itemFullText">
                                        	${NewsInformation.longDetail}
                                        </div>
                                    </div>
                                </div>

                                <div class="pav-comment">
                                    <h4>Thảo luận</h4>
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
                            <!-- End Div Content -->

                            <nav>
                                <ul class="pager">
                                    	<c:choose>
                                    		<c:when test="${BeforeNewsId > 0 }">
                                    			<li class="previous">
                                    				<a href="read_news?id=${BeforeNewsId}"><span aria-hidden="true">&larr;</span> Bài viết trước đó</a>
                                    			</li>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<li class="previous disabled">
                                    				<a href="read_news?id=${BeforeNewsId}"><span aria-hidden="true">&larr;</span> Bài viết trước đó</a>
                                    			</li>
                                    		</c:otherwise>
                                    	</c:choose>
                                    	
                                    	<c:choose>
                                    		<c:when test="${AfterNewsId > 0 }">
                                    			<li class="next">
                                    				<a href="read_news?id=${AfterNewsId}">Bài viết tiếp theo <span aria-hidden="true">&rarr;</span></a>
                                    			</li>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<li class="next disabled">
                                    				<a href="read_news?id=${AfterNewsId}">Bài viết tiếp theo <span aria-hidden="true">&rarr;</span></a>
                                    			</li>
                                    		</c:otherwise>
                                    	</c:choose>
                                </ul>
                            </nav>
                        </div>
                        <!-- End Div Row -->
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
