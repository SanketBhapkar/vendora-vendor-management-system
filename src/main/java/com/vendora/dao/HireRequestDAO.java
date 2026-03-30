package com.vendora.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.vendora.model.HireRequest;
import com.vendora.util.DBConnection;

public class HireRequestDAO {

   
    public List<HireRequest> getAllRequests() {

        List<HireRequest> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            String query = "SELECT hr.id, hr.vendor_id, hr.user_id, hr.status, hr.created_at, "
                    + "u.username, u.email, "
                    + "v.name AS vendor_name, v.category "
                    + "FROM hire_requests hr "
                    + "JOIN users u ON hr.user_id = u.id "
                    + "JOIN vendors v ON hr.vendor_id = v.id "
                    + "ORDER BY hr.created_at DESC";

            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                HireRequest hr = new HireRequest();

                hr.setId(rs.getInt("id"));
                hr.setVendorId(rs.getInt("vendor_id"));
                hr.setUserId(rs.getInt("user_id"));

                hr.setUsername(rs.getString("username"));
                hr.setEmail(rs.getString("email"));

                hr.setVendorName(rs.getString("vendor_name"));
                hr.setCategory(rs.getString("category"));

                hr.setStatus(rs.getString("status"));
                hr.setCreatedAt(rs.getTimestamp("created_at"));

                list.add(hr);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

   
    public boolean updateStatus(int id, String status) {

        boolean result = false;

        try (Connection con = DBConnection.getConnection()) {

            String query = "UPDATE hire_requests SET status = ? WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, status);
            ps.setInt(2, id);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                result = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}