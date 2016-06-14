<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ page import="j2ee.group01.sportshop.model.OrderDetailModel"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>SportShop | Chi tiết đơn hàng</title>
	
	<%@ include file="template/head.jsp" %>
</head>
<body>
	
	<div id="wrapper">

		<!-- Navigation -->
		<%@ include file = "template/navigation.jsp" %>
		
		
		<!-- Main content -->
		<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Chi tiết đơn hàng</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            DANH SÁCH ĐƠN HÀNG
                        </div>
                        
                        <%
						List<OrderDetailModel> orderDetailList = (List<OrderDetailModel>) request.getAttribute("orderDetailList");
						%>
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                        	<th>Mã chi tiết</th>
                                        	<th>Mã sản phẩm</th>
                                            <th>Số lượng</th>
                                            <th>Tổng tiền</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
											for (int i = 0; i < orderDetailList.size(); i++) {
												if (i % 2 == 0) {
										%>
										<tr class="odd gradeX">
											<td><%=orderDetailList.get(i).getId()%></td>
											<td><%=orderDetailList.get(i).getIdProduct()%></td>
											<td><%=orderDetailList.get(i).getQuantity()%></td>
											<td><%=orderDetailList.get(i).getTotal()%></td>
											
										</tr>
										<%
											} else {
										%>
										<tr class="even gradeC">
											<td><%=orderDetailList.get(i).getId()%></td>
											<td><%=orderDetailList.get(i).getIdProduct()%></td>
											<td><%=orderDetailList.get(i).getQuantity()%></td>
											<td><%=orderDetailList.get(i).getTotal()%></td>
											
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
	<%@ include file = "template/foot.jsp" %>
	
	<!-- DataTables JavaScript -->
    <script src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
    <script src="../bower_components/datatables-responsive/js/dataTables.responsive.js"></script>
    
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>
	
	

</body>
</html>