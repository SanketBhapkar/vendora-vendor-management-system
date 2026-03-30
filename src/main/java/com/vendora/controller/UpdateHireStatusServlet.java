package com.vendora.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.vendora.dao.HireRequestDAO;

@WebServlet("/admin/updateHireStatus")
public class UpdateHireStatusServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       
        String idParam = request.getParameter("id");
        String status = request.getParameter("status");

        if (idParam == null || status == null) {
            response.sendRedirect(request.getContextPath() + "/admin/hireRequests");
            return;
        }

        int id = Integer.parseInt(idParam);

       
        if (!status.equals("APPROVED") && !status.equals("REJECTED")) {
            response.sendRedirect(request.getContextPath() + "/admin/hireRequests");
            return;
        }

        
        HireRequestDAO dao = new HireRequestDAO();
        dao.updateStatus(id, status);

        response.sendRedirect(request.getContextPath() + "/admin/hireRequests");
    }
}