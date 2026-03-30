package com.vendora.test;

import java.sql.Connection;

import com.vendora.util.DBConnection;

public class TestConnection {
	public static void main(String[] args) {
		try {
			Connection con = DBConnection.getConnection();
			if(con != null) {
				System.out.println("Connection Successfull");
				con.close();
			}
		} catch (Exception e) {
			System.out.println("Connection failed");
		}
	}

}
