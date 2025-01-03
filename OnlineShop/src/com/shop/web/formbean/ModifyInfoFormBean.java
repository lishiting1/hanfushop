package com.shop.web.formbean;

import java.util.HashMap;
import java.util.Map;

/**
 * 封装用户修改个人信息表单
 * 
 *
 */
public class ModifyInfoFormBean {
	private String tel;
	private String email;
    private String address;
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

	/**
	 * 存储校验不通过时给用户的错误提示信息
	 */
	private Map<String, String> errors = new HashMap<String, String>();

	public Map<String, String> getErrors() {
		return errors;
	}

	public void setErrors(Map<String, String> errors) {
		this.errors = errors;
	}

	/*
	 * 已在前端进行验证，这里暂不写验证
	 */
	/**
	 * 验证是否符合要求
	 */
	public boolean validate() {
		return true;
	}

	@Override
	public String toString() {
		return "ModifyInfoFormBean [tel=" + tel + ",email=" + email + "address=" + address + "]";
	}

}
