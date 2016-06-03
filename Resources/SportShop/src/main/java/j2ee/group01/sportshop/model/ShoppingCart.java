package j2ee.group01.sportshop.model;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {

	private double VAT = 10.0;
	
	private List<Cart> allCart;
	private double feePurchase;
	
	public double getVAT() {
		return VAT;
	}

	public double getRealFeePurschase() {
		return ( feePurchase + (feePurchase*VAT/100));
	}
	
	public double getFeeVAT() {
		return (feePurchase*VAT/100);
	}
	
	public ShoppingCart(){
		
		allCart = new ArrayList<Cart>();
		feePurchase = 0.0;
	}
	
	public double getFeePurchase(){
		return (double)feePurchase;
	}
	
	public List<Cart> getAllProduct() {
		return allCart;
	}

	public void addProductCart(Cart cart) {
		long cartFee = (long) (cart.getQuantity()*cart.getProduct().getPrice());
		boolean added = false;
		try{
			boolean exist = false;
			for (Cart cart2 : allCart) {
				if(cart2.getProduct().getId() == cart.getProduct().getId()){
					exist = true;
					cart2.setQuantity(cart2.getQuantity()+cart.getQuantity());
					break;
				}
			}
			if(!exist)
				allCart.add(cart);
			added = true;
		}catch(Exception ex){
			added = false;
		}
		if(added){
			this.feePurchase += cartFee;
		}
	}
	
	public void removeProductCart(int productId) {
		double cartFee = 0;
		boolean removed = false;
		try{
			for (Cart cart2 : allCart) {
				if(cart2.getProduct().getId() == productId){
					cartFee = cart2.getQuantity()*cart2.getProduct().getPrice();
					allCart.remove(cart2);
					break;
				}
				
			}
			removed = true;
		}catch(Exception ex){
			removed = false;
		}
		if(removed){
			this.feePurchase -= cartFee;
		}
	}
}
