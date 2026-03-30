package com.vendora.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.vendora.dao.VendorDAO;
import com.vendora.model.Vendor;

@WebServlet("/admin/updateVendor")
public class UpdateVendorServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String description = request.getParameter("description");

        
        if(name == null || name.trim().isEmpty() ||
           email == null || email.trim().isEmpty()) {

            request.setAttribute("error", "All fields are required!");
            request.getRequestDispatcher("/admin/editVendor.jsp")
                   .forward(request, response);
            return;
        }

        Vendor vendor = new Vendor();
        vendor.setId(id);
        vendor.setName(name);
        vendor.setCategory(category);
        vendor.setPhone(phone);
        vendor.setEmail(email);
        vendor.setAddress(address);
        vendor.setDescription(description);

        VendorDAO dao = new VendorDAO();
        dao.updateVendor(vendor);

        response.sendRedirect(request.getContextPath() + "/admin/adminDashboard?success=updated");
    }
}