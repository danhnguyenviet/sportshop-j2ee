package j2ee.group01.sportshop.model;

import java.util.ArrayList;

import j2ee.group01.sportshop.entity.Product;
import j2ee.group01.sportshop.entity.User;

public class UserModel {
	private Integer id;
	private String username;
	private String password;
	private String fullname;
	private String email;
	private boolean idRole;
	private int isActive;
	
	public UserModel(User fromUser) {
		this.id = fromUser.getId();
		this.username = fromUser.getUsername();
		this.password = fromUser.getPassword();
		this.fullname = fromUser.getFullname();
		this.email = fromUser.getEmail();
		this.idRole = fromUser.isIdRole();
		this.isActive = fromUser.getIsActive();
		}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isIdRole() {
		return idRole;
	}
	public void setIdRole(boolean idRole) {
		this.idRole = idRole;
	}
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
}
