<%@ page contentType="text/html; charset=UTF-8"%>

<%@ page import="j2ee.group01.sportshop.model.ProductModel"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Danh sách sản phẩm</title>

<%@ include file="template/head.jsp"%>
</head>
<body>

	<div id="wrapper">

		<!-- Navigation -->
		<%@ include file="template/navigation.jsp"%>


		<!-- Main content -->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Danh sách sản phẩm</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Danh sách sản phẩm</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table width="100%"
									class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>Mã SP</th>
											<th>Tên SP</th>
											<th>Giá</th>
											<th>Giá khuyến mãi</th>
											<th>Số lượng</th>
											<th>Ngày tạo</th>
											<th>Lượt xem</th>
											<th>Lượt mua</th>
											<th></th>
											<th></th>
										</tr>
									</thead>
									<%
										List<ProductModel> newestProductList = (List<ProductModel>) request.getAttribute("newestProductList");
									%>
									<tbody>
										<%
											for (int i = 0; i < newestProductList.size(); i++) {
												if (i % 2 == 0) {
										%>
										<tr class="odd gradeX">
											<td><%=newestProductList.get(i).getCode()%></td>
											<td><%=newestProductList.get(i).getTitle()%></td>
											<td class="center"><%=newestProductList.get(i).getPrice()%></td>
											<td class="center"><%=newestProductList.get(i).getPricePromotion()%></td>
											<td class="center"><%=newestProductList.get(i).getQuantity()%></td>
											<td><%=newestProductList.get(i).getDateCreate()%></td>
											<td><%=newestProductList.get(i).getViews()%></td>
											<td><%=newestProductList.get(i).getPurchase()%></td>
											<td><a
												href="../admin/editproduct?id=<%=newestProductList.get(i).getId()%>"
												onclick="getIdProduct(<%=newestProductList.get(i).getId()%>)"
												title="edit"><i class="glyphicon glyphicon-edit"></i></a></td>
											<td><a href="#delete-modal" data-toggle="modal"
												title="delete"
												onclick="transformId(<%=newestProductList.get(i).getId()%>)"><i
													class="glyphicon glyphicon-trash"></i></a></td>
										</tr>
										<%
											} else {
										%>
										<tr class="even gradeC">
											<td><%=newestProductList.get(i).getCode()%></td>
											<td><%=newestProductList.get(i).getTitle()%></td>
											<td class="center"><%=newestProductList.get(i).getPrice()%></td>
											<td class="center"><%=newestProductList.get(i).getPricePromotion()%></td>
											<td class="center"><%=newestProductList.get(i).getQuantity()%></td>
											<td><%=newestProductList.get(i).getDateCreate()%></td>
											<td><%=newestProductList.get(i).getViews()%></td>
											<td><%=newestProductList.get(i).getPurchase()%></td>
											<td><a
												href="../admin/editproduct?id=<%=newestProductList.get(i).getId()%>"
												onclick="getIdProduct(<%=newestProductList.get(i).getId()%>)"
												title="edit"><i class="glyphicon glyphicon-edit"></i></a></td>
											<td><a href="#delete-modal" data-toggle="modal"
												title="delete"
												onclick="transformId(<%=newestProductList.get(i).getId()%>)"><i
													class="glyphicon glyphicon-trash"></i></a></td>
										</tr>
										<%
											}
											}
										%>

									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
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

	<!-- 	<a class="btn btn-primary" data-toggle="modal" href='#modal-id'>Trigger modal</a> -->
	<div class="modal fade" id="delete-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Thông báo</h4>
				</div>
				<div class="modal-body">
					<p>Bạn muốn xóa sản phẩm này?</p>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="input-id">
					<button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
					<button type="button" class="btn btn-primary"
						onclick="deleteProduct()">OK</button>
				</div>
			</div>
		</div>
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
                responsive: true
        });
    });
    
    function transformId(id) {
    	document.getElementById("input-id").value = id;
    	document.getElementById("input-dateCreate").value = dateUpdate;
    }
    
	
	function deleteProduct() {
		var id = document.getElementById("input-id").value;
		if (id.length < 1) {
			alert("Không nhận được dữ liệu!");
		}
		
		$.post("../admin/deleteproduct", {
			productId : id
				})
				.done(
						function(data) {
							window.location.href = "../admin/productlist";
						})
				.fail(
						function() {
							
							alert("false" + id);
							/* var message = ' <div class="alert alert-danger"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Cảnh báo! </strong> Đã xảy ra lỗi trong quá trình tạo mới sản phẩm. Vui lòng thử lại. </div>';
							$('#InformContentCartPage').append(message); */
						});
	};
    </script>
</body>
</html>