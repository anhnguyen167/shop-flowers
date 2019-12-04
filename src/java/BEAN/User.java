/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BEAN;


import java.io.Serializable;

public class User implements Serializable{
	private int id;
	private String username;
	private String password;
	private String full_name;
	private String address;
	private String email;
	private String phone;
	private int role;
	
	public User() {
		
	}

	public User(int id, String username, String password, String full_name, String address, String email, String phone,
			int role) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.full_name = full_name;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.role = role;
	}
	
	public User(String username, String password, String full_name, String address, String email, String phone,
			int role) {
		super();
		this.username = username;
		this.password = password;
		this.full_name = full_name;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.role = role;
	}

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

	public String getFull_name() {
		return full_name;
	}

	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}
	
}
