<%@ page contentType="text/html; charset=UTF-8" %>

    
<div class="col-sm-12 col-md-7 col-xs-12">
    <p>Quý khách vui lòng điền địa chỉ nhận hàng trước khi thanh toán. Xin cảm ơn!</p>
    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <td>Hình</td>
                    <td>Tên</td>
                    <td>Mẫu</td>
                    <td>Số lượng</td>
                    <td>Đơn giá</td>
                    <td><strong>Tổng</strong></td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="cart-page-img">
                        <a href="product.html"><img src="image/cache/catalog/demo/10-87x88.png" alt=""></a>
                    </td>
                    <td><a href="product.html" class="cart-pro-name">Túi xách du lịch</a></td>
                    <td>2016</td>
                    <td>
                        <div class="input-group btn-block">
                            <input type="text" size="1" value="2" name="quantity[170]">
                            <span>
                                <a href="javascript:void(0);" title="Cập nhật giỏ hàng"><i class="fa fa-refresh"></i></a>
                                <a href="javasript:void(0);" title="Xóa khỏi giỏ hàng"><i class="fa fa-remove fa-xs"></i></a>
                            </span>
                        </div>
                    </td>
                    <td class="cart-price">200.000đ</td>
                    <td class="cart-price"><strong>400.000đ</strong></td>
                </tr>
                <tr>
                    <td class="cart-page-img">
                        <a href="product.html"><img src="image/cache/catalog/demo/12-87x88.png" alt="product.html"></a>
                    </td>
                    <td><a href="" class="cart-pro-name">Nón len mùa đông</a></td>
                    <td>DKGD230</td>
                    <td>
                        <div class="input-group btn-block">
                            <input type="text" size="1" value="1" name="quantity[170]">
                            <span>
                                <a href="javascript:void(0);" title="Cập nhật giỏ hàng"><i class="fa fa-refresh"></i></a>
                                <a href="javasript:void(0);" title="Xóa khỏi giỏ hàng"><i class="fa fa-remove fa-xs"></i></a>
                            </span>
                        </div>
                    </td>
                    <td class="cart-price">100.000đ</td>
                    <td class="cart-price"><strong>100.000đ</strong></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="cart-bottom-total">
        <div class="table-total  col-sm-4 col-sm-offset-8 no-padding">
           <table class=" table table-bordered">
            <tbody>
                <tr>
                  <td class="text-right"><strong>Tổng:</strong></td>
                  <td class="text-right"><strong>500.000đ</strong></td>
                </tr>
                <tr>
                  <td class="text-right"><strong>Thuế VAT (10%):</strong></td>
                  <td class="text-right text-danger">50.000đ</td>
                </tr>
                <tr>
                  <td class="text-right"><strong>Tổng cộng:</strong></td>
                  <td class="text-right text-danger"><strong>550.000đ</strong></td>
                </tr>
            </tbody>
            </table>
            
        </div>
        <p class="form-submit">
            <input type="submit" class="btn btn-primary submit pull-right" value="Thanh toán" onclick="window.location.href='checkout.html'">
        </p>
        <p class="form-submit">
            <input type="submit" class="btn btn-primary continue-shopping pull-left" value="Tiếp tục mua sắm" title="Quay về trang chủ">
        </p>
    </div>                                        
</div>