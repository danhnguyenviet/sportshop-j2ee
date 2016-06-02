package j2ee.group01.sportshop.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import j2ee.group01.sportshop.entity.Product;

public class ProductModel {
	private Integer id;
	private String code;
	private int idCategory;
	private int idAccount;
	private double price;
	private Double pricePromotion;
	private List<String> images;
	private String title;
	private String alias;
	private String description;
	private Double quantity;
	private Date dateCreate;
	private Date dateUpdate;
	private int isActive;
	private Integer isSavedraft;
	private int views;
	private int purchase;
	
	public ProductModel(){
		
	}
	
	public ProductModel(Product fromProduct) {
		this.id = fromProduct.getId();
		this.alias = fromProduct.getAlias();
		this.code = fromProduct.getCode();
		this.dateCreate = fromProduct.getDateCreate();
		this.dateUpdate = fromProduct.getDateUpdate();
		this.description = fromProduct.getDescription();
		this.idAccount = fromProduct.getIdAccount();
		this.idCategory = fromProduct.getIdCategory();
		this.isActive = fromProduct.getIsActive();
		this.isSavedraft = fromProduct.getIsSavedraft();
		this.price = fromProduct.getPrice();
		this.pricePromotion = fromProduct.getPricePromotion();
		this.purchase = fromProduct.getPurchase();
		this.quantity = fromProduct.getQuantity();
		this.title = fromProduct.getTitle();
		this.views = fromProduct.getViews();
		System.out.println(fromProduct.getImages());
		String[] allImg = fromProduct.getImages().split("-");
		this.images = new ArrayList<String>();
		for (int i=0;i< allImg.length;i++) {
			this.images.add(allImg[i]);
		}
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getIdCategory() {
		return idCategory;
	}
	public void setIdCategory(int idCategory) {
		this.idCategory = idCategory;
	}
	public int getIdAccount() {
		return idAccount;
	}
	public void setIdAccount(int idAccount) {
		this.idAccount = idAccount;
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
	public List<String> getImages() {
		return images;
	}
	public void setImages(List<String> images) {
		this.images = images;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Double getQuantity() {
		return quantity;
	}
	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}
	public Date getDateCreate() {
		return dateCreate;
	}
	public void setDateCreate(Date dateCreate) {
		this.dateCreate = dateCreate;
	}
	public Date getDateUpdate() {
		return dateUpdate;
	}
	public void setDateUpdate(Date dateUpdate) {
		this.dateUpdate = dateUpdate;
	}
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	public Integer getIsSavedraft() {
		return isSavedraft;
	}
	public void setIsSavedraft(Integer isSavedraft) {
		this.isSavedraft = isSavedraft;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getPurchase() {
		return purchase;
	}
	public void setPurchase(int purchase) {
		this.purchase = purchase;
	}
}
