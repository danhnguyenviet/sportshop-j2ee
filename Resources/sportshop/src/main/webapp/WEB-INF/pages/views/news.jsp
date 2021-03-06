<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="j2ee.group01.sportshop.model.NewsModel"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Tin tức | Sportshop</title>
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
                        <div id="content">
                            <div class="pav-filter-blogs">
                                <div class="pav-blogs">
                                	
                               	 	<% List<NewsModel> NewsList =  (List<NewsModel>)request.getAttribute("NewsListResult");%>
                                    
                                    <div class="leading-blogs clearfix">
		                                        <div class="pavcol1">
		                                            <div class="blog-item box">
		                                                <h2 class="blog-title box-heading ">  <a href="../view/read_news?id=<%=NewsList.get(0).getId() %>" title="<%=NewsList.get(0).getTitle() %>"><%=NewsList.get(0).getTitle() %></a></h2>
		                                                <div class="box-content">
		                                                    <div class="blog-meta">
		                                                        <ul>
		                                                            <li class="created">
		                                                                <span class="fa fa-time ">   Đăng vào :</span> <%=NewsList.get(0).getDateCreate() %> </li>
		                                                            <li class="author"><span class="fa fa-pencil">   Đăng bởi: </span> <%=NewsList.get(0).getAuthor() %></li>
		                                                        </ul>
		                                                    </div>
		                                                    <div class="image">
		                                                        <img class="img-responsive" src="../image/news/<%=NewsList.get(0).getImage() %>" title="<%=NewsList.get(0).getTitle() %>" align="" />
		                                                    </div>
		
		                                                    <div class="blog-body">
		
		                                                        <div class="blog-header clearfix">
		                                                        </div>
		                                                        <div class="description">
		                                                        	<%=NewsList.get(0).getShortDetail() %>
		                                                        </div>
		                                                        <div class="blog-readmore"><a href="../view/read_news?id=<%=NewsList.get(0).getId() %>" class="button btn btn-default">Xem thêm</a></div>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                        </div>
		                                        <div class="clearfix"></div>
		                                    </div>
                                    
                                    <div class="secondary clearfix">
                                    <% for(int i = 1; i < NewsList.size(); i++){ %>
                                    	<div class="pavcol1">
		                                            <div class="blog-item box">
		                                                <h2 class="blog-title box-heading ">  <a href="../view/read_news?id=<%=NewsList.get(i).getId() %>" title="<%=NewsList.get(i).getTitle() %>"><%=NewsList.get(i).getTitle() %></a></h2>
		                                                <div class="box-content">
		                                                    <div class="blog-meta">
		                                                        <ul>
		                                                            <li class="created">
		                                                                <span class="fa fa-time ">   Đăng vào :</span> <%=NewsList.get(i).getDateCreate() %> </li>
		                                                            <li class="author"><span class="fa fa-pencil">   Đăng bởi: </span> <%=NewsList.get(i).getAuthor() %></li>
		                                                        </ul>
		                                                    </div>
		                                                    <div class="image">
		                                                        <img class="img-responsive" src="../image/news/<%=NewsList.get(i).getImage() %>" title="<%=NewsList.get(i).getTitle() %>" align="" />
		                                                    </div>
		
		                                                    <div class="blog-body">
		
		                                                        <div class="blog-header clearfix">
		                                                        </div>
		                                                        <div class="description">
		                                                        	<%=NewsList.get(i).getShortDetail() %>
		                                                        </div>
		                                                        <div class="blog-readmore"><a href="../view/read_news?id=<%=NewsList.get(i).getId() %>" class="button btn btn-default">Xem thêm</a></div>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                        </div>
		                                        <div class="clearfix"></div>
                                    <% } %>
                                    </div>
                                 
                                    <div>
                                        <ul class="pagination">
                                           <% if(((Integer)request.getAttribute("CurrentPage")).intValue()<=1){ %>
                                		<li class="disabled"><a href="news?page=${PrevPage }">&laquo;</a></li>
                                	<% }else{%>
                                		<li><a href="news?page=${PrevPage }">&laquo;</a></li>
                                	<% } %>
                                    
                                    <% for(int i=0;i < ((Integer)request.getAttribute("PageCount")).intValue();i++){ %>
                                    	<% if((i+1) == ((Integer)request.getAttribute("CurrentPage")).intValue()){ %>
                                    		<li class="active"><a href="news?page=<%=i+1 %>"><%=i+1 %></a></li>
                                    	<% }else{ %>
                                    		<li><a href="news?page=<%=i+1 %>"><%=i+1 %></a></li>
                                    	<% } %>
                                    <% } %>
                                    
                                    <% if(((Integer)request.getAttribute("CurrentPage")).intValue()>=
                                    	((Integer)request.getAttribute("PageCount")).intValue()){ %>
                                    	<li class="disabled"><a href="news?page=${NextPage }">&raquo;</a></li>
                                	<% }else{%>
                                		<li><a href="news?page=${NextPage }">&raquo;</a></li>
                                	<% } %>
                                        </ul>
                                    </div>
                                </div>
                            </div>
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
