<%@ page language="java" contentType="text/html; charset=UTF-8"%>


<%@ page import="j2ee.group01.sportshop.model.ContractModel"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Danh sách liên hệ</title>
    
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
                    <h1 class="page-header">Danh sách liên hệ</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <style type="text/css">
                .list-unstyled li {
                    margin-bottom: 7px;
                }
            </style>
            <!-- /.row -->
            
            
            
            <div class="row">
	            <% List<ContractModel> ContactList =  (List<ContractModel>)request.getAttribute("ContactList"); %>
	            <% List<Integer> CountContact =  (List<Integer>)request.getAttribute("countContact"); %>
                <div class="col-lg-3">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li>
                                    <a href="../admin/contact?state=new">Liên hệ mới <span class="badge pull-right"><%= CountContact.get(1) %></span></a>
                                </li>
                                <li>
                                    <a href="../admin/contact?state=nonereply">Chưa phản hồi <span class="badge pull-right"><%= CountContact.get(2) %></span></a>
                                </li>
                                <li>
                                    <a href="../admin/contact">Tất cả <span class="badge pull-right"><%= CountContact.get(0) %></span></a>
                                </li>
                                <hr/>
                                <li>
                                    <a href="../admin/contact?state=deleted">Đã xóa <span class="badge pull-right"><%= CountContact.get(3) %></span></a>
                                </li>
                                <li>
                                    <a href="../admin/contact?state=reply">Đã phản hồi <span class="badge pull-right"><%= CountContact.get(4) %></span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            DANH SÁCH LIÊN HỆ
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Mã</th>
                                            <th>Họ tên</th>
                                            <th>Email</th>
                                            <th>Tiêu đề</th>
                                            <th>Nội dung</th>
                                            <th>Trạng thái</th>
                                            <th>&nbsp;</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                    	<% for(int i=0; i < ContactList.size(); i++){
                                    		if (i % 2 == 0) { %>
		                                        <tr class="odd gradeX">
		                                            <td><%= ContactList.get(i).getId() %></td>
		                                            <td><%= ContactList.get(i).getFullname() %></td>
		                                            <td><%= ContactList.get(i).getEmail() %></td>
		                                            <td class="center"><%= ContactList.get(i).getTitle() %></td>
		                                            <td class="center"><%= ContactList.get(i).getDetail() %></td>
		                                            <td><%= ContactList.get(i).getState() %></td>
		                                            <td>
		                                            	<a href="../admin/contact-detail?id=<%=ContactList.get(i).getId()%>" title="Xem chi tiết">
		                                            		<i class="fa fa-eye"></i>
		                                            	</a>
		                                            	<a href="#delete-contact" data-toggle="modal" title="Xóa liên hệ">
		                                            		<i class="fa fa-trash-o"></i>
		                                            	</a>
		                                            </td>
		                                        </tr>
		                                     <% } else { %>
		                                        <tr class="even gradeC">
		                                            <td><%= ContactList.get(i).getId() %></td>
		                                            <td><%= ContactList.get(i).getFullname() %></td>
		                                            <td><%= ContactList.get(i).getEmail() %></td>
		                                            <td class="center"><%= ContactList.get(i).getTitle() %></td>
		                                            <td class="center"><%= ContactList.get(i).getDetail() %></td>
		                                            <td><%= ContactList.get(i).getState() %></td>
		                                            <td>
		                                            	<a href="../admin/contact-detail?id=<%=ContactList.get(i).getId()%>" title="Xem chi tiết">
		                                            		<i class="fa fa-eye"></i>
		                                            	</a>
		                                            	<a href="#delete-contact" data-toggle="modal" title="Xóa liên hệ">
		                                            		<i class="fa fa-trash-o"></i>
		                                            	</a>
		                                            </td>
		                                        </tr>
		                                      <% } %>
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
                <!-- /.col-lg-12 -->
            </div>
        </div>
        <!-- /#page-wrapper -->
    </div>
    
    <div class="modal fade" id="delete-contact">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title">Xóa liên hệ</h4>
	            </div>
	            <div class="modal-body">
	                <div class="text-center">
	                	<strong><i class="fa fa-warning"></i> Cảnh báo:</strong> Dữ liệu bị xóa sẽ không thể khôi phục.
	                	<p>Bạn có chắc muốn xóa liên hệ này?</p>
	                </div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">Không, cảm ơn</button>
	                <button type="button" class="btn btn-primary">Xóa</button>
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