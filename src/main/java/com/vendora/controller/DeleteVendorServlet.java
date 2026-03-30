package com.vendora.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vendora.dao.VendorDAO;

@WebServlet("/admin/deleteVendor")
public class DeleteVendorServlet extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam != null) {
            int id = Integer.parseInt(idParam);

            VendorDAO dao = new VendorDAO();
            dao.softDeleteVendor(id);
        }

        response.sendRedirect(request.getContextPath() + "/admin/adminDashboard");
    }

}
