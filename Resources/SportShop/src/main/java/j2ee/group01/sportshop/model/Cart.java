package j2ee.group01.sportshop.model;

public class Cart {

	private ProductCart product;
	private int quantity;
	public ProductCart getProduct() {
		return product;
	}
	public void setProduct(ProductCart product) {
		this.product = product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
