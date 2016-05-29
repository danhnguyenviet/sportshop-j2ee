<%@ page contentType="text/html; charset=UTF-8" %>

<div id="topbar">
    <div class="container">
        <div class="show-desktop">
            <div class="quick-top-link pull-right">
                <ul class="links hidden-xs">
                    <li><a href="cart.html"><i class="fa fa-bookmark"></i>Giỏ hàng</a></li>
                    <li><a class="last" href="cart.html"><i class="fa fa-share"></i>Thanh toán</a></li>
                </ul>

                <!-- Single button -->
                <div class="btn-group setting">
                    <div class="dropdown-toggle btn-theme-normal" data-toggle="dropdown">
                        <i class="fa fa-cog"></i>
                        <span class="text-label">Tùy chọn</span>
                        <span class="fa fa-angle-down"></span>
                    </div>
                    <div class="quick-setting dropdown-menu">
                        <div class="language">
                            <form action="#" method="post" enctype="multipart/form-data" id="language">
                                <div class=" box-language">
                                    <label>Ngôn ngữ</label>
                                    <ul class=" langs-wrapper">
                                        <li>
                                            <a href="ar"><img src="image/flags/ar.png" alt="Arabic" title="Arabic" /> Tiếng Việt</a>
                                        </li>
                                        <li>
                                            <a href="en"><img src="image/flags/gb.png" alt="English" title="English" /> English</a>
                                        </li>
                                    </ul>
                                </div>
                            </form>
                        </div>
                        <div class="currency">
                            <form action="#" method="post" id="currency">
                                <div class="box-currency">
                                    <label>Đơn vị</label>
                                    <ul class="">
                                        <li><button class="currency-select list-item" type="button" name="EUR">đ</button>: VNĐ</li>
                                        <li><button class="currency-select list-item" type="button" name="USD">$ </button>: USD</li>
                                    </ul>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="show-mobile hidden-lg hidden-md hidden-sm">
            <div class="quick-access btn-group pull-right">
                <div class="dropdown-toggle btn-theme-normal" data-toggle="dropdown">
                    <i class="fa fa-shopping-cart"></i>
                    <span>Giỏ hàng</span>
                    <i class="fa fa-angle-down"></i>
                </div>
                <div class="inner-toggle dropdown-menu quick-setting">
                    <ul class="links">
                        <li><a href="cart.html"><i class="fa fa-bookmark"></i>Giỏ hàng</a></li>
                        <li><a class="last" href="cart.html"><i class="fa fa-share"></i>Thanh toán</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- header -->
<header id="header">
    <div id="header-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 logo inner">
                    <div id="logo-theme" class="logo-store pull-left">
                        <a href="index.html" class="img-responsive"><span>SportShop</span></a>
                    </div>
                </div>

                <div class="col-lg-6 col-md-6 hidden-xs hidden-sm inner">
                    <div class="box-customer hidden-tablet pull-left">
                        <div class="box-style service-1">
                            <h4><a href="javascript:void(0);">Giao hàng miễn phí</a></h4>
                            <p><a href="javascript:void(0);">Tất cả sản phẩm</a></p>
                        </div>
                        <div class="box-style service-2">
                            <h4><a href="javascript:void(0);">Hoàn trả tiền</a></h4>
                            <p><a href="javascript:void(0);">Nếu sản phẩm hư</a></p>
                        </div>
                        <div class="box-style service-3">
                            <h4><a href="javascript:void(0);">Quà hàng tuần</a></h4>

                            <p><a href="javascript:void(0);">Quà tặng</a></p>
                        </div>
                    </div>
                </div>

                
                <%@ include file= "../cart/top-cart.jsp" %>
                
            </div>
        </div>
    </div>