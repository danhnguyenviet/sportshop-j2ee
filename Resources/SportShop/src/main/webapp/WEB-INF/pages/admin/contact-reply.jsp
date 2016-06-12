<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ page import="j2ee.group01.sportshop.model.ContractModel"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Trả lời liên hệ</title>
    
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
                    <h1 class="page-header">Trả lời liên hệ</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <style type="text/css">
                .list-unstyled li {
                    margin-bottom: 7px;
                }
            </style>
            
            	
            <div class="row">
            	<% List<ContractModel> ContactList =  (List<ContractModel>)request.getAttribute("ContactList"); %>
	            <% List<Integer> CountContact =  (List<Integer>)request.getAttribute("countContact"); %>
            
	            <% ContractModel ContactDetail = (ContractModel)request.getAttribute("ContactDetail"); %>
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
                	<form action="" method="POST" id="reply-contact">
	                    <div class="panel panel-default">
	                        <div class="panel-heading">
	                            BIỂU MẪU GỬI MAIL
	                        </div>
	                        <div class="panel-body">
	                            <div class="form-group input-group">
	                                <span class="input-group-addon">Tiêu đề</span>
	                                <input type="text" class="form-control" placeholder="Tiêu đề" value="<%= ContactDetail.getTitle() %>">
	                            </div>
	                            <div class="form-group input-group">
	                                <span class="input-group-addon">Email người nhận</span>
	                                <input type="text" class="form-control" placeholder="Địa chỉ email người nhận" value="<%= ContactDetail.getEmail() %>">
	                            </div>
	                            <div class="form-group">
	                                <label>Nội dung</label>
	                                <textarea name="response" class="form-control" rows="8"></textarea>
	                            </div>
	                            <div class="form-group pull-right">
	                                <button class="btn btn-danger"><i class="fa fa-check"></i> Gửi</button>
	                            </div>
	                        </div>
	                        <!-- /.panel-body -->
	                    </div>
                    </form>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
        <!-- /#page-wrapper -->
        
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