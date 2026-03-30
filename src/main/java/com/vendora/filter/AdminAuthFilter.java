package com.vendora.filter;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;

import com.vendora.model.User;

@WebFilter("/admin/*")   
public class AdminAuthFilter implements Filter {

    public void doFilter(ServletRequest req,
                         ServletResponse res,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/Login.jsp");
            return;
        }

        User user = (User) session.getAttribute("USER");

        if (user == null || !"ADMIN".equals(user.getRole())) {
            response.sendRedirect(request.getContextPath() + "/Login.jsp");
            return;
        }

        chain.doFilter(req, res); 
    }
}