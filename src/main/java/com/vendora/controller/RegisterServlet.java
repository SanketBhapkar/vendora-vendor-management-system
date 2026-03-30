package com.vendora.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vendora.dao.Userdao;
import com.vendora.model.User;
@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		
		//Getting data from user
		String username = request.getParameter("username");
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        
        if(!password.equals(confirmPassword)) {
        	response.sendRedirect("register.jsp?error=password");
        	return;
        }
        
        //creating an object
        User user = new User(username,email,password,"USER");
        
        //calling dao
        Userdao dao = new Userdao();
        boolean status= dao.registerUser(user);
        
        //redirection based on stauts
        if(status) {
        	response.sendRedirect("Login.jsp");
        }else {
			response.sendRedirect("Register.jsp?error=1");
		}
        
	}
}
