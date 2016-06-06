package j2ee.group01.sportshop.model;

public class ContractModel {

	private String name;
	private String slogun;
	private String address;
	private String phone;
	private String fax;
	private String email;
	private String fbAddress;
	private String twtAddress;
	
	
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
}
