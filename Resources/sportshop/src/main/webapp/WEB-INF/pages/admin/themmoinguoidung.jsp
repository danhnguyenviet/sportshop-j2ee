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
                    <h1 class="page-header">Thêm mới người dùng</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            THÔNG TIN
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="form-group">
                                    <label class="control-label col-md-3">
                                        Tên đăng nhập
                                    </label>
                                    <div class="col-md-9">
                                        <div class="input-icon right">
                                            <input type="text" class="form-control" name="title" value="">
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">
                                        Mật khẩu
                                    </label>
                                    <div class="col-md-9">
                                        <div class="input-icon right">
                                            <input type="text" class="form-control" name="title" value="">
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">
                                        Họ và tên
                                    </label>
                                    <div class="col-md-9">
                                        <div class="input-icon right">
                                            <input type="text" class="form-control" name="title" value="">
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">
                                        Email
                                    </label>
                                    <div class="col-md-9">
                                        <div class="input-icon right">
                                            <input type="text" class="form-control" name="title" value="">
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">
                                        Điện thoại
                                    </label>
                                    <div class="col-md-9">
                                        <div class="input-icon right">
                                            <input type="text" class="form-control" name="title" value="">
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            PHÂN QUYỀN HỆ THỐNG
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <select class="form-control">
                                    <option>Mời chọn...</option>
                                    <option>Áo thun thể thao</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value="">Khóa tài khoản
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value="">Hiển thị
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            THAO TÁC
                        </div>
                        <div class="panel-body">
                            <button type="reset" class="btn btn-default">XÓA TẤT CẢ</button>
                            <button type="submit" class="btn btn-danger">ĐĂNG DỮ LIỆU</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    
    <!-- Script files -->
    <%@ include file = "template/foot.jsp" %>
</body>
</html>