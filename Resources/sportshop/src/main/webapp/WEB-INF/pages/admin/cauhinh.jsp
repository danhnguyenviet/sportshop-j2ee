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
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Cấu hình</h1>
                    </div>
                    <!-- /.col-lg-12 -->

                    <div class="col-lg-12">
                        <div>

                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#general" aria-controls="home" role="tab" data-toggle="tab">Cấu hình chung</a></li>
                                <li role="presentation"><a href="#contact" aria-controls="profile" role="tab" data-toggle="tab">Thông tin liên hệ</a></li>
                                <li role="presentation"><a href="#map" aria-controls="settings" role="tab" data-toggle="tab">Bản đồ</a></li>
                                <li role="presentation"><a href="#alert" aria-controls="settings" role="tab" data-toggle="tab">Thông báo</a></li>
                                <li role="presentation"><a href="#code" aria-controls="settings" role="tab" data-toggle="tab">Cài đặt mã</a></li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane active" id="general">
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2">
                                            Hình logo (120x120)
                                        </div>
                                        <div class="col-md-10">
                                            <div class="getfile" style="border: 1px solid #ccc; padding: 20px;">
                                                <input type="file"></input>
                                            </div>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2">
                                            Hình icon logo (25x25)
                                        </div>
                                        <div class="col-md-10">
                                            <div class="getfile" style="border: 1px solid #ccc; padding: 20px;">
                                                <input type="file"></input>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="contact">
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2">
                                            Tên công ty
                                        </div>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" value="ABC"></input>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2">
                                            Địa chỉ
                                        </div>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" value="78/1 Phan Đình Phùng, TP. Hồ Chí Minh"></input>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2">
                                            Hotline
                                        </div>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" value="0909.999.999"></input>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2">
                                            Email
                                        </div>
                                        <div class="col-md-10">
                                            <input type="email" class="form-control" value="pnlinh93@gmail.com"></input>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2">
                                            Facebook (fanpage, user profile
                                        </div>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" value="facebook.com/pnlinh93"></input>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2">
                                            Google plus
                                        </div>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" value="facebook.com/pnlinh93"></input>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2">
                                            Instagram
                                        </div>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" value="facebook.com/pnlinh93"></input>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2">
                                            Pinterest
                                        </div>
                                        <div class="col-md-10">
                                            <input type="text" class="form-control" value="facebook.com/pnlinh93"></input>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="map">
                                    <br/>
                                    <div class="form-group input-group">
                                        <input type="text" class="form-control" placeholder="Nhập địa chỉ">
                                        <span class="input-group-btn">
                                            <button class="btn btn-default" type="button"><i class="fa fa-search"></i>
                                            </button>
                                        </span>
                                    </div>

                                    <br/>
                                    <div id="googleMap" style="width: 100%; height: 350px;"></div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="alert">
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2">
                                            Thông báo khi đặt hàng thành công
                                        </div>
                                        <div class="col-md-10">
                                            <textarea class="form-control" rows="3"></textarea>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2">
                                            Thông báo khi liên hệ thành công
                                        </div>
                                        <div class="col-md-10">
                                            <textarea class="form-control" rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div role="tabpanel" class="tab-pane" id="code">
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2">
                                            Mã google analytics
                                        </div>
                                        <div class="col-md-10">
                                            <textarea class="form-control" rows="3"></textarea>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="col-md-2">
                                            Mã code chat online
                                        </div>
                                        <div class="col-md-10">
                                            <textarea class="form-control" rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    
    <!-- Script files -->
    <%@ include file = "template/foot.jsp" %>
</body>
</html>