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
                    <h1 class="page-header">Chi tiết đơn hàng</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            THÔNG TIN ĐẶT HÀNG
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="form-group">
                                    <label class="control-label col-md-2">
                                        Họ tên
                                    </label>
                                    <div class="col-md-10">
                                        <div class="input-icon right">
                                            <input type="text" class="form-control" name="title" value="">
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2">
                                        Số điện thoại
                                    </label>
                                    <div class="col-md-10">
                                        <div class="input-icon right">
                                            <input type="text" class="form-control"></input>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2">
                                        Địa chỉ Email
                                    </label>
                                    <div class="col-md-10">
                                        <div class="input-icon right">
                                            <input type="text" class="form-control"></input>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            THÔNG TIN NHẬN HÀNG
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group input-group">
                                        <span class="input-group-addon">Họ tên</span>
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group input-group">
                                        <span class="input-group-addon">Số điện thoại</span>
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group input-group">
                                        <span class="input-group-addon">Email</span>
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group input-group">
                                        <span class="input-group-addon">Công ty (Website)</span>
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group input-group">
                                        <span class="input-group-addon">Tỉnh/thành</span>
                                        <select class="form-control">
                                            <option>TP. Hồ Chí Minh</option>
                                            <option>Hà Nội</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group input-group">
                                        <span class="input-group-addon">Quận/huyện</span>
                                        <select class="form-control">
                                            <option>Quận 1</option>
                                            <option>Quận 2</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group input-group">
                                        <span class="input-group-addon">Địa chỉ</span>
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Ghi chú</label>
                                        <textarea class="form-control" rows="4"></textarea>
                                    </div> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            THÔNG TIN GIỎ HÀNG
                        </div>
                        <div class="panel-body">
                            <div class="media">
                                <a class="pull-left" href="#">
                                    <img class="media-object" src="#" alt="Image" width="80" height="80">
                                </a>
                                <div class="media-body">
                                    <h4 class="media-heading"><a href="#">Tên sản phẩm #1</a></h4>
                                    <p>250.000đ <strike>300.000đ</strike></p>
                                    <p><a href="#">Xem</a> | <a href="#">Sửa</a> | <a href="#">Xóa</a></p>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="media">
                                <a class="pull-left" href="#">
                                    <img class="media-object" src="#" alt="Image" width="80" height="80">
                                </a>
                                <div class="media-body">
                                    <h4 class="media-heading"><a href="#">Tên sản phẩm #2</a></h4>
                                    <p>250.000đ <strike>300.000đ</strike></p>
                                    <p><a href="#">Xem</a> | <a href="#">Sửa</a> | <a href="#">Xóa</a></p>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="media">
                                <a class="pull-left" href="#">
                                    <img class="media-object" src="#" alt="Image" width="80" height="80">
                                </a>
                                <div class="media-body">
                                    <h4 class="media-heading"><a href="#">Tên sản phẩm #2</a></h4>
                                    <p>250.000đ <strike>300.000đ</strike></p>
                                    <p><a href="#">Xem</a> | <a href="#">Sửa</a> | <a href="#">Xóa</a></p>
                                </div>
                            </div>
                            <hr/>
                            <div class="row">
                                <div class="col-md-5">
                                    Tổng cộng
                                </div>
                                <div class="col-md-7 text-right">
                                    <strong>1.230.000đ</strong>
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
                            <button type="submit" class="btn btn-danger">CẬP NHẬT DỮ LIỆU</button>
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