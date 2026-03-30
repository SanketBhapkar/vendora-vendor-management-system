package com.vendora.model;

import java.sql.Timestamp;

public class Vendor {
	private int id;
	private String name; 
	private String category;
	private String phone;
	private String email;
    private String address;
    private String description;
    private String imageUrl;
    private String status;
    private int createdBy;
    private Timestamp createdAt;
    
    public Vendor() {}
    
    public Vendor(String name,String category, String phone, String email,
    		String address, String description, String imageUrl,String status, int createdBy) {
    	this.name=name;
    	this.category = category;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.description = description;
        this.imageUrl = imageUrl;
        this.status = status;
        this.createdBy = createdBy;

}
    
    public Vendor(int id, String name, String category, String phone, String email,
            String address, String description, String imageUrl,
            String status, int createdBy) {

  this.id = id;
  this.name = name;
  this.category = category;
  this.phone = phone;
  this.email = email;
  this.address = address;
  this.description = description;
  this.imageUrl = imageUrl;
  this.status = status;
  this.createdBy = createdBy;
}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}   
}