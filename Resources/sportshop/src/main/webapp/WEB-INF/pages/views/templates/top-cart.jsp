<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="j2ee.group01.sportshop.model.ShoppingCart" %>
<%@ page import="j2ee.group01.sportshop.model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<% ShoppingCart CurrentShoppingCart = (ShoppingCart)request.getSession().getAttribute("ShoppingCart");
	List<Cart> CartList = new ArrayList<Cart>();	
	if(CurrentShoppingCart != null){
		CartList = (List<Cart>)CurrentShoppingCart.getAllProduct();
	}
%>

<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 shopping-cart inner ">
    <div class="cart-top">
        <div id="cart" class="clearfix">
            <div data-toggle="dropdown" data-loading-text="Loading..." class="heading media text-center dropdown-toggle">
                <i class="fa fa-shopping-cart icon-cart"></i>
                <span id="cart-total"><%=CartList.size() %> sản phẩm - <%=CurrentShoppingCart.getFeePurchase()%>đ</span>
            </div>
            <ul class="dropdown-menu">
                <li>
                    <div class="mini-cart-info">
                        <table class="">
                        	<% for(int i=0; i < CartList.size(); i++){ %>
                        		<tr>
	                                <td class="text-left">
	                                    <a href="product.html"><img width="50px" height="50px" src="../image/product/<%=CartList.get(i).getProduct().getImage() %>" alt="Double layer super soft" title="<%=CartList.get(i).getProduct().getTitle() %>" class="img-thumbnail" /></a>
	                                </td>
	                                <td class="text-left"><a href="product.html"><%=CartList.get(i).getProduct().getTitle() %></a>
	                                </td>
	                                <td class="text-right">x <%=CartList.get(i).getQuantity() %></td>
	                                <td class="text-right"><%=CartList.get(i).getProduct().getPrice() %>đ</td>
	                                <td class="text-center"><button type="button" onclick="cart.remove('26');" title="Xóa khỏi giỏ hàng" class="btn btn-default btn-xs"><i class="fa fa-times"></i></button></td>
	                            </tr>
                        	<% } %>
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
                                <td class="text-right"><strong>Thuế VAT (<%=CurrentShoppingCart.getVAT()%>%)</strong></td>
                                <td class="text-right"><%=CurrentShoppingCart.getFeeVAT()%>đ</td>
                            </tr>
                            <tr>
                                <td class="text-right"><strong>Tổng cộng</strong></td>
                                <td class="text-right"><%=CurrentShoppingCart.getRealFeePurschase()%>đ</td>
                            </tr>
                        </table>

                        <p class="checkout text-right"><a href="cart.html"><strong class="button btn btn-outline-inverse"><i class="fa fa-shopping-cart"></i> Xem giỏ hàng</strong></a>&nbsp;&nbsp;&nbsp;<a href="checkout.html"><strong class="button btn btn-outline-inverse"><i class="fa fa-share"></i> Thanh toán</strong></a></p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    </div>