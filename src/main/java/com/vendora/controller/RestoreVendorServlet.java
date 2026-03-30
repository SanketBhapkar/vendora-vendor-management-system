package com.vendora.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.vendora.dao.VendorDAO;
import com.vendora.model.User;

@WebServlet("/admin/restoreVendor")
public class RestoreVendorServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam != null) {

            int id = Integer.parseInt(idParam);

            VendorDAO dao = new VendorDAO();
            dao.restoreVendor(id);
        }

        response.sendRedirect(request.getContextPath() + "/admin/adminDashboard?status=inactive");
    }
}