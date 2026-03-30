package com.vendora.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vendora.dao.Userdao;
import com.vendora.model.User;

@WebServlet("/admin/deleteUser")
public class DeleteUserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Userdao dao = new Userdao();

 
        List<User> users = dao.getAllUsers();
        for (User u : users) {
            if (u.getId() == id && "ADMIN".equals(u.getRole())) {
                response.sendRedirect(request.getContextPath() + "/admin/viewUsers");
                return;
            }
        }

        dao.deleteUserById(id);

        response.sendRedirect(request.getContextPath() + "/admin/viewUsers");
    }
}