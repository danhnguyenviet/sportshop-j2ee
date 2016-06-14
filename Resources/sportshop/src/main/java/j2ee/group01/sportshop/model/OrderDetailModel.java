package j2ee.group01.sportshop.model;

import j2ee.group01.sportshop.entity.OrderDetail;

public class OrderDetailModel {
	
	private Integer id;
	private int idOrder;
	private int idProduct;
	private int quantity;
	private double price;
	private Double pricePromotion;
	private double total;
	private String productTitle;
	
	public OrderDetailModel(){}
	public OrderDetailModel(Integer id, int idOrder, int idProduct, int quantity, double price, Double pricePromotion,
			double total, String productTitle) {
		super();
		this.id = id;
		this.idOrder = idOrder;
		this.idProduct = idProduct;
		this.quantity = quantity;
		this.price = price;
		this.pricePromotion = pricePromotion;
		this.total = total;
		this.productTitle = productTitle;
	}
	public OrderDetailModel(OrderDetail orderDetail) {
		super();
		this.id = orderDetail.getId();
		this.idOrder = orderDetail.getIdOrder();
		this.idProduct = orderDetail.getIdProduct();
		this.quantity = orderDetail.getQuantity();
		this.price = orderDetail.getPrice();
		this.pricePromotion = orderDetail.getPricePromotion();
		this.total = orderDetail.getTotal();
		this.productTitle = "";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getIdOrder() {
		return idOrder;
	}
	public void setIdOrder(int idOrder) {
		this.idOrder = idOrder;
	}
	public int getIdProduct() {
		return idProduct;
	}
	public void setIdProduct(int idProduct) {
		this.idProduct = idProduct;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Double getPricePromotion() {
		return pricePromotion;
	}
	public void setPricePromotion(Double pricePromotion) {
		this.pricePromotion = pricePromotion;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getProductTitle() {
		return productTitle;
	}
	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}
	
}
