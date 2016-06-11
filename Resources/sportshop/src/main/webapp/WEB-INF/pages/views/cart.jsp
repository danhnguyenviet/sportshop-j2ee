<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="j2ee.group01.sportshop.model.ShoppingCart" %>
<%@ page import="j2ee.group01.sportshop.model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Giỏ Hàng - Thanh Toán| Sportshop</title>
<%@ include file="../views/templates/head.jsp"%>

</head>
<body class="main-menu-fixed common-home page-common-home layout-fullwidth">
	<div class="row-offcanvas row-offcanvas-left">
		<div id="page">
			<!-- Header -->
			<%@ include file="../views/templates/header.jsp"%>
			<!-- /Header -->

			<!-- Menu -->
			<%@ include file="../views/templates/menu.jsp"%>
			<!-- /Menu -->
			
			<!-- Content: left menu & suggest product list -->
			<div class="container">
				<!-- Site map -->
				<ul class="breadcrumb">
                    <li><a href="../view/home"><i class="fa fa-home"></i></a></li>
                    <li><a href="../view/cart">Giỏ Hàng - Thanh Toán</a></li>
               	</ul>
				<!-- /Site map -->
            	
            	<!-- Content -->
            	<style>
                    .contact-content .fa {
                        width: 20px;
                        height: 20px;
                        line-height: 20px;
                        border-radius: 0%;
                    }
                </style>
                <div class="row">
                    <section id="sidebar-main" class="col-md-12">
                        <div id="content">
                            <div class="wrapper no-margin">
                                <h1>Thông tin giỏ hàng</h1>
                                <div class="row contact-content">
                                    <div class="col-xs-12" id="InformContentCartPage">
                                    	<%if(CurrentShoppingCart == null || CurrentShoppingCart.getAllProduct().size() < 1){ %>
                                    		<div class="alert alert-success">
	                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	                                            <strong>Thông báo! </strong> Đang có 0 sản phẩm trong giỏ hàng của bạn. <a href="../view/home" class="alert-link">Tiếp tục mua sắm</a>
	                                        </div>
                                    	<% } %>
                                    	
                                        <!-- <div class="alert alert-warning">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                            <strong>Nhắc nhở! </strong> Bạn vừa thêm một sản phẩm vào giỏ hàng của bạn
                                        </div>
                                        <div class="alert alert-success">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                            <strong>Thông báo! </strong> Thanh toán giỏ hàng thành công
                                            <p>
                                                <br>Tổng số tiền thanh toán: <span class="text-danger">550.000đ</span>. Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi. Sản phẩm sẽ được chuyển đến nơi trong vòng 24 giờ kể từ lúc này.
                                                <a href="index.html" class="alert-link">Tiếp tục mua sắm</a>
                                            </p>
                                        </div>
                                        <div class="alert alert-success">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                            <strong>Thông báo! </strong> Đang có 0 sản phẩm trong giỏ hàng của bạn. <a href="index.html" class="alert-link">Tiếp tục mua sắm</a>
                                        </div>
                                        <div class="alert alert-warning">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                            <strong>Nhắc nhở! </strong> Số lượng sản phẩm tối thiểu là 1. Xin cảm ơn!
                                        </div>
                                        <div class="alert alert-success">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                            <strong>Thông báo! </strong> Giỏ hàng đã được cập nhật thành công
                                        </div>
                                        <div class="alert alert-danger">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                            <strong>Cảnh báo! </strong> Sản phẩm đã được xóa khỏi giỏ hàng
                                        </div> -->
                                    </div>
									
									<div id="contentCartPanelToAjax">
										<%@ include file="../views/templates/cart-content.jsp"%>
									</div>
									
                                    <div class="col-ld-4 col-md-5 col-sm-12 col-xs-12">
                                        <h3>Địa chỉ nhận hàng</h3>
                                        <form action="#" method="post" enctype="multipart/form-data" class="form-horizontal ">
                                            <fieldset class="">
                                                <div class="content">
                                                    <div class="form-group required">
                                                        <label class="col-sm-3 control-label" for="input-name">Tên của bạn</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" name="name" value="" id="input-name" class="form-control"  placeholder="Ví dụ: Lâm Xung" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group required">
                                                        <label class="col-sm-3 control-label" for="input-email">Số điện thoại</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" name="email" value="" id="input-phone" class="form-control" placeholder="Ví dụ: 0979 79 79 79" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group required">
                                                        <label class="col-sm-3 control-label" for="input-email">Địa chỉ email</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" name="email" value="" id="input-email" class="form-control" placeholder="Ví dụ: support@sportshop.com.vn" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group required">
                                                        <label class="col-sm-3 control-label" for="input-email">Tỉnh/Thành phố</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" name="email" value="" id="input-province" class="form-control" placeholder="Ví dụ: TP. Hồ Chí Minh" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group required">
                                                        <label class="col-sm-3 control-label" for="input-email">Quận/Huyện</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" name="email" value="" id="input-district" class="form-control" placeholder="Ví dụ: Gò Vấp" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group required">
                                                        <label class="col-sm-3 control-label" for="input-email">Xã/Phường</label>
                                                        <div class="col-sm-9">
                                                           <input type="text" name="email" value="" id="input-wards" class="form-control" placeholder="Ví dụ: 12" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group required">
                                                        <label class="col-sm-3 control-label" for="input-email">Số nhà, đường</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" name="email" value="" id="input-street" class="form-control" placeholder="Ví dụ: 362 Phan Huy Ích" />
                                                        </div>
                                                    </div>
                                                </div>

                                            </fieldset>

                                        </form>
                                    </div>
                                    <!-- end1 -->
                                </div>
                                <!-- end -->
                            </div>
                        </div>
                    </section>
                </div>
            
            	<!-- /Content -->
            	    
            </div>
            <!-- /Content: left menu & suggest product list -->
			
			<!-- Footer -->
			<%@ include file="../views/templates/footer.jsp"%>
			<!-- /Footer -->
			
		</div>
	</div>
</body>
</html>
