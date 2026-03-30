package com.vendora.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vendora.dao.VendorDAO;
import com.vendora.model.Vendor;
@WebServlet("/vendors")
public class UserVendorServlet extends HttpServlet{
	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
		 
		 String category=request.getParameter("category");
		  
	        VendorDAO dao = new VendorDAO();
	        List<Vendor> list;
	        
	        
	        if(category !=null && !category.trim().isEmpty()) {
	        	list = dao.getActiveVendorsByCategory(category);
	        	request.setAttribute("selectedCategory",category);
	        }else {
				list = dao.getActiveVendors();
			}
	        
	        request.setAttribute("vendorList", list);
	        request.getRequestDispatcher("/vendors.jsp").forward(request, response);
	    }
}
