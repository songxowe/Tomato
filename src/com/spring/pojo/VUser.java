package com.spring.pojo;

/**
 * VUser entity. @author MyEclipse Persistence Tools
 */

public class VUser implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private String username;
	private String password;
	private String role;

	// Constructors

	/** default constructor */
	public VUser() {
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}