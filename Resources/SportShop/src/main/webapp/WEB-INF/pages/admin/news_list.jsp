<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="j2ee.group01.sportshop.model.NewsModel"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<html>
<head>
<title>Danh sách bài viết</title>

<%@ include file="template/head.jsp"%>
<script type="text/javascript">
	function deleteNews(rowId,idr){
		var r = window.confirm("Bạn có thực sự muốn xóa bản tin này?");
		if(r==true){
			var rowidr = '#'+rowId;
			$.post("../admin/deleteNews", {
				id : idr
			})
			.done(function(data) {
				$(rowidr).remove();
				alert("Bài viết với mã "+idr+" đã được xóa khỏi hệ thống.");
			})
			.fail(
					function() {
						alert("Thất bại. Đã xảy ra lỗi trong quá trình xóa bài viết.");
					});
		}else{
			return false;
		}
		
	}
</script>


</head>
<body>

	<div id="wrapper">

		<!-- Navigation -->
		<%@ include file="template/navigation.jsp"%>


		<!-- Main content -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Danh sách bài viết</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">DANH SÁCH BÀI VIẾT</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table  width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
									<thead>
										<tr>
											<th>Title</th>
											<th>Author</th>
											<th>Newest Updated</th>
											<th>Views</th>
											<th>Short content</th>
											<th></th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<%
											List<NewsModel> newsListResult = new ArrayList<NewsModel>();
											newsListResult = (List<NewsModel>) request.getAttribute("NewsListResult");
										%>

										<%
											for (int i = 0; i < newsListResult.size(); i++) {
										%>
										<%
											if (i % 2 == 0) {
										%>
										<tr class="odd gradeA" id="<%="row" + i%>">
											<td><a
												href="../admin/editNews?id=<%=newsListResult.get(i).getId()%>"><%=newsListResult.get(i).getTitle()%></a></td>
											<td><%=newsListResult.get(i).getAuthor()%></td>
											<td><%=newsListResult.get(i).getDateUpdate()%></td>
											<td class="center"><%=newsListResult.get(i).getViews()%></td>
											<td class="center"><%=newsListResult.get(i).getShortDetail()%></td>
											<td><a
												href="../admin/editNews?id=<%=newsListResult.get(i).getId()%>"
												title="edit"><i class="glyphicon glyphicon-edit"></i></a> </td>
											<td><a href="javascript: void(0)"
												onclick="deleteNews('<%="row" + i%>',<%=newsListResult.get(i).getId()%>);"
												title="delete"><i class="glyphicon glyphicon-trash"></i></a>
											</td>
										</tr>
										<%
											} else {
										%>
										<tr class="even gradeA" id="<%="row" + i%>">
											<td><a
												href="../admin/editnews?id=<%=newsListResult.get(i).getId()%>"><%=newsListResult.get(i).getTitle()%></a></td>
											<td><%=newsListResult.get(i).getAuthor()%></td>
											<td><%=newsListResult.get(i).getDateUpdate()%></td>
											<td class="center"><%=newsListResult.get(i).getViews()%></td>
											<td class="center"><%=newsListResult.get(i).getShortDetail()%></td>
											<td><a
												href="../admin/editNews?id=<%=newsListResult.get(i).getId()%>"
												title="edit"><i class="glyphicon glyphicon-edit"></i></a> </td>
											<td><a href="javascript: void(0)"
												onclick="deleteNews('<%="row" + i%>',<%=newsListResult.get(i).getId()%>);"
												title="delete"><i class="glyphicon glyphicon-trash"></i></a>
											</td>
										</tr>
										<%
											}
										%>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- /#page-wrapper -->
	</div>

	<!-- Script files -->
	<%@ include file="template/foot.jsp"%>


	<!-- DataTables JavaScript -->
	<script
		src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
	<script
		src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
	<script
		src="../bower_components/datatables-responsive/js/dataTables.responsive.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>
</body>
</html>