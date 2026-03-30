package com.vendora.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vendora.model.Contact;
import com.vendora.util.DBConnection;

@WebServlet("/admin/viewMessages")
public class ViewMessagesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Contact> messageList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM contact ORDER BY created_at DESC";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Contact c = new Contact();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setPhone(rs.getString("phone"));
                c.setEmail(rs.getString("email"));
                c.setMessage(rs.getString("message"));
                c.setCreatedAt(rs.getTimestamp("created_at"));

                messageList.add(c);
            }

            request.setAttribute("messageList", messageList);
            request.getRequestDispatcher("/admin/adminMessages.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}