package com.vendora.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.vendora.model.Vendor;
import com.vendora.util.DBConnection;

public class VendorDAO {
	public boolean addVendor(Vendor vendor) {
		boolean status=false;
		
		try(Connection con = DBConnection.getConnection()){
			String sql = "insert into vendors(name,category,phone,email,address,description,image_url,status,created_by) "
					+ "values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, vendor.getName());
			pt.setString(2, vendor.getCategory());
			pt.setString(3, vendor.getPhone());
			pt.setString(4, vendor.getEmail());
            pt.setString(5, vendor.getAddress());
            pt.setString(6, vendor.getDescription());
            pt.setString(7, vendor.getImageUrl());
            pt.setString(8, vendor.getStatus());
            pt.setInt(9, vendor.getCreatedBy());
            
            int rows = pt.executeUpdate();
            if(rows>0) {
            	status=true;
            }
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return status;
	}
	
	public List<Vendor> getActiveVendors(){
		List <Vendor> list = new ArrayList<Vendor>();
		try(Connection con = DBConnection.getConnection()){
			
			String sql = "select * from vendors where status='ACTIVE'";
			PreparedStatement pt = con.prepareStatement(sql);
			ResultSet rs = pt.executeQuery();
			
			while(rs.next()) {
				Vendor v= new Vendor(
						rs.getInt("id"),
						rs.getString("name"),
			            rs.getString("category"),
			            rs.getString("phone"),
			            rs.getString("email"),
			            rs.getString("address"),
			            rs.getString("description"),
			            rs.getString("image_url"),
			            rs.getString("status"),
			            rs.getInt("created_by")
						);
				list.add(v);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Vendor> getAllVendors() {
	    List<Vendor> list = new ArrayList<>();

	    String sql = "SELECT * FROM vendors";

	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {

	            Vendor v = new Vendor(
	                rs.getInt("id"),
	                rs.getString("name"),
	                rs.getString("category"),
	                rs.getString("phone"),
	                rs.getString("email"),
	                rs.getString("address"),
	                rs.getString("description"),
	                rs.getString("image_url"),
	                rs.getString("status"),
	                rs.getInt("created_by")
	            );

	            list.add(v);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	public List<Vendor> getInactiveVendors() {

	    List<Vendor> list = new ArrayList<>();

	    String sql = "SELECT * FROM vendors WHERE status = 'INACTIVE'";

	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {

	            Vendor v = new Vendor(
	                rs.getInt("id"),
	                rs.getString("name"),
	                rs.getString("category"),
	                rs.getString("phone"),
	                rs.getString("email"),
	                rs.getString("address"),
	                rs.getString("description"),
	                rs.getString("image_url"),
	                rs.getString("status"),
	                rs.getInt("created_by")
	            );

	            list.add(v);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	public Vendor getVendorById(int id) {
	    Vendor vendor = null;
	    

	    try {
	        Connection conn = DBConnection.getConnection();
	        String sql = "SELECT * FROM vendors WHERE id=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, id);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            vendor = new Vendor(
	                rs.getInt("id"),
	                rs.getString("name"),
	                rs.getString("category"),
	                rs.getString("phone"),
	                rs.getString("email"),
	                rs.getString("address"),
	                rs.getString("description"),
	                rs.getString("image_url"),
	                rs.getString("status"),
	                rs.getInt("created_by")
	            );
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return vendor;
	}
	
	public List<Vendor> getActiveVendorsByCategory(String category) {

	    List<Vendor> list = new ArrayList<>();

	    try {
	        Connection con = DBConnection.getConnection();

	        String sql = "SELECT * FROM vendors WHERE category=? AND status='ACTIVE'";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, category);

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Vendor v = new Vendor(
	                rs.getInt("id"),
	                rs.getString("name"),
	                rs.getString("category"),
	                rs.getString("phone"),
	                rs.getString("email"),
	                rs.getString("address"),
	                rs.getString("description"),
	                rs.getString("image_url"),
	                rs.getString("status"),
	                rs.getInt("created_by")
	            );

	            list.add(v);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	public void softDeleteVendor(int id) {
	    try {
	        Connection conn = DBConnection.getConnection();
	        String sql = "UPDATE vendors SET status='INACTIVE' WHERE id=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, id);
	        ps.executeUpdate();
	    } catch (Exception e) {
	    	
	        e.printStackTrace();
	    }
	}
	
	public boolean restoreVendor(int id) {

	    String sql = "UPDATE vendors SET status = 'ACTIVE' WHERE id = ?";

	    try (Connection con = DBConnection.getConnection();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setInt(1, id);

	        int rows = ps.executeUpdate();

	        return rows > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return false;
	}
	
	public void updateVendor(Vendor vendor) {
	    try {
	        Connection conn = DBConnection.getConnection();
	        String sql = "UPDATE vendors SET name=?, category=?, phone=?, email=?, address=?, description=? WHERE id=?";
	        PreparedStatement ps = conn.prepareStatement(sql);

	        ps.setString(1, vendor.getName());
	        ps.setString(2, vendor.getCategory());
	        ps.setString(3, vendor.getPhone());
	        ps.setString(4, vendor.getEmail());
	        ps.setString(5, vendor.getAddress());
	        ps.setString(6, vendor.getDescription());
	        ps.setInt(7, vendor.getId());

	        ps.executeUpdate();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	
	public List<Vendor> searchVendorsByName(String name) {

	    List<Vendor> list = new ArrayList<>();

	    try (Connection con = DBConnection.getConnection()) {

	    	String sql = "SELECT * FROM vendors WHERE LOWER(name) LIKE ?";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, "%" + name + "%");

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Vendor v = new Vendor();
	            v.setId(rs.getInt("id"));
	            v.setName(rs.getString("name"));
	            v.setCategory(rs.getString("category"));
	            v.setPhone(rs.getString("phone"));
	            v.setEmail(rs.getString("email"));
	            v.setAddress(rs.getString("address"));
	            v.setDescription(rs.getString("description"));

	            list.add(v);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	public int getTotalVendorCount() {
	    int count = 0;
	    try (Connection con = DBConnection.getConnection()) {
	        String sql = "SELECT COUNT(*) FROM vendors";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            count = rs.getInt(1);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return count;
	}
	
	public int getActiveVendorCount() {
	    int count = 0;
	    try (Connection con = DBConnection.getConnection()) {
	        String sql = "SELECT COUNT(*) FROM vendors WHERE status='ACTIVE'";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            count = rs.getInt(1);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return count;
	}
	
	public int getInactiveVendorCount() {
	    int count = 0;
	    try (Connection con = DBConnection.getConnection()) {
	        String sql = "SELECT COUNT(*) FROM vendors WHERE status='INACTIVE'";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            count = rs.getInt(1);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return count;
	}
}
