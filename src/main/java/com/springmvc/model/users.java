package com.springmvc.model;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class users {
	
	@Id
	@Column
	private String username;
	@Column
	private String password;
	@Column
	private String fullname;
	@Column
	private String email;
	@Column
	private byte[] photo;
	
	
	public users() {
		// TODO Auto-generated constructor stub
	}
	
	

	public users(String username, String password, String fullname, String email, 
			byte[] photo) {
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.email = email;
		this.photo = photo;
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

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	
}
