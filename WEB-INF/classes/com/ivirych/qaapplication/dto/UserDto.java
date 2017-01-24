package com.ivirych.qaapplication.dto;

import java.io.Serializable;

public class UserDto implements Serializable {

	private static final long serialVersionUID = 7430300748541548938L;
	private int id;
/*	private String firstName;
	private String lastName;*/
	private String username;
	private String email;
	private String password;
	private String repassword;
	public int getId() {
		return id;
	}
	public void setId(int id) {
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
	public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	public Integer getRole() {
		return role;
	}
	public void setRole(Integer role) {
		this.role = role;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	private Integer role;
}
