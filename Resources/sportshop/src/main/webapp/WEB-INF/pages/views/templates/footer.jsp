<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="j2ee.group01.sportshop.model.CategoryModel"%>
<%@ page import="java.util.List"%>
<footer id="footer">

	<%@ include file="services.jsp"%>

	<div class="footer-bottom">
		<div class="container">
			<div class="inner">
				<div class="row">
					<div class="column col-xs-12 col-sm-6 col-lg-4 col-md-4">
						<div class="box info">
							<div class="box-heading">
								<span>Về chúng tôi</span>
							</div>
							<div class="box-content">
								<p>${ContractInformation.slogun }</p>
							</div>
							<div class="box pav-newsletter-social">
								<ul>
									<li class="blue"><a data-original-title="Facebook"
										data-placement="top" data-toggle="tooltip" href="https://www.facebook.com${ContractInformation.fbAddress }" title=""><i
											class="fa fa-facebook">&nbsp;</i></a></li>
									<li class="sky"><a data-original-title="Twitter"
										data-toggle="tooltip" href="https://twitter.com${ContractInformation.twtAddress }" title=""><i
											class="fa fa-twitter">&nbsp;</i></a></li>
									<li class="red"><a data-original-title="Google Plus"
										data-toggle="tooltip" href="#" title=""><i
											class="fa fa-google-plus">&nbsp;</i></a></li>
									<li class="nored"><a data-original-title="Pinterest"
										data-toggle="tooltip" href="#" title=""><i
											class="fa fa-pinterest">&nbsp;</i></a></li>
								</ul>
							</div>
						</div>
					</div>

					<div class="column col-xs-12 col-sm-6 col-lg-2 col-md-2">
						<div class="box">
							<div class="box-heading">
								<span>Thông tin</span>
							</div>
							<div class="box-content">
								<ul class="list bullet text-fill">
									<li><a href="../view/home" data-hover="Trang chủ">Trang
											chủ</a></li>
									<li><a href="../view/about" data-hover="Giới thiệu">Giới
											thiệu</a></li>
									<li><a href="../view/category" data-hover="Sản phẩm">Sản
											phẩm</a></li>
									<li><a href="../view/news" data-hover="Tin tức">Tin tức</a></li>
									<li><a href="../view/contact" data-hover="Liên hệ">Liên
											hệ</a></li>
								</ul>
							</div>
						</div>
					</div>

					<div class="column col-xs-12 col-sm-6 col-lg-2 col-md-2">
						<div class="box customer-service">
							<div class="box-heading">
								<span>Sản phẩm</span>
							</div>
							<div class="box-content">
								<ul class="list bullet text-fill">
									<% int count = 0;
										List<CategoryModel> CategoryFooterMenuList = (List<CategoryModel>)request.getAttribute("CategoryList");%>
									<% for(int j=0;(count < 5 && j<CategoryFooterMenuList.size());j++){ %>
										<% if(CategoryFooterMenuList.get(j).getIdParent() == null){ %>
											<li><a href="../view/category?id=<%=CategoryFooterMenuList.get(j).getId()%>"><%=CategoryFooterMenuList.get(j).getTitle()%></a></li>
										<% count++;} %>
									<% }%>
								</ul>
							</div>
						</div>
					</div>

					<div class="column col-xs-12 col-sm-6 col-lg-4 col-md-4">
						<div class="box">
							<div class="box-heading">
								<span>Liên hệ</span>
							</div>
							<div class="box-content">
								<ul class="list bullet text-fill">
									<li><a href="javascript:void(0);"><i
											class="fa fa-map-marker">&nbsp;</i>&nbsp;Địa chỉ: ${ContractInformation.address}</a></li>
									<li><a href="javascript:void(0);"><i
											class="fa fa-phone">&nbsp;</i>&nbsp;Điện thoại: ${ContractInformation.phone}</a></li>
									<li><a href="javascript:void(0);"><i class="fa fa-fax">&nbsp;</i>&nbsp;Fax: ${ContractInformation.fax}</li>
									<li><a href="javascript:void(0);"><i
											class="fa fa-envelope">&nbsp;</i>&nbsp; Email: ${ContractInformation.email}</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>

<div id="powered">
	<div class="container">
		<div class="inner">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div id="top">
						<a class="scrollup" href="#"><i class="fa fa-angle-up"></i>Top</a>
					</div>
					<div class="copyright pull-left">
						Sportshop - Copyright &copy; 2016. Phát triển bởi <a
							href="" title="Team01"
							target="_blank">Team 01</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>