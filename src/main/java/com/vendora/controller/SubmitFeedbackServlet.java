package com.vendora.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vendora.dao.FeedbackDao;
import com.vendora.model.Feedback;
import com.vendora.model.User;

@WebServlet("/submitFeedback")
public class SubmitFeedbackServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("USER") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }

        User user = (User) session.getAttribute("USER");
        String message = request.getParameter("message");

        Feedback f = new Feedback();
        f.setUserId(user.getId());
        f.setMessage(message);

        FeedbackDao dao = new FeedbackDao();
        dao.addFeedback(f);

        response.sendRedirect(request.getContextPath() + "/index.jsp"); // or same page
    }
}