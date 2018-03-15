package com.ecommerce.controllers;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.ecommerce.models.*;
import com.ecommerce.persistance.*;

public class LoginController extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if(username.equals("") || password.equals("")){
			request.getRequestDispatcher("login?errorMsg=1").include(request, response);
		}else {
			ArrayList<RegistrationBean> userList = Users.allUser();
			for(int i=1; i<userList.size(); i++){
				if(userList.get(i).getUsername().equals(username) && userList.get(i).getPassword().equals(password)){
					HttpSession session = request.getSession();
					session.setAttribute("loggedUser", userList.get(i));
					response.sendRedirect("home");
					return;
				}else{
					request.getRequestDispatcher("login?errorMsg=2").include(request, response);
				}
			}
		}
	}

}
