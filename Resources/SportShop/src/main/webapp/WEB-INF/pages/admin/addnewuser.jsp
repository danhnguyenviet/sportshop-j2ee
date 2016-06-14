<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="j2ee.group01.sportshop.model.UserModel"%>

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
                                            <input id="input-username" type="text" class="form-control" name="username" value="">
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
                                            <input id="input-password" type="text" class="form-control" name="password" value="">
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
                                            <input id="input-fullname" type="text" class="form-control" name="fullname" value="">
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
                                            <input id="input-email" type="text" class="form-control" name="email" value="">
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
                                        <input id="input-isactive" type="checkbox" name="isactive" value=1>Khóa tài khoản
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
                            <button type="submit" class="btn btn-danger" value="Send" onclick="postRequestToAdmin()" >ĐĂNG DỮ LIỆU</button>
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
    
    <script type="text/javascript">
    function postRequestToAdmin(){
		var fusername = document.getElementById("input-username").value;
		var fpassword = document.getElementById("input-password").value;
		var femail = document.getElementById("input-email").value;
		var ffullname = document.getElementById("input-fullname").value;
		var fisactive = document.getElementById("input-isactive").value;
		if(fusername.length < 1){
			document.getElementById('input-username').focus();
			alert("username đầy đủ không được để trống. Xin cám ơn!");
			return;
		}
		if(fpassword.length < 1){
			document.getElementById('input-password').focus();
			alert("password đầy đủ không được để trống. Xin cám ơn!");
			return;
		}
		if(femail.length < 1){
			document.getElementById('input-email').focus();
			alert("Email liên hệ không được để trống. Xin cám ơn!");
			return;
		}
		if(ffullname.length < 1){
			document.getElementById('input-fullname').focus();
			alert("fullname đầy đủ không được để trống. Xin cám ơn!");
			return;
		}
// 		if(fcontent.length < 1){
// 			document.getElementById('input-enquiry').focus();
// 			alert("Nội dung liên hệ không được để trống. Xin cám ơn!");
// 			return;
// 		}
		$.post("../admin/saveUserRequest", {
					username : fusername,
					password : fpassword,					
					fullname : ffullname,	
					email : femail,
					isactive: fisactive
				})
				.done(function(data) {
					alert("Thêm tài khoản thành công");
				})
				.fail(
						function() {
							alert("Hiện tại quá trình thêm tài khoản gặp lỗi. Vui lòng thử lại. Xin cám ơn!");
			
						});
	};
    </script>
</body>
</html>