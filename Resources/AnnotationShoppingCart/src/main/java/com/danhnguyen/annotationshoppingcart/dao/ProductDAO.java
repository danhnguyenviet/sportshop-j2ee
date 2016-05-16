package com.danhnguyen.annotationshoppingcart.dao;

import com.danhnguyen.annotationshoppingcart.entity.Product;
import com.danhnguyen.annotationshoppingcart.model.PaginationResult;
import com.danhnguyen.annotationshoppingcart.model.ProductInfo;

public interface ProductDAO {

	public Product findProduct(String code);

	public ProductInfo findProductInfo(String code);

	public PaginationResult<ProductInfo> queryProducts(int page, int maxResult, int maxNavigationPage);

	public PaginationResult<ProductInfo> queryProducts(int page, int maxResult, int maxNavigationPage, String likeName);

	public void save(ProductInfo productInfo);

}