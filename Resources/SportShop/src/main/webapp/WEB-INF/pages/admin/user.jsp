<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="j2ee.group01.sportshop.model.UserModel"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Danh sách người dùng</title>
    
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
                    <h1 class="page-header">Danh sách người dùng</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            DANH SÁCH NGƯỜI DÙNG
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>UserName</th>
                                            <th>Full Name</th>
                                            <th>Email</th>
                                            <th>&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
												List<UserModel> UserList = (List<UserModel>) request.getAttribute("UserList");
												for (int i = 0; i < UserList.size(); i++) {
											%>
                                        <tr>
                                            <td><%= i+1 %></td>
                                            <td><%= UserList.get(i).getUsername()%></td>
                                            <td><%= UserList.get(i).getFullname()%></td>
                                            <td><%= UserList.get(i).getEmail()%></td>
                                            <td>
                                            	<a href="../admin/edituser?id=<%= UserList.get(i).getId() %>" title="Xem chi tiết"><i class="fa fa-eye"></i></a>
                                            	<a id="delete-user" href="#" data-id="<%= UserList.get(i).getId() %>"  data-toggle="modal" title="Xóa người dùng" onclick="deleteUser(<%= UserList.get(i).getId() %>)">
                                            		<i class="fa fa-trash-o"></i>
                                            	</a>
                                            </td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    
    <!-- Script files -->
    <%@ include file = "template/foot.jsp" %>
    
<!--     <div class="modal fade" id="delete-user"> -->
<!-- 	    <div class="modal-dialog"> -->
<!-- 	        <div class="modal-content"> -->
<!-- 	            <div class="modal-header"> -->
<!-- 	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button> -->
<!-- 	                <h4 class="modal-title">Xóa người dùng</h4> -->
<!-- 	            </div> -->
<!-- 	            <div class="modal-body"> -->
<!-- 	                <div class="text-center"> -->
<!-- 	                	<strong><i class="fa fa-warning"></i> Cảnh báo:</strong> Dữ liệu bị xóa sẽ không thể khôi phục. -->
<!-- 	                	<p>Bạn có chắc muốn xóa liên hệ này?</p> -->
<!-- 	                </div> -->
<!-- 	            </div> -->
<!-- 	            <div class="modal-footer"> -->
<!-- 	                <button type="button" class="btn btn-default" data-dismiss="modal">Không, cảm ơn</button> -->
<!-- 	                <button type="button" class="btn btn-primary">Xóa</button> -->
<!-- 	            </div> -->
<!-- 	        </div> -->
<!-- 	    </div> -->
<!-- 	</div> -->
    
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
    
    function deleteUser(id) {
    	
//     	var id = $('#delete-user').attr('data-id');
    	$.post("../admin/deleteUser", {
			id : id		
		})
		.done(function(data) {
			alert("Xóa thành công");
			window.location.href="../admin/user";
		})
		.fail(
				function() {
					alert("Lỗi!");
				});
    }
    </script>
</body>
</html>