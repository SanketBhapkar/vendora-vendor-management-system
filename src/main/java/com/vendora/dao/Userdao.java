package com.vendora.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.vendora.model.User;
import com.vendora.util.DBConnection;

public class Userdao {
	
	public boolean registerUser(User user) {
		boolean status = false;
		try(Connection con = DBConnection.getConnection()) {
			
			String sql = "insert into users (username,email,password,role) values(?,?,?,?)";
			PreparedStatement pt = con.prepareStatement(sql);
			
			pt.setString(1, user.getUsername());
			pt.setString(2, user.getEmail());
            pt.setString(3, user.getPassword());
            pt.setString(4, user.getRole());
            
            int rows = pt.executeUpdate();
            
            if(rows>0) {
            	status = true;
            }
            
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public User userLogin(String username,String password) {
		User user = null;
		try (Connection con = DBConnection.getConnection()){
			String sql = "select * from users where username=? and password=?";
			PreparedStatement pt = con.prepareStatement(sql);
			
			pt.setString(1, username);
			pt.setString(2, password);
			
			ResultSet rs = pt.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
		        user.setEmail(rs.getString("email"));
		        user.setRole(rs.getString("role"));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	public List<User> getAllUsers() {
	    List<User> list = new ArrayList<>();

	    try {
	        Connection con = DBConnection.getConnection();
	        String query = "SELECT * FROM users ORDER BY id ASC";
	        PreparedStatement ps = con.prepareStatement(query);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            User u = new User();
	            u.setId(rs.getInt("id"));
	            u.setUsername(rs.getString("username"));
	            u.setEmail(rs.getString("email"));
	            u.setRole(rs.getString("role"));
	            u.setCreatedAt(rs.getTimestamp("created_at"));

	            list.add(u);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	public List<User> searchUsers(String keyword) {
	    List<User> list = new ArrayList<>();

	    try {
	        Connection con = DBConnection.getConnection();
	        String query = "SELECT * FROM users WHERE username LIKE ? OR email LIKE ?";
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setString(1, "%" + keyword + "%");
	        ps.setString(2, "%" + keyword + "%");

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            User u = new User();
	            u.setId(rs.getInt("id"));
	            u.setUsername(rs.getString("username"));
	            u.setEmail(rs.getString("email"));
	            u.setRole(rs.getString("role"));
	            u.setCreatedAt(rs.getTimestamp("created_at"));

	            list.add(u);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	public boolean deleteUserById(int id) {
	    boolean status = false;

	    try {
	        Connection con = DBConnection.getConnection();
	        String query = "DELETE FROM users WHERE id=?";
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setInt(1, id);

	        status = ps.executeUpdate() > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return status;
	}

}
