package com.shop.domain;

import java.io.Serializable;

/**
 * JavaBean:PO，字段对应User表
 * 
 *
 */
public class User implements Serializable{
	private static final long serialVersionUID = 2922978284091657099L;
	
	private int userId;
	private String account;
	private String password;
	private String tel;
	private String email;
	private String address;
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getUserId() {
		return userId;
	}
	
	public void setAccount(String account) {
		this.account = account;
	}
	public String getAccount() {
		return account;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword() {
		return password;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTel() {
		return tel;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail() {
		return email;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress() {
		return address;
	}

	@Override
	public String toString() {
		return "User [userId="+userId+",account="+account+",password="+password+",tel="+tel+",email="+email+",address="+address+"]";
	}
}
