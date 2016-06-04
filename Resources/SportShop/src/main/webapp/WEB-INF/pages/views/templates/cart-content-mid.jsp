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


<div id="contentCartPanelMainTop">
	<%
		ShoppingCart CurrentShoppingCart = (ShoppingCart) request.getSession().getAttribute("ShoppingCart");
		List<Cart> CartList = new ArrayList<Cart>();
		if (CurrentShoppingCart != null) {
			CartList = (List<Cart>) CurrentShoppingCart.getAllProduct();
		}
	%>

	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 shopping-cart inner ">
		<div class="cart-top">
			<div id="cart" class="clearfix">
				<div data-toggle="dropdown" data-loading-text="Loading..."
					class="heading media text-center dropdown-toggle">
					<i class="fa fa-shopping-cart icon-cart"></i> <span id="cart-total"><%=CartList.size()%>
						sản phẩm - <%=CurrentShoppingCart.getFeePurchase()%>đ</span>
				</div>
				<ul class="dropdown-menu">
					<li>
						<div class="mini-cart-info">
							<table class="">
								<%
									for (int i = 0; i < CartList.size(); i++) {
								%>
								<tr>
									<td class="text-left"><a href="product.html"><img
											width="50px" height="50px"
											src="../image/product/<%=CartList.get(i).getProduct().getImage()%>"
											alt="Double layer super soft"
											title="<%=CartList.get(i).getProduct().getTitle()%>"
											class="img-thumbnail" /></a></td>
									<td class="text-left"><a href="product.html"><%=CartList.get(i).getProduct().getTitle()%></a>
									</td>
									<td class="text-right">x <%=CartList.get(i).getQuantity()%></td>
									<td class="text-right"><%=CartList.get(i).getProduct().getPrice()%>đ</td>
									<td class="text-center"><button type="button"
											onclick="cart.remove('26');" title="Xóa khỏi giỏ hàng"
											class="btn btn-default btn-xs">
											<i class="fa fa-times"></i>
										</button></td>
								</tr>
								<%
									}
								%>
							</table>
						</div>
					</li>

					<li>
						<div class="mini-cart-total">
							<table class="">
								<tr>
									<td class="text-right"><strong>Tổng</strong></td>
									<td class="text-right"><%=CurrentShoppingCart.getFeePurchase()%>đ</td>
								</tr>
								<tr>
									<td class="text-right"><strong>Thuế VAT (<%=CurrentShoppingCart.getVAT()%>%)
									</strong></td>
									<td class="text-right"><%=CurrentShoppingCart.getFeeVAT()%>đ</td>
								</tr>
								<tr>
									<td class="text-right"><strong>Tổng cộng</strong></td>
									<td class="text-right"><%=CurrentShoppingCart.getRealFeePurschase()%>đ</td>
								</tr>
							</table>

							<p class="checkout text-right">
								<a href="../view/cart"><strong
									class="button btn btn-outline-inverse"><i
										class="fa fa-shopping-cart"></i> Xem giỏ hàng</strong></a>&nbsp;&nbsp;&nbsp;<a
									href="../view/cart"><strong
									class="button btn btn-outline-inverse"><i
										class="fa fa-share"></i> Thanh toán</strong></a>
							</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>

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
