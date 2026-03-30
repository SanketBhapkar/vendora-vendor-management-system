package com.vendora.test;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.vendora.util.DBConnection;

public class UserFetchTest {
	public static void main(String[] args) {
		try {
			
			Connection con = DBConnection.getConnection();
			
			String sql = "select * from users";
			PreparedStatement pt = con.prepareStatement(sql);
			ResultSet rs = pt.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String username = rs.getString("username");
				String email = rs.getString("email");
				String pass = rs.getString("password");
				String role = rs.getString("role");
				Date dt = rs.getDate("created_at");
				
				  System.out.println("ID: " + id);
	                System.out.println("Username: " + username);
	                System.out.println("Password: " + pass);
	                System.out.println("Role: " + role);
	                System.out.println("Role: " + dt);
	                System.out.println("----------------------");
				
			}
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
