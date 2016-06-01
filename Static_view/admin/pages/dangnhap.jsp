<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Insert title here</title>
    
    <%@ include file="template/head.jsp" %>
</head>
<body>
    
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">ĐĂNG NHẬP VÀO HỆ THỐNG</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Email" name="email" type="email" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Mật khẩu" name="password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Nhớ mật khẩu
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="index.html" class="btn btn-lg btn-success btn-block">Đăng nhập</a>
                            </fieldset>
                        </form>
                        <br/>
                        <div class="info-message">
                            <p class="text-danger">Email hoặc mật khẩu không đúng. Vui lòng thử lại!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Script files -->
    <%@ include file = "template/foot.jsp" %>
</body>
</html>