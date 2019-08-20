package com.localhost;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String email = request.getParameter("email");
		String pass = request.getParameter("psw");
		String oemail,opass;
		response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");

		// Set standard HTTP/1.0 no-cache header.
		response.setHeader("Pragma", "no-cache");
		try 
		{
			Connection c = JDBC01.getConnections();
			PreparedStatement ps = c.prepareStatement("select * from users where email=?");
			ps.setString(1,email);
			ResultSet rs =ps.executeQuery();
			
			if(!rs.next())
				response.sendRedirect("Welcomefile.jsp");
			else
			{
				
				do {
					
					oemail = rs.getString("email");
					opass = rs.getString("password");
					if(opass.equals(pass))
					{
						HttpSession session = request.getSession();
						session.setAttribute("username",email);
						
						response.sendRedirect("UserLoggedIn.jsp");
						
					}
					
					else
					{
						
						
						out.println("<h1>"+"Invalid Credentials"+"</h1>");
						out.println("<a href=\"Welcomefile.jsp\">"+"Home"+"</a>");
					}
					
				}while(rs.next());
				
				
				
			}
			
		} 
		
		catch(Exception e)
		{
			e.printStackTrace();
		}

		
	}

}
