package j2ee.group01.sportshop.model;

import java.util.Date;

import j2ee.group01.sportshop.entity.Contact;

public class ContractModel {

	
	private Integer id;
	private String fullname;
	private String title;
	private String detail;
	private Integer isActive;
	private Date dateCreate;
	private String state;
	private String response;
	
	private String name;
	private String slogun;
	private String address;
	private String phone;
	private String fax;
	
	private String email;
	private String fbAddress;
	private String twtAddress;
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	
	public String getState() {
		return this.state;
	}
	
	public String getResponse() {
		return response;
	}

	public void setResponse(String response) {
		this.response = response;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Integer getIsActive() {
		return isActive;
	}

	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}

	public Date getDateCreate() {
		return dateCreate;
	}

	public void setDateCreate(Date dateCreate) {
		this.dateCreate = dateCreate;
	}
	
	
	public ContractModel() {
		
	}
	
	public ContractModel(Contact contact) {
		this.id = contact.getId();
		this.fullname = contact.getFullname();
		this.address = contact.getAddress();
		this.email = contact.getEmail();
		this.phone = contact.getPhone();
		this.title = contact.getTitle();
		this.detail = contact.getDetail();
		this.isActive = contact.getIsActive();
		this.dateCreate = contact.getDateCreate();
		this.state = contact.getState();
		this.response = contact.getResponse();
	}
	
	
	public String getSlogun() {
		return slogun;
	}
	public void setSlogun(String slogun) {
		this.slogun = slogun;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFbAddress() {
		return fbAddress;
	}
	public void setFbAddress(String fbAddress) {
		this.fbAddress = fbAddress;
	}
	public String getTwtAddress() {
		return twtAddress;
	}
	public void setTwtAddress(String twtAddress) {
		this.twtAddress = twtAddress;
	}
	
	public String displayState() {
		String _state = this.getState();
		
		if(_state == "nonereply") {
			_state = "Chưa phản hồi";
		} else if (_state == "reply") {
			_state = "Đã phản hồi";
		} else if (_state == "deleted") {
			_state = "Đã xóa";
		} else if (_state == "new") {
			_state = "Mới";
		}
		
		return _state;
	}
}
