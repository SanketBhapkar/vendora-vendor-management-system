package com.vendora.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.vendora.dao.HireRequestDAO;
import com.vendora.model.HireRequest;

@WebServlet("/admin/hireRequests")
public class HireRequestServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       
        HireRequestDAO dao = new HireRequestDAO();
        List<HireRequest> list = dao.getAllRequests();

       
        request.setAttribute("hireList", list);

       
        request.getRequestDispatcher("/admin/adminHireRequests.jsp")
               .forward(request, response);
    }
}