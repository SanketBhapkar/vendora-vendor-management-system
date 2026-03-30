package com.vendora.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vendora.dao.Userdao;
import com.vendora.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Userdao dao = new Userdao();
        User user = dao.userLogin(username, password);

        if (user != null) {

            HttpSession session = request.getSession();
            session.setAttribute("USER", user);

            if ("ADMIN".equals(user.getRole())) {
            	response.sendRedirect(request.getContextPath() + "/admin/adminDashboard");
            } else {
            	String redirectURL = (String) session.getAttribute("redirectAfterLogin");

            	if (redirectURL != null) {
            	    session.removeAttribute("redirectAfterLogin");
            	    response.sendRedirect(redirectURL);
            	} else {
            	    response.sendRedirect("index.jsp");
            	}
            }

        } else {
            response.sendRedirect("Login.jsp?error=1");
        }
    }
}