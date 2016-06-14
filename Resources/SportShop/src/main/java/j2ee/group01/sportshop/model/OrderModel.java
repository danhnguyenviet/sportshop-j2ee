package j2ee.group01.sportshop.model;

import java.util.Date;

import j2ee.group01.sportshop.entity.Order;

public class OrderModel {
	
	private Integer id;
	private String fullname;
	private String address;
	private String phone;
	private String email;
	private String shipAddress;
	private String shipName;
	private Date dateCreate;
	private Date dateDelivery;
	private String note;
	private double totalAmount;
	private double totalAmountReal;
	
	public OrderModel(){}
	
	public OrderModel(Integer id, String fullname, String address, String phone, String email, String shipAddress,
			String shipName, Date dateCreate, Date dateDelivery, String note, double totalAmount,
			double totalAmountReal) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.shipAddress = shipAddress;
		this.shipName = shipName;
		this.dateCreate = dateCreate;
		this.dateDelivery = dateDelivery;
		this.note = note;
		this.totalAmount = totalAmount;
		this.totalAmountReal = totalAmountReal;
	}
	public OrderModel(Order fromOrder) {
		super();
		this.id = fromOrder.getId();
		this.fullname = fromOrder.getFullname();
		this.address = fromOrder.getAddress();
		this.phone = fromOrder.getPhone();
		this.email = fromOrder.getEmail();
		this.shipAddress = fromOrder.getShipAddress();
		this.shipName = fromOrder.getShipName();
		this.dateCreate = fromOrder.getDateCreate();
		this.dateDelivery = fromOrder.getDateDelivery();
		this.note = fromOrder.getNote();
		this.totalAmount = fromOrder.getTotalAmount();
		this.totalAmountReal = fromOrder.getTotalAmountReal();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getShipAddress() {
		return shipAddress;
	}
	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}
	public String getShipName() {
		return shipName;
	}
	public void setShipName(String shipName) {
		this.shipName = shipName;
	}
	public Date getDateCreate() {
		return dateCreate;
	}
	public void setDateCreate(Date dateCreate) {
		this.dateCreate = dateCreate;
	}
	public Date getDateDelivery() {
		return dateDelivery;
	}
	public void setDateDelivery(Date dateDelivery) {
		this.dateDelivery = dateDelivery;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public double getTotalAmountReal() {
		return totalAmountReal;
	}
	public void setTotalAmountReal(double totalAmountReal) {
		this.totalAmountReal = totalAmountReal;
	}

}
