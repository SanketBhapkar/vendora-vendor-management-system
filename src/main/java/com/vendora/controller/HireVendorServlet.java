package com.vendora.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.vendora.model.User;
import com.vendora.util.DBConnection;

@WebServlet("/hireVendor")
public class HireVendorServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("USER") == null) {
        	String currentUrl = request.getRequestURI() + "?" + request.getQueryString();

        	request.getSession().setAttribute("redirectAfterLogin", currentUrl);

        	response.sendRedirect(request.getContextPath() + "/Login.jsp");
            return;
        }

        User user = (User) session.getAttribute("USER");

        String vendorIdParam = request.getParameter("id");

        if (vendorIdParam == null) {
            response.sendRedirect(request.getContextPath() + "/vendors");
            return;
        }

        int vendorId = Integer.parseInt(vendorIdParam);

        try {
            Connection con = DBConnection.getConnection();

           
            String query = "INSERT INTO hire_requests (vendor_id, user_id) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, vendorId);
            ps.setInt(2, user.getId());

            ps.executeUpdate();

           
            response.sendRedirect(request.getContextPath() +
                    "/vendorDetails?id=" + vendorId + "&hire=success");

        } catch (SQLIntegrityConstraintViolationException e) {

            
            response.sendRedirect(request.getContextPath() +
                    "/vendorDetails?id=" + vendorId + "&hire=exists");

        } catch (Exception e) {
            e.printStackTrace();

            response.sendRedirect(request.getContextPath() +
                    "/vendorDetails?id=" + vendorId + "&hire=error");
        }
    }
}