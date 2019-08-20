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


@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String email = request.getParameter("email");
		String pass = request.getParameter("psw");
		response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");

		// Set standard HTTP/1.0 no-cache header.
		response.setHeader("Pragma", "no-cache");
		try 
		{
			Connection c = JDBC01.getConnections();
			PreparedStatement ps = c.prepareStatement("insert into users values(?,?)");
			ps.setString(1,email);
			ps.setString(2,pass);
			ps.executeUpdate();
			response.sendRedirect("Welcomefile.jsp");
			
		} 
		catch (SQLIntegrityConstraintViolationException e) 
		{
			out.print("User Already Registered");
			out.write(
			         "<html>\n" +
			            "<head> </head>\n" +
			            "<body >\n" +
			            "<a href=\"Welcomefile.jsp\">"+"Home"+"</a>"
			            +"</body>" +
			         "</html>"
			      );
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
