package com.vendora.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vendora.dao.VendorDAO;
import com.vendora.model.Vendor;
import com.vendora.model.User;

@WebServlet("/admin/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    HttpSession session = request.getSession(false);

	    if (session == null) {
	        response.sendRedirect(request.getContextPath() + "/Login.jsp");
	        return;
	    }

	    User user = (User) session.getAttribute("USER");

	    if (user == null || !"ADMIN".equals(user.getRole())) {
	        response.sendRedirect(request.getContextPath() + "/Login.jsp");
	        return;
	    }

	    VendorDAO dao = new VendorDAO();

	    String status = request.getParameter("status");
	    String search = request.getParameter("search");

	    List<Vendor> vendorList;
	    

	   
	    if (search != null && !search.trim().isEmpty()) {

	        vendorList = dao.searchVendorsByName(search);

	    }
	    
	    else if (status != null) {

	        switch (status) {
	            case "all":
	                vendorList = dao.getAllVendors();
	                break;
	            case "inactive":
	                vendorList = dao.getInactiveVendors();
	                break;
	            default:
	                vendorList = dao.getActiveVendors();
	                break;
	        }

	    }
	    
	    else {
	        vendorList = dao.getActiveVendors();
	    }

	   
	    request.setAttribute("totalCount", dao.getTotalVendorCount());
	    request.setAttribute("activeCount", dao.getActiveVendorCount());
	    request.setAttribute("inactiveCount", dao.getInactiveVendorCount());

	    request.setAttribute("vendorList", vendorList);
	    request.getRequestDispatcher("/admin/adminDashboard.jsp")
	           .forward(request, response);
	}
}