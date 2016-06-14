<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="j2ee.group01.sportshop.model.CategoryModel"%>
<%@ page import="j2ee.group01.sportshop.model.ProductModel"%>

<%@ page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SportShop | Chỉnh sửa sản phẩm</title>

<%@ include file="template/head.jsp"%>
</head>
<body>

	<div id="wrapper">

		<!-- Navigation -->
		<%@ include file="template/navigation.jsp"%>

		<!-- Main content -->
		<div id="page-wrapper">
			<div class="row contact-content">
				<div class="col-xs-12" id="InformContentCartPage"></div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Chỉnh sửa sản phẩm</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<%
				ProductModel productModel = (ProductModel) request.getAttribute("productModel");
			%>
			<form id="insertProductForm" action="updateproductinfo" method="POST"
							enctype="multipart/form-data" onsubmit="return validateMyForm();">
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-8">
					<div class="panel panel-default">
						<div class="panel-heading">THÔNG TIN</div>
						<div class="panel-body">
							<div class="row">
								<div class="form-group">
									<label class="control-label col-md-2"> Tên sản phẩm </label>
									<div class="col-md-10">
										<div class="input-icon right">
											<input id="input-title" name="title" type="text"
												class="form-control" value="<%=productModel.getTitle()%>">
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2"> Nhãn </label>
									<div class="col-md-10">
										<div class="input-group">
											<span class="input-group-addon">Alias</span> <input
												id="input-alias" name="alias" type="text"
												class="form-control" value="<%=productModel.getAlias()%>">
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2"> Mô tả </label>
									<div class="col-md-10">
										<div class="input-icon right">
											<textarea id="input-description" name="description"
												class="form-control" rows="3"
												value="<%=productModel.getDescription()%>"></textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading">GIÁ & HÌNH ẢNH</div>
						<div class="panel-body">
							<div class="row">
								<div class="form-group">
									<label class="control-label col-md-2"> Giá </label>
									<div class="col-md-5">
										<div class="input-group">
											<span class="input-group-addon">Giá gốc</span> <input
												id="input-price" name="price" type="number"
												class="form-control" maxlength="10"
												value="<%=productModel.getPrice()%>">
										</div>
									</div>
									<div class="col-md-5">
										<div class="input-group">
											<span class="input-group-addon">Giá giảm</span> <input
												id="input-pricePromotion" name="pricePromotion" type="number"
												class="form-control" maxlength="10"
												value="<%=productModel.getPricePromotion()%>">
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2"> Khác </label>
									<div class="col-md-5">
										<div class="input-group">
											<span class="input-group-addon">Mã sản phẩm</span> <input
												id="input-code" name="code" type="text" class="form-control"
												maxlength="4" value="<%=productModel.getCode()%>">
										</div>
									</div>
									<div class="col-md-5">
										<div class="input-group">
											<span class="input-group-addon">Số lượng hiện có</span> <input
												id="input-quantity" name="quantity" type="number"
												maxlength="8" class="form-control"
												value="<%=productModel.getQuantity()%>">
										</div>
									</div>
									<div class="clearfix"></div>
								</div>

								<div class="form-group">
									<label class="control-label col-md-2"> Chọn ảnh sản
										phẩm </label>
									<div class="col-md-10">
										<div class="getfile"
											style="border: 1px solid #ccc; border-radius: 5px; padding: 20px;">
											<input id="input-images" name="images" type="file"
												value="<%=productModel.getImages()%>"></input>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="panel panel-default">
						<div class="panel-heading">LOẠI SẢN PHẨM</div>
						<div class="panel-body">
							<div class="form-group">
								<select id="input-idCategory" name="idCategory"
									class="form-control">
									<%
										List<CategoryModel> activeCategoryList = (List<CategoryModel>) request.getAttribute("activeCategoryList");
										for (int i = 0; i < activeCategoryList.size(); i++) {
											String tempStr = "";
											if (activeCategoryList.get(i).getId() == productModel.getIdCategory()) {
												tempStr = "selected";
											}
									%>
									<option <%=tempStr%>
										value="<%=activeCategoryList.get(i).getId()%>"><%=activeCategoryList.get(i).getTitle()%></option>

									<%
										}
									%>
								</select>
							</div>


						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading">THAO TÁC</div>
						<div class="panel-body">
							<input type="hidden" name="id" value="<%=productModel.getId()%>">
							<input type="hidden" name="dateCreate" value="<%=productModel.getDateCreate()%>">
							<button
									type="submit" class="btn btn-danger form-submit">Sửa</button> <a
								href="../admin/productlist"><button type="reset"
									class="btn btn-default">Hủy</button></a>
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->
			</form>
		</div>
		<!-- /#page-wrapper -->

	</div>

	<!-- Script files -->
	<%@ include file="template/foot.jsp"%>

	<script type="text/javascript">
		/* $(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		}); */
		
		function validateMyForm()
		{
			var title = document.getElementById("input-title").value;
			if (title.length < 1) {
				var message = '<div class="alert alert-warning"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Nhắc nhở! </strong> Tên sản phẩm không được để trống. Xin cảm ơn! </div>';
				$('#InformContentCartPage').append(message);
				document.getElementById("input-title").focus();
				alert("Lỗi");
			    return false;
			}
			

			var alias = document.getElementById("input-alias").value;
			if (alias.length < 1) {
				var message = '<div class="alert alert-warning"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Nhắc nhở! </strong> Nhãn sản phẩm không được để trống. Xin cảm ơn! </div>';
				$('#InformContentCartPage').append(message);
				document.getElementById("input-alias").focus();
				alert("Lỗi");
			    return false;
			}
			
			var description = document.getElementById("input-description").value;
			
			var price = document.getElementById("input-price").value;
			if (price.length < 1) {
				var message = '<div class="alert alert-warning"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Nhắc nhở! </strong> Giá gốc sản phẩm không được để trống. Xin cảm ơn! </div>';
				$('#InformContentCartPage').append(message);
				document.getElementById("input-price").focus();
				alert("Lỗi");
			    return false;
			}
			
			var pricePromotion = document.getElementById("input-pricePromotion").value;
			if (pricePromotion.length < 1) {
				var message = '<div class="alert alert-warning"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Nhắc nhở! </strong> Giá khuyến mãi sản phẩm không được để trống. Xin cảm ơn! </div>';
				$('#InformContentCartPage').append(message);
				document.getElementById("input-pricePromotion").focus();
				alert("Lỗi");
			    return false;
			}
			
			var code = document.getElementById("input-code").value;
			if (code.length < 1) {
				var message = '<div class="alert alert-warning"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Nhắc nhở! </strong> Mã sản phẩm không được để trống. Xin cảm ơn! </div>';
				$('#InformContentCartPage').append(message);
				document.getElementById("input-code").focus();
				alert("Lỗi");
			    return false;
			}
			
			var quantity = document.getElementById("input-quantity").value;
			if (quantity.length < 1) {
				var message = '<div class="alert alert-warning"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Nhắc nhở! </strong> Số lượng sản phẩm không được để trống. Xin cảm ơn! </div>';
				$('#InformContentCartPage').append(message);
				document.getElementById("input-quantity").focus();
				alert("Lỗi");
			    return false;
			}
			
			var images = document.getElementById("input-images").value;
			if (images.length < 1) {
				var message = '<div class="alert alert-warning"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Nhắc nhở! </strong> Hãy chọn ảnh cho sản phẩm. Xin cảm ơn! </div>';
				$('#InformContentCartPage').append(message);
				document.getElementById("input-images").focus();
				alert("Lỗi");
			    return false;
			}
		  
		  return true;
		}

		function sendProductInfo() {
			var id = document.getElementById("input-id").value;
			var dateCreate = document.getElementById("input-dateCreate").value;
			var title = document.getElementById("input-title").value;
			if (title.length < 1) {
				var message = '<div class="alert alert-warning"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Nhắc nhở! </strong> Tên sản phẩm không được để trống. Xin cảm ơn! </div>';
				$('#InformContentCartPage').append(message);
				document.getElementById("input-title").focus();
				return;
			}

			var alias = document.getElementById("input-alias").value;
			if (alias.length < 1) {
				var message = '<div class="alert alert-warning"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Nhắc nhở! </strong> Nhãn sản phẩm không được để trống. Xin cảm ơn! </div>';
				$('#InformContentCartPage').append(message);
				document.getElementById("input-alias").focus();
				return;
			}

			var description = document.getElementById("input-description").value;

			var price = document.getElementById("input-price").value;
			if (price.length < 1) {
				var message = '<div class="alert alert-warning"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Nhắc nhở! </strong> Giá gốc sản phẩm không được để trống. Xin cảm ơn! </div>';
				$('#InformContentCartPage').append(message);
				document.getElementById("input-price").focus();
				return;
			}

			var pricePromotion = document
					.getElementById("input-pricePromotion").value;
			if (pricePromotion.length < 1) {
				var message = '<div class="alert alert-warning"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Nhắc nhở! </strong> Giá khuyến mãi sản phẩm không được để trống. Xin cảm ơn! </div>';
				$('#InformContentCartPage').append(message);
				document.getElementById("input-pricePromotion").focus();
				return;
			}

			var code = document.getElementById("input-code").value;
			if (code.length < 1) {
				var message = '<div class="alert alert-warning"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Nhắc nhở! </strong> Mã sản phẩm không được để trống. Xin cảm ơn! </div>';
				$('#InformContentCartPage').append(message);
				document.getElementById("input-code").focus();
				return;
			}

			var quantity = document.getElementById("input-quantity").value;
			if (quantity.length < 1) {
				var message = '<div class="alert alert-warning"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Nhắc nhở! </strong> Số lượng sản phẩm không được để trống. Xin cảm ơn! </div>';
				$('#InformContentCartPage').append(message);
				document.getElementById("input-quantity").focus();
				return;
			}

			var images = document.getElementById("input-images").value;
			if (images.length < 1) {
				var message = '<div class="alert alert-warning"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Nhắc nhở! </strong> Hãy chọn ảnh cho sản phẩm. Xin cảm ơn! </div>';
				$('#InformContentCartPage').append(message);
				document.getElementById("input-images").focus();
				return;
			}

			var idCategory = document.getElementById("input-idCategory").value;

			$.post("../admin/updateproductinfo", {
				title_c : title,
				id_c : id,
				dateCreate_c : dateCreate,
				alias_c : alias,
				description_c : description,
				price_c : price,
				pricePromotion_c : pricePromotion,
				code_c : code,
				quantity_c : quantity,
				images_c : images,
				idCategory_c : idCategory
			})
			.done(
					function(data) {
						alert("true");
						window.location.href = "../admin/productlist";
						/* var $response = $(data); // cho nos thong baos cho ngta biet m
						cai code co 4 ky tu ha
						m de im coi
						
						var message = '<div class="alert alert-success"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Thông báo! </strong> Lưu thành công</div>';
						$('#InformContentCartPage').append(message); */
					})
			.fail(
					function() {
						alert("false");
						/* var message = ' <div class="alert alert-danger"> <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button><strong>Cảnh báo! </strong> Đã xảy ra lỗi trong quá trình tạo mới sản phẩm. Vui lòng thử lại. </div>';
						$('#InformContentCartPage').append(message); */
					});
	};
	</script>

</body>
</html>