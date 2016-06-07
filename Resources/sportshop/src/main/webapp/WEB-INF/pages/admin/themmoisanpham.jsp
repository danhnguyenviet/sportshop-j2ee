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
                    <h1 class="page-header">Thêm mới sản phẩm</h1>
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
                                    <label class="control-label col-md-2">
                                        Tên sản phẩm
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
                                        Đường dẫn
                                    </label>
                                    <div class="col-md-10">
                                        <div class="input-group">
                                            <span class="input-group-addon">http://www.sportshop.com/</span>
                                            <input type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2">
                                        Mô tả
                                    </label>
                                    <div class="col-md-10">
                                        <div class="input-icon right">
                                            <textarea class="form-control" rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            GIÁ & HÌNH ẢNH
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="form-group">
                                    <label class="control-label col-md-2">
                                        Giá
                                    </label>
                                    <div class="col-md-5">
                                        <div class="input-group">
                                            <span class="input-group-addon">Giá gốc</span>
                                            <input type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="input-group">
                                            <span class="input-group-addon">Giá giảm</span>
                                            <input type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2">
                                        Khác
                                    </label>
                                    <div class="col-md-5">
                                        <div class="input-group">
                                            <span class="input-group-addon">Mã sản phẩm</span>
                                            <input type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="input-group">
                                            <span class="input-group-addon">Số lượng hiện có</span>
                                            <input type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2">
                                        Hình đại diện
                                    </label>
                                    <div class="col-md-10">
                                        <div class="getfile" style="border: 1px solid #ccc; border-radius: 5px; padding: 20px;">
                                            <input type="file"></input>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-2">
                                        Bộ sưu tập
                                    </label>
                                    <div class="col-md-10">
                                        <div class="getfile" style="border: 1px solid #ccc; border-radius: 5px; padding: 20px;">
                                            <input type="file"></input>
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
                            DANH MỤC &AMP; TRẠNG THÁI
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <select class="form-control">
                                    <option>Mời chọn...</option>
                                    <option>Áo thun thể thao</option>
                                </select>
                            </div>

                            <a data-toggle="modal" href='#addcategory'><i class="fa fa-plus"></i> Thêm loại sản phẩm</a>
                            <div class="modal fade" id="addcategory">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title">Thêm loại sản phẩm</h4>
                                        </div>
                                        <div class="modal-body">
                                            <input type="text" class="form-control" placeholder="Nhập loại sản phẩm cần thêm..."></input>
                                            <p class="help-block">Ví dụ: Áo thun nam, Áo thun nữ,...</p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Thoát</button>
                                            <button type="button" class="btn btn-primary">Lưu và thoát</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>&nbsp;</label>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value="">Sản phẩm nổi bật
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value="">Sản phẩm mới
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value="">Giảm giá
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value="">Hết hàng
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
                            TAGS
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label>&nbsp;</label>
                                <label class="checkbox-inline">
                                    <input type="checkbox">Quần áo nam
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox">Giày thể thao
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox">Phụ kiện hỗ trợ
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox">Áo nữ
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox">Giày thể thao
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox">Phụ kiện hỗ trợ
                                </label>
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