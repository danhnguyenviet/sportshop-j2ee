package com.danhnguyen.annotationshoppingcart.dao;

import java.util.List;

import com.danhnguyen.annotationshoppingcart.model.CartInfo;
import com.danhnguyen.annotationshoppingcart.model.OrderDetailInfo;
import com.danhnguyen.annotationshoppingcart.model.OrderInfo;
import com.danhnguyen.annotationshoppingcart.model.PaginationResult;

public interface OrderDAO {

	public void saveOrder(CartInfo cartInfo);

	public PaginationResult<OrderInfo> listOrderInfo(int page, int maxResult, int maxNavigationPage);

	public OrderInfo getOrderInfo(String orderId);

	public List<OrderDetailInfo> listOrderDetailInfos(String orderId);

}