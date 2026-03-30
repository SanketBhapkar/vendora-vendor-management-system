package com.vendora.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.vendora.dao.VendorDAO;
import com.vendora.model.User;
import com.vendora.model.Vendor;
@MultipartConfig
@WebServlet("/admin/addVendor")
public class AddVendorServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request,
	                     HttpServletResponse response)
	        throws ServletException, IOException {

	    request.getRequestDispatcher("/admin/addVendor.jsp")
	           .forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    HttpSession session = request.getSession();
	    User admin = (User) session.getAttribute("USER");

	    String name = request.getParameter("name");
	    String category = request.getParameter("category");
	    String phone = request.getParameter("phone");
	    String email = request.getParameter("email");
	    String address = request.getParameter("address");
	    String description = request.getParameter("description");

	    Part filePart = request.getPart("image");
	    String fileName = filePart.getSubmittedFileName();
	    String newFileName = System.currentTimeMillis() + "_" + fileName;

	    String uploadPath = getServletContext().getRealPath("/uploads");

	    File uploadDir = new File(uploadPath);
	    if (!uploadDir.exists()) {
	        uploadDir.mkdirs();
	    }

	    filePart.write(uploadPath + File.separator + newFileName);
	    String imagePath = "uploads/" + newFileName;

	    Vendor vendor = new Vendor(name, category, phone, email, address,
	            description, imagePath, "ACTIVE", admin.getId());

	    VendorDAO dao = new VendorDAO();
	    boolean result = dao.addVendor(vendor);

	    if (result) {
	        response.sendRedirect(request.getContextPath() + "/admin/adminDashboard");
	    } else {
	        response.sendRedirect(request.getContextPath() + "/admin/addVendor");
	    }
	}

}
