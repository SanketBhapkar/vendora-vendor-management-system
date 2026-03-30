package com.vendora.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static final String url="jdbc:mysql://localhost:3306/vendoraDB";
	private static final String username = "root";
	private static final String password= "4249";
	
	public static Connection getConnection() throws ClassNotFoundException,SQLException{
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(url,username,password);
		
	}
}
