<%@ page contentType="text/html; charset=UTF-8" %>

<!-- header -->
<header id="header">
    <div id="header-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 logo inner">
                    <div id="logo-theme" class="logo-store pull-left">
                        <a href="views/home" class="img-responsive"><span>SportShop</span></a>
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

                <div id="topCartPanelToAjax">
                	<%@ include file= "../templates/top-cart.jsp" %>
                </div>
                
                
            </div>
        </div>
    </div>