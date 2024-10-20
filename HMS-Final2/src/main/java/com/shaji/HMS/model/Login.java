package com.shaji.HMS.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

@Entity
public class Login {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private Integer Id;
	private String password;
	private String siteName;
	private String username;
	
	@Override
	public String toString() {
		return "Login [Id=" + Id + ", password=" + password + ", siteName=" + siteName + ", username=" + username + "]";
	}

	public Login() {
		super();
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

	public String getSiteName() {
		return siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public Login(Integer id, String password, String siteName, String username) {
		super();
		Id = id;
		this.password = password;
		this.siteName = siteName;
		this.username = username;
	}

}
