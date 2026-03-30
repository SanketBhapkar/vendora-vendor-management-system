package com.vendora.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.vendora.dao.VendorDAO;
import com.vendora.model.Vendor;

@WebServlet("/admin/editVendor")
public class EditVendorServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam == null) {
            response.sendRedirect(request.getContextPath() + "/admin/adminDashboard");
            return;
        }

        int id = Integer.parseInt(idParam);

        VendorDAO dao = new VendorDAO();
        Vendor vendor = dao.getVendorById(id);

        if (vendor == null) {
            response.sendRedirect(request.getContextPath() + "/admin/adminDashboard");
            return;
        }

        request.setAttribute("vendor", vendor);
        request.getRequestDispatcher("/admin/editVendor.jsp").forward(request, response);
    }
}