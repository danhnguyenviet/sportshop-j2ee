<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>${NewsInformation.title }</title>

<%@ include file="template/head.jsp"%>
<script type="text/javascript"
	src="../catalog/view/javascript/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="../catalog/view/javascript/jquery/jquery-1.9.1.js"></script>
<script type="text/javascript">
	function resizeIframe(obj) {
		obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
	};

	function backToNewsList() {
		window.location.href = "../admin/news";

	}
	$(function() {
		$('#insertNewsForm')
				.submit(
						function() {
							$('#errorShowDiv').html("");
							var titleStr = document.getElementById("txtTitle").value;
							if (titleStr.trim().length < 1) {
								var html_string = '<p style="color:red;font-style:italic;font-size:14px;">Tiêu đề không được để trống!</p>';
								$('#errorShowDiv').html(html_string);
								return false;
							}
							var shortContentStr = document
									.getElementById("txtShortContent").value;
							if (shortContentStr.trim().length < 100) {
								var html_string = '<p style="color:red;font-style:italic;font-size:14px;">Giới thiệu ngắn tối thiểu 100 kí tự!</p>';
								$('#errorShowDiv').html(html_string);
								return false;
							}
							var longContentStr = document
									.getElementById("txtLongContent").value;
							if (longContentStr.trim().length < 300) {
								var html_string = '<p style="color:red;font-style:italic;font-size:14px;">Nội dung bài viết tối thiểu 300 kí tự!</p>';
								$('#errorShowDiv').html(html_string);
								return false;
							}
							// DO STUFF
							return true; // return false to cancel form action
						});
	});
</script>
</head>
<body>

	<div id="wrapper">

		<!-- Navigation -->
		<%@ include file="template/navigation.jsp"%>


		<!-- Main content -->
		<!--  class="col-lg-8"-->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Thêm mới bài viết</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div>
					<div class="panel panel-default">
						<div class="panel-heading">THÔNG TIN</div>

						<form id="insertNewsForm" action="doEditNews" method="POST"
							enctype="multipart/form-data" target="myframe" accept-charset="UTF-8" accept-encoding="UTF-8" >
							<input type="hidden" value="${NewsInformation.id }" name="id" />
							<div class="panel-body">
								<div class="row">
									<div class="form-group">
										<label class="control-label col-md-2"> Tên bài viết </label>
										<div class="col-md-10">
											<div class="input-icon right">
												<input type="text" class="form-control" name="title"
													value="${NewsInformation.title }" id="txtTitle">
											</div>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-2"> Mô tả ngắn </label>
										<div class="col-md-10">
											<div class="input-icon right">
												<textarea class="form-control" rows="3" name="shortContent"
													id="txtShortContent">${NewsInformation.shortDetail }</textarea>
											</div>
										</div>
										<div class="clearfix"></div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-2"> Nội dung bài
											viết </label>
										<div class="col-md-10">
											<div class="input-icon right">
												<textarea class="form-control" rows="20" name="longContent"
													id="txtLongContent">${NewsInformation.longDetail }</textarea>
											</div>
										</div>
										<div class="clearfix"></div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-2"> Hình đại diện </label>
										<div class="col-md-10">
											<div class="getfile"
												style="border: 1px solid #ccc; border-radius: 5px; padding: 20px;">
												<img src="../image/news/${NewsInformation.image }"
													width="300px" height="200px" />
												<p style="font-style: italic; color: red;">(*) Hình ảnh
													đại diện không được phép thay đổi.</p>
											</div>
										</div>
										<div class="clearfix"></div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-2"> </label>
										<div class="col-md-10">
											<input type="submit" value="Cập nhật" /> <input type="button"
												value="Cancel" onclick="backToNewsList();" /> <br>
											<div class="clearfix"></div>
										</div>
										<div class="clearfix"></div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-2"> </label>
										<div class="col-md-10" id="errorShowDiv"></div>
										<div class="clearfix"></div>
									</div>

									<div class="form-group">
										<label class="control-label col-md-2"> </label>
										<div class="col-md-10">
											<iframe id="outputFrame" width="100%" height="0"
												name="myframe" frameborder="0" scrolling="no"
												onload="resizeIframe(this)"></iframe>

										</div>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>
			<!-- /.row -->

		</div>
		<!-- /#page-wrapper -->
	</div>

	<!-- Script files -->
	<%@ include file="template/foot.jsp"%>
</body>
</html>