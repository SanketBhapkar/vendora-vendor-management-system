package com.vendora.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.vendora.model.Feedback;
import com.vendora.util.DBConnection;

public class FeedbackDao {
	
	public boolean addFeedback(Feedback f) {
	    boolean status = false;

	    try {
	        Connection con = DBConnection.getConnection();
	        String query = "INSERT INTO feedback(user_id, message) VALUES(?, ?)";

	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setInt(1, f.getUserId());
	        ps.setString(2, f.getMessage());

	        status = ps.executeUpdate() > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return status;
	}
	
	
	
	public List<Feedback> getAllFeedback() {
	    List<Feedback> list = new ArrayList<>();

	    try {
	        Connection con = DBConnection.getConnection();
	        String query = "SELECT * FROM feedback ORDER BY id DESC";

	        PreparedStatement ps = con.prepareStatement(query);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Feedback f = new Feedback();
	            f.setId(rs.getInt("id"));
	            f.setUserId(rs.getInt("user_id"));
	            f.setMessage(rs.getString("message"));
	            f.setCreatedAt(rs.getTimestamp("created_at"));

	            list.add(f);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}

}
