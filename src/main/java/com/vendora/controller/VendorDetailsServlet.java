package com.vendora.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vendora.dao.VendorDAO;
import com.vendora.model.Vendor;

@WebServlet("/vendorDetails")
public class VendorDetailsServlet extends HttpServlet{
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		String IdParameter  = request.getParameter("id");
		if (IdParameter == null) {
            response.sendRedirect("vendors");
            return;
        }

        int id = Integer.parseInt(IdParameter);

        VendorDAO dao = new VendorDAO();
        Vendor vendor = dao.getVendorById(id);

        if (vendor == null) {
            response.sendRedirect("vendors");
            return;
        }

        request.setAttribute("vendor", vendor);
        request.getRequestDispatcher("/vendorDetails.jsp")
               .forward(request, response);
	}
}
