package com.ecommerce.controllers;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.ecommerce.models.*;
import com.ecommerce.persistance.*;

public class RegistrationController extends HttpServlet {
	
    private String step = "";
    private RegistrationBean registrationBean = new RegistrationBean();

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		step = request.getParameter("step");
		if (step.equals("1")) {
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String confirmPassword = request.getParameter("confirmPassword");

			if (username.equals("") || password.equals("") || email.equals("") || confirmPassword.equals("")) {
				request.getRequestDispatcher("registration_1?step=1&errorMsg=1").include(request, response);
			}else{
				if (password.equals(confirmPassword)) {
					registrationBean.setUsername(username);
					registrationBean.setEmail(email);
					registrationBean.setPassword(password);
					request.getRequestDispatcher("/WEB-INF/classes/com/ecommerce/views/registration_2.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("registration_1?step=1&errorMsg=2").include(request, response);
				}
			}
		}else if (step.equals("2")) {
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String dob = request.getParameter("dob");
			String gender = request.getParameter("gender");
			String mobile = request.getParameter("mobile");
			String address = request.getParameter("address");
			
			if (firstName.equals("") || lastName.equals("") || dob.equals("") || gender.equals("") || mobile.equals("") || address.equals("")) {
				request.getRequestDispatcher("/WEB-INF/classes/com/ecommerce/views/registration_2.jsp?step=2&errorMsg=1").include(request, response);
			}else{
				registrationBean.setFirstName(firstName);
				registrationBean.setLastName(lastName);
				registrationBean.setDob(dob);
				registrationBean.setGender(gender);
				registrationBean.setMobile(mobile);
				registrationBean.setAddress(address);
				
				InsertUser.insertNewUser(registrationBean);
				response.sendRedirect("login");
				return;
			}
		}else {
			request.getRequestDispatcher("registration_1").forward(request, response);
		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("registration_1");
	}
}
