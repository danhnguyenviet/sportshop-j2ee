<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="j2ee.group01.sportshop.model.ShoppingCart"%>
<%@ page import="j2ee.group01.sportshop.model.Cart"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>


<%
		ShoppingCart CurrentShoppingCartCartPage = (ShoppingCart) request.getSession().getAttribute("ShoppingCart");
		List<Cart> CartListCartPage = new ArrayList<Cart>();
		if (CurrentShoppingCartCartPage != null) {
			CartListCartPage = (List<Cart>) CurrentShoppingCartCartPage.getAllProduct();
		}
	%>

<script type="text/javascript">
	function updateCart(x) {
		var row = x.closest('tr').rowIndex;
		var pnid = "productRow" + row;
		var txtid = "quantity" + row;
		var productId = document.getElementById(pnid).value;
		var rquantity = document.getElementById(txtid).value;
		if(!parseInt(rquantity) || parseInt(rquantity) < 1){
			var message = '<div class="alert alert-warning"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button<strong>Nhắc nhở! </strong> Số lượng sản phẩm tối thiểu là 1. Xin cảm ơn! </div>';
			$('#InformContentCartPage').append(message);
			document.getElementById(txtid).value = "1";
			document.getElementById(txtid).focus();
			return;
		}
		$.post("../view/updateToCart", {
					id : productId,
					quantity : rquantity
				})
				.done(function(data) {
					var $response = $(data);
					var topCart = $response.filter('#contentCartPanelMainTop').html();
					var contentCart = $response.filter('#contentCartPanelMain').html();

					$('#topCartPanelToAjax').html(topCart+"");
					$('#contentCartPanelToAjax').html(contentCart + "");
					
					var message = '<div class="alert alert-success"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Thông báo! </strong> Giỏ hàng đã được cập nhật thành công </div>';
					$('#InformContentCartPage').append(message);
				})
				.fail(
						function() {
							var message = ' <div class="alert alert-danger"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Cảnh báo! </strong> Đã xảy ra lỗi trong quá trình cập nhật giỏ hàng. Vui lòng thử lại. </div>';
							$('#InformContentCartPage').append(message);
						});
	};

	function removeCart(x) {
		var row = x.closest('tr').rowIndex;
		var pnid = "productRow" + row;
		var productId = document.getElementById(pnid).value;
		$.post("../view/deleteFromCart", {id : productId})
		.done(function(data) {
			var $response = $(data);
			var topCart = $response.filter('#contentCartPanelMainTop').html();
			var contentCart = $response.filter('#contentCartPanelMain').html();

			$('#topCartPanelToAjax').html(topCart+"");
			$('#contentCartPanelToAjax').html(contentCart + "");
			var message = ' <div class="alert alert-danger"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Cảnh báo! </strong> Sản phẩm đã được xóa khỏi giỏ hàng </div>';
			$('#InformContentCartPage').append(message);
		})
		.fail(
				function() {
					var message = '<div class="alert alert-danger"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Cảnh báo! </strong> Đã xảy ra lỗi trong quá trình xóa sản phẩm khỏi giỏ hàng. Vui lòng thử lại. </div>';
					$('#InformContentCartPage').append(message);
				});
	};
	
	function checkoutCart() {
		var fullNamer = document.getElementById("input-name").value;
		if(fullNamer.length < 1){
			var message = '<div class="alert alert-warning"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Nhắc nhở! </strong> Tên đầy đủ không được để trống. Xin cảm ơn! </div>';
			$('#InformContentCartPage').append(message);
			document.getElementById("input-name").focus();
			return;
		}
		var phoner = document.getElementById("input-phone").value;
		if(phoner.length < 1){
			var message = '<div class="alert alert-warning"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button<strong>Nhắc nhở! </strong> Số điện thoại không được để trống. Xin cảm ơn! </div>';
			$('#InformContentCartPage').append(message);
			document.getElementById("input-phone").focus();
			return;
		}
		var emailr = document.getElementById("input-email").value;
		var provincer = document.getElementById("input-province").value;
		if(provincer.length < 1){
			var message = '<div class="alert alert-warning"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button<strong>Nhắc nhở! </strong> Tỉnh/Thành phố không được để trống. Xin cảm ơn! </div>';
			$('#InformContentCartPage').append(message);
			document.getElementById("input-province").focus();
			return;
		}
		var districtr = document.getElementById("input-district").value;
		if(districtr.length < 1){
			var message = '<div class="alert alert-warning"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button<strong>Nhắc nhở! </strong> Quận/Huyện không được để trống. Xin cảm ơn! </div>';
			$('#InformContentCartPage').append(message);
			document.getElementById("input-district").focus();
			return;
		}
		var wardsr = document.getElementById("input-wards").value;
		if(wardsr.length < 1){
			var message = '<div class="alert alert-warning"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button<strong>Nhắc nhở! </strong> Xã/Phường không được để trống. Xin cảm ơn! </div>';
			$('#InformContentCartPage').append(message);
			document.getElementById("input-wards").focus();
			return;
		}
		var streetr = document.getElementById("input-street").value;
		$.post("../view/checkoutCart", {
					fullName : fullNamer,
					phone : phoner,
					email : emailr,
					province : provincer,
					district: districtr,
					wards: wardsr,
					street: streetr
				})
				.done(function(data) {
					var $response = $(data);
					var topCart = $response.filter('#contentCartPanelMainTop').html();
					var contentCart = $response.filter('#contentCartPanelMain').html();

					$('#topCartPanelToAjax').html(topCart+"");
					$('#contentCartPanelToAjax').html(contentCart + "");
					
					var message = '<div class="alert alert-success"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Thông báo! </strong> Đặt hàng thành công <p> <br>Tổng số tiền cho hóa đơn thanh toán: <span class="text-danger">'+<%=((ShoppingCart) request.getSession().getAttribute("ShoppingCart")).getRealFeePurschase()+ ""%>+'đ</span>. Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi. Chúng tôi sẽ liên hệ và chuyển đến bạn trong vòng 24 giờ kể từ lúc này.<a href="../view/home" class="alert-link">Tiếp tục mua sắm</a> </p> </div>';
					$('#InformContentCartPage').append(message);
				})
				.fail(
						function() {
							var message = ' <div class="alert alert-danger"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Cảnh báo! </strong> Đã xảy ra lỗi trong quá trình cập nhật hóa đơn cho giỏ hàng. Vui lòng thử lại. </div>';
							$('#InformContentCartPage').append(message);
						});
	};
	
</script>

<div id="contentCartPanelMain">
	
	<div class="col-sm-12 col-md-7 col-xs-12">
		<p>Quý khách vui lòng điền địa chỉ nhận hàng trước khi thanh toán.
			Xin cảm ơn!</p>
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
					<%
						for (int i = 0; i < CartListCartPage.size(); i++) {
					%>
					<tr>
						<input id="<%="productRow" + (i+1)%>" type="hidden"
							value="<%=CartListCartPage.get(i).getProduct().getId()%>" />
						<td class="cart-page-img"><a
							href="../view/product?id=<%=CartListCartPage.get(i).getProduct().getId()%>"><img
								width="100px" height="100px"
								src="../image/product/<%=CartListCartPage.get(i).getProduct().getImage()%>"
								alt=""></a></td>
						<td><a
							href="../view/product?id=<%=CartListCartPage.get(i).getProduct().getId()%>"
							class="cart-pro-name"><%=CartListCartPage.get(i).getProduct().getTitle()%></a></td>
						<td><%=CartListCartPage.get(i).getProduct().getCode()%></td>
						<td>
							<div class="input-group btn-block">
								<input id="<%="quantity" + (i+1)%>" type="text" size="1"
									value="<%=CartListCartPage.get(i).getQuantity()%>"
									name="quantity[170]"> <span> <a
									href="javascript:void(0);" title="Cập nhật giỏ hàng"
									onclick="updateCart(this)"><i class="fa fa-refresh"></i></a> <a
									href="javasript:void(0);" title="Xóa khỏi giỏ hàng"
									onclick="removeCart(this)"><i class="fa fa-remove fa-xs"></i></a>
								</span>
							</div>
						</td>
						<td class="cart-price"><%=CartListCartPage.get(i).getProduct().getPrice()%>đ</td>
						<td class="cart-price"><strong><%=(CartListCartPage.get(i).getProduct().getPrice()) * (CartListCartPage.get(i).getQuantity())%>đ</strong></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<div class="cart-bottom-total">
			<div class="table-total  col-sm-4 col-sm-offset-8 no-padding">
				<table class=" table table-bordered">
					<tbody>
						<tr>
							<td class="text-right"><strong>Tổng:</strong></td>
							<td class="text-right"><strong><%=CurrentShoppingCartCartPage.getFeePurchase()%>đ</strong></td>
						</tr>
						<tr>
							<td class="text-right"><strong>Thuế VAT (<%=CurrentShoppingCartCartPage.getVAT()%>%):
							</strong></td>
							<td class="text-right text-danger"><%=CurrentShoppingCartCartPage.getFeeVAT()%>đ</td>
						</tr>
						<tr>
							<td class="text-right"><strong>Tổng cộng:</strong></td>
							<td class="text-right text-danger"><strong><%=CurrentShoppingCartCartPage.getRealFeePurschase()%>đ</strong></td>
						</tr>
					</tbody>
				</table>

			</div>
			<p class="form-submit">
				<input type="submit" class="btn btn-primary submit pull-right"
					value="Đặt hàng ngay" onclick="checkoutCart()">
			</p>
			<p class="form-submit">
				<input type="submit" onclick="window.location.href = ../view/home"
					class="btn btn-primary continue-shopping pull-left"
					value="Tiếp tục mua sắm" title="Quay về trang chủ">
			</p>
		</div>
	</div>
</div>
