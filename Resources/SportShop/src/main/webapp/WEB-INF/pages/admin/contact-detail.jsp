<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ page import="j2ee.group01.sportshop.model.ContractModel"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Chi tiết liên hệ</title>
    
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
                    <h1 class="page-header">Chi tiết liên hệ</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <style type="text/css">
                .list-unstyled li {
                    margin-bottom: 7px;
                }
            </style>

            	<% List<ContractModel> ContactList =  (List<ContractModel>)request.getAttribute("ContactList"); %>
	            <% List<Integer> CountContact =  (List<Integer>)request.getAttribute("countContact"); %>
            
            <div class="row">
            	
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
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h4><%= ContactDetail.getTitle() %> <span class="badge"><%= ContactDetail.displayState() %></span> <a href="../admin/contact-reply?id=<%=ContactDetail.getId() %>" class="pull-right"><i class="fa fa-reply"></i> Phản hồi</a></h4>
                            <hr/>
                            <p class="pull-right">
                                <select class="form-control">
                                    <option>Cập nhật trạng thái</option>
                                    <option id="reply">Đã phản hồi</option>
                                    <option id="spam">Span</option>
                                    <option id="nonespam">Không spam</option>
                                    <option id="deleted">Xóa</option>
                                </select>
                            </p>
                            <p><strong><%= ContactDetail.getFullname() %></strong> <a href="mailto:<%= ContactDetail.getEmail() %>"><%= ContactDetail.getEmail() %></a> vào lúc <%= ContactDetail.getDateCreate() %></p>
                            <p><strong>Địa chỉ: <%= ContactDetail.getAddress() %></strong></p>
                            <p><strong>Điện thoại: <%= ContactDetail.getPhone() %></strong></p>
                            <hr/>
                            <p><%= ContactDetail.getDetail() %></p>
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
    <%@ include file = "template/foot.jsp" %>
</body>
</html>