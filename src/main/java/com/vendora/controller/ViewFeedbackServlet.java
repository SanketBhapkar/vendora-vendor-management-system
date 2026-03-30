package com.vendora.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vendora.dao.FeedbackDao;
import com.vendora.model.Feedback;

@WebServlet("/admin/viewFeedback")
public class ViewFeedbackServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        FeedbackDao dao = new FeedbackDao();
        List<Feedback> list = dao.getAllFeedback();

        request.setAttribute("feedbackList", list);
        RequestDispatcher rd = request.getRequestDispatcher("/admin/Feedback.jsp");
        rd.forward(request, response);
    }
}