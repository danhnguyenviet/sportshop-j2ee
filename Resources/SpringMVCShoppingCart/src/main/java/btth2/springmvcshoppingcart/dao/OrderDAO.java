package btth2.springmvcshoppingcart.dao;


import java.util.List;

import btth2.springmvcshoppingcart.model.CartInfo;
import btth2.springmvcshoppingcart.model.OrderDetailInfo;
import btth2.springmvcshoppingcart.model.OrderInfo;
import btth2.springmvcshoppingcart.model.PaginationResult;

public interface OrderDAO {

   public void saveOrder(CartInfo cartInfo);

   public PaginationResult<OrderInfo> listOrderInfo(int page,
           int maxResult, int maxNavigationPage);
   
   public OrderInfo getOrderInfo(String orderId);
   
   public List<OrderDetailInfo> listOrderDetailInfos(String orderId);

}