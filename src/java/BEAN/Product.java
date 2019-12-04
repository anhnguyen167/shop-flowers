/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BEAN;

import java.io.Serializable;

public class Product implements Serializable{
	private int id;
	private String product_name;
	private String image;
	private int type;
	private int color;
	private int state;
	private int price;
	private String description;
	
	public Product() {
		
	}

	public Product(int id, String product_name, String image, int type, int color, int state, int price,
			String description) {
		super();
		this.id = id;
		this.product_name = product_name;
		this.image = image;
		this.type = type;
		this.color = color;
		this.state = state;
		this.price = price;
		this.description = description;
	}
	
	public Product(String product_name, String image, int type, int color, int state, int price,
			String description) {
		super();
		this.product_name = product_name;
		this.image = image;
		this.type = type;
		this.color = color;
		this.state = state;
		this.price = price;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getColor() {
		return color;
	}

	public void setColor(int color) {
		this.color = color;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
}

