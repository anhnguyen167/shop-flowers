/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BEAN;

import java.io.Serializable;
import java.util.Date;
import java.util.ArrayList;

public class Basket implements Serializable{
	private int id;
	private User user;
	private ArrayList<BasketDetail> listBasketDetail;
	private Date booking_date;
	private int total;
	
	public Basket() {
		listBasketDetail = new ArrayList<>();
	}
	
	public Basket(int id, User user, Date booking_date, ArrayList<BasketDetail> listBasketDetail, int total) {
		super();
		this.id = id;
		this.user = user;
		this.listBasketDetail = listBasketDetail;
		this.total = total;
		this.booking_date = booking_date;
	}
	
	public Basket(User user,Date booking_date,  ArrayList<BasketDetail> listBasketDetail, int total) {
		super();
		this.user = user;
		this.listBasketDetail = listBasketDetail;
		this.total = total;
		this.booking_date = booking_date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public ArrayList<BasketDetail> getBasketDetail() {
		return listBasketDetail;
	}

	public void setBasketDetail(ArrayList<BasketDetail> listBasketDetail) {
		this.listBasketDetail = listBasketDetail;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Date getBooking_date() {
		return booking_date;
	}

	public void setBooking_date(Date booking_date) {
		this.booking_date = booking_date;
	}
	
	
}
