<%@page import="com.localhost.MyBookingsBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MyBookings</title>
<link rel="stylesheet" href="MyBooking.css" type="text/css"></link>
</head>
<body>
<%
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setDateHeader("Expires", -1);
		String username =(String) session.getAttribute("username");
		if(username==null)
		{
			System.out.println("$$$$$$$$$");
			response.sendRedirect("Welcomefile.jsp");
			
		}
		ArrayList<MyBookingsBean> list = MyBookingsBean.getMyBookings(username);
		System.out.println(list.size());
%>
<div class="main-container">
		<div class="header">
		<div ><h3 ><%= username %></h3></div>
  <h1>WELCOME TO indiatours.com</h1>
  <p>Get the best Hospitalty here..</p>
	
	
</div>

<div class="topnav">
  
  <a href="#">Hotels</a>
  
  <a href="#">Contact us</a>
  <a href="#">Share Your Hotel With Us</a>
  <a href="">Feedback</a>
  <a href="Logout?username=<%=username %>"> Logout</a>
 
</div>

<div class="row">
  
    <div class="card">
   		
  			<table >
  				 <tr>
						      <th>BID</th>
						      <th >username</th>
						      <th>Booking date</th>
						      <th>checkin</th>
						      <th>checkout</th>
						      <th>Hid</th>
						      <th>Roomno</th>
						      <th>Mobileno</th>
						    </tr>
						    <%  for(MyBookingsBean b:list )  
						    {
						    %>
						    <tr>
						      <td><%=b.getBid()%></td>
						      <td><%=b.getUsername()%></td>
						      <td><%=b.getBookingdate() %></td>
						      <td><%=b.getCheckin() %></td>
						      <td><%=b.getCheckout()%></td>
						      <td><%=b.getHid()%></td>
						      <td><%=b.getRoomno()%></td>
						      <td><%=b.getMobileno()%></td>
						    </tr>
						  	<% } %>
					
 			</table>
   
</div>
</div>

  
   
<div class="footer">
  <p>Footer</p>
</div>		
</div>

</body>
</html>