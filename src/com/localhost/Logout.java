package com.localhost;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("Entering in logout,java");
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setDateHeader("Expires", -1);
		System.out.println(request.getParameter("username"));
		request.removeAttribute("username");
		HttpSession session = request.getSession();
		System.out.println("In logout.java"+(String)session.getAttribute("username"));
		session.removeAttribute("username");
		System.out.println("######################");
		session.invalidate();
		System.out.println("8OIU***************************");
		response.sendRedirect("Login.jsp");
		System.out.println("logout end");
		
		
	}

}
