<%@ page contentType="text/html; charset=UTF-8" %>

<div class="container">
    <ul class="breadcrumb">
        <li><a href="index.html"><i class="fa fa-home"></i></a></li>
        <li><a href="cart.html">Giỏ hàng - Thanh toán</a></li>
    </ul>
    
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
                        <div class="col-xs-12">
                            <div class="alert alert-warning">
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
                            </div>
                        </div>
                        
                        
                        <!-- Cart-information -->
                        <%@ include file = "cart-information.jsp" %>
                        
                        
                        <!-- Shipping-address -->
                        <%@ include file = "shipping-address.jsp" %>
                        
                        
                   	</div>
                    <!-- end -->
                </div>
            </div>
        </section>
    </div>
</div>