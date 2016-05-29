<%@ page contentType="text/html; charset=UTF-8" %>

<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 shopping-cart inner ">
    <div class="cart-top">
        <div id="cart" class="clearfix">
            <div data-toggle="dropdown" data-loading-text="Loading..." class="heading media text-center dropdown-toggle">
                <i class="fa fa-shopping-cart icon-cart"></i>
                <span id="cart-total">2 sản phẩm- 550.000đ</span>
            </div>
            <ul class="dropdown-menu">
                <li>
                    <div class="mini-cart-info">
                        <table class="">
                            <tr>
                                <td class="text-left">
                                    <a href="product.html"><img src="image/cache/catalog/demo/7-70x71.png" alt="Double layer super soft" title="Bóng rỗ FQGS2" class="img-thumbnail" /></a>
                                </td>
                                <td class="text-left"><a href="product.html">Bóng rỗ FQGS2</a>
                                </td>
                                <td class="text-right">x 1</td>
                                <td class="text-right">150.000đ</td>
                                <td class="text-center"><button type="button" onclick="cart.remove('26');" title="Xóa khỏi giỏ hàng" class="btn btn-default btn-xs"><i class="fa fa-times"></i></button></td>
                            </tr>
                            <tr>
                                <td class="text-left">
                                    <a href="product.html"><img src="image/cache/catalog/demo/11-70x71.png" alt="Crossed Shirt - Belugas" title="Áo thun thể thao" class="img-thumbnail" /></a>
                                </td>
                                <td class="text-left"><a href="product.html">Áo thun thể thao</a>
                                </td>
                                <td class="text-right">x 1</td>
                                <td class="text-right">350.000đ</td>
                                <td class="text-center"><button type="button" onclick="cart.remove('25');" title="Xóa khỏi giỏ hàng" class="btn btn-default btn-xs"><i class="fa fa-times"></i></button></td>
                            </tr>
                        </table>
                    </div>
                </li>

                <li>
                    <div class="mini-cart-total">
                        <table class="">
                            <tr>
                                <td class="text-right"><strong>Tổng</strong></td>
                                <td class="text-right">500.000đ</td>
                            </tr>
                            <tr>
                                <td class="text-right"><strong>Thuế VAT (10%)</strong></td>
                                <td class="text-right">50.000đ</td>
                            </tr>
                            <tr>
                                <td class="text-right"><strong>Tổng cộng</strong></td>
                                <td class="text-right">550.000đ</td>
                            </tr>
                        </table>

                        <p class="checkout text-right"><a href="cart.html"><strong class="button btn btn-outline-inverse"><i class="fa fa-shopping-cart"></i> Xem giỏ hàng</strong></a>&nbsp;&nbsp;&nbsp;<a href="checkout.html"><strong class="button btn btn-outline-inverse"><i class="fa fa-share"></i> Thanh toán</strong></a></p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    </div>