<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ page import="j2ee.group01.sportshop.model.OrderModel"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SportShop | Danh sách đơn hàng</title>

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
					<h1 class="page-header">Danh sách đơn hàng</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">DANH SÁCH ĐƠN HÀNG</div>

						<%
							List<OrderModel> orderList = (List<OrderModel>) request.getAttribute("orderList");
							List<OrderModel> shippedOrderList = (List<OrderModel>) request.getAttribute("shippedOrderList");
						%>

						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table width="100%"
									class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>Đã giao</th>
											<th>Mã đơn hàng</th>
											<th>Họ tên</th>
											<th>Email</th>
											<th>Số điện thoại</th>
											<th>Địa chỉ</th>
											<th>Tổng tiền</th>
											<th>Chi tiết</th>
											<th>Xác nhận giao hàng</th>
										</tr>
									</thead>
									<tbody>
										<%
											for (int i = 0; i < orderList.size(); i++) {
												if (i % 2 == 0) {
										%>
										<tr class="odd gradeX">
											<td></td>
											<td><%=orderList.get(i).getId()%></td>
											<td><%=orderList.get(i).getFullname()%></td>
											<td><%=orderList.get(i).getEmail()%></td>
											<td><%=orderList.get(i).getPhone()%></td>
											<td><%=orderList.get(i).getAddress()%></td>
											<td><%=orderList.get(i).getTotalAmountReal()%></td>
											<td align="center"><a
												href="../admin/orderdetaillist?id=<%=orderList.get(i).getId()%>"
												onclick="" title="detail"><i
													class="glyphicon glyphicon-eye-open"></i></a></td>
											<td align="center"><a href="#" data-toggle="modal"
												title="confirm" onclick="myFunction(<%=orderList.get(i).getId()%>)"><i
													class="glyphicon glyphicon-send"></i></a></td>
										</tr>
										<%
											} else {
										%>
										<tr class="even gradeC">
											<td></td>
											<td><%=orderList.get(i).getId()%></td>
											<td><%=orderList.get(i).getFullname()%></td>
											<td><%=orderList.get(i).getEmail()%></td>
											<td><%=orderList.get(i).getPhone()%></td>
											<td><%=orderList.get(i).getAddress()%></td>
											<td><%=orderList.get(i).getTotalAmountReal()%></td>
											<td align="center"><a
												href="../admin/orderdetaillist?id=<%=orderList.get(i).getId()%>"
												onclick="" title="detail"><i
													class="glyphicon glyphicon-eye-open"></i></a></td>
											<td align="center"><a href="#" data-toggle="modal"
												title="confirm" onclick="myFunction(<%=orderList.get(i).getId()%>)"><i
													class="glyphicon glyphicon-send"></i></a></td>
										</tr>
										<%
											}
											}
										%>

										<%
											for (int i = 0; i < shippedOrderList.size(); i++) {
												if (i % 2 == 0) {
										%>
										<tr class="odd gradeX">
											<td align="center"><i class="glyphicon glyphicon-ok"></i></td>
											<td><%=shippedOrderList.get(i).getId()%></td>
											<td><%=shippedOrderList.get(i).getFullname()%></td>
											<td><%=shippedOrderList.get(i).getEmail()%></td>
											<td><%=shippedOrderList.get(i).getPhone()%></td>
											<td><%=shippedOrderList.get(i).getAddress()%></td>
											<td><%=shippedOrderList.get(i).getTotalAmountReal()%></td>
											<td align="center"><a href="#" onclick="" title="detail"><i
													class="glyphicon glyphicon-eye-open"></i></a></td>
											<td align="center"></td>
										</tr>
										<%
											} else {
										%>
										<tr class="even gradeC">
											<td align="center"><i class="glyphicon glyphicon-ok"></i></td>
											<td><%=shippedOrderList.get(i).getId()%></td>
											<td><%=shippedOrderList.get(i).getFullname()%></td>
											<td><%=shippedOrderList.get(i).getEmail()%></td>
											<td><%=shippedOrderList.get(i).getPhone()%></td>
											<td><%=shippedOrderList.get(i).getAddress()%></td>
											<td><%=shippedOrderList.get(i).getTotalAmountReal()%></td>
											<td align="center"><a href="#" onclick="" title="detail"><i
													class="glyphicon glyphicon-eye-open"></i></a></td>
											<td align="center"></td>
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
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->
	</div>

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
				responsive : true
			});
		});
		
		function myFunction(id) {
			
		    if (confirm("Bạn muốn xác nhận giao hàng?") == true) {
		    	
		    	$.post("../admin/confirmorder", {
					id : id
				})
				.done(
						function(data) {
							
							window.location.href = "../admin/orderlist";
						})
				.fail(
						function() {
							alert("false");
							
						});
		    } else {
		        
		    }
		    
		}
	</script>



</body>
</html>