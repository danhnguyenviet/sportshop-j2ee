<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Insert title here</title>
    
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
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li>
                                    <a href="#">Liên hệ mới <span class="badge pull-right">42</span></a>
                                </li>
                                <li>
                                    <a href="#">Chưa phản hồi <span class="badge pull-right">13</span></a>
                                </li>
                                <li>
                                    <a href="#">Tất cả <span class="badge pull-right">60</span></a>
                                </li>
                                <hr/>
                                <li>
                                    <a href="#">Đã xóa <span class="badge pull-right">13</span></a>
                                </li>
                                <li>
                                    <a href="#">Đã phản hồi <span class="badge pull-right">13</span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h4>Lorem ipsum dolor sit amet, consectetuer adipiscing elit <span class="badge">Đã phản hồi</span> <a href="#" class="pull-right"><i class="fa fa-reply"></i> Phản hồi</a></h4>
                            <hr/>
                            <p class="pull-right">
                                <select class="form-control">
                                    <option>Cập nhật trạng thái</option>
                                    <option>Đã phản hồi</option>
                                    <option>Span</option>
                                    <option>Không spam</option>
                                    <option>Xóa</option>
                                </select>
                            </p>
                            <p><strong>Phạm Ngọc Linh</strong> <a href="mailto:pnlinh93@gmail.com"></a> vào lúc 8:00 AM 25/10/2016</p>
                            <p><strong>Địa chỉ: address</strong></p>
                            <p><strong>Điện thoại: 0909.987.522</strong></p>
                            <hr/>
                            <p><strong>Lorem ipsum dolor sit amet</strong>, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                            proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                            proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
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