package com.vendora.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.vendora.model.User;
import com.vendora.util.DBConnection;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("USER") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        
        if (name == null || name.trim().isEmpty() ||
            phone == null || phone.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            message == null || message.trim().isEmpty()) {

            response.sendRedirect("contact.jsp?error=empty");
            return;
        }

     
        try {
            Connection con = DBConnection.getConnection();

            String query = "INSERT INTO contact (name, email, phone, message) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, message);

            int result = ps.executeUpdate();

            if (result > 0) {
                response.sendRedirect("contact.jsp?success=1");
            } else {
                response.sendRedirect("contact.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("contact.jsp?error=1");
        }
    }
}