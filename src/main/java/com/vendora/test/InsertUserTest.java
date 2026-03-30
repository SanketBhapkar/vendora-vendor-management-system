package com.vendora.test;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.vendora.util.DBConnection;

public class InsertUserTest {
	public static void main(String[] args) {
		try {
			Connection con = DBConnection.getConnection();
			
			String sql = "insert into users (username,email,password,role) values('user1','user1@gmail.com','user123','USER')";
			
			PreparedStatement pt = con.prepareStatement(sql);
			pt.executeUpdate();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
