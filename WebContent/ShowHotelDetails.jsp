<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.localhost.MyHotels" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <%
  	HashMap<String,MyHotels> map =	(HashMap<String,MyHotels>)session.getAttribute("hotels");
  
  	String hid =request.getParameter("hid");
  	MyHotels hotel = map.get(hid);
  			
  %>
<link rel="stylesheet" href="ShowHotel.css" type="text/css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=hotel.getHotelname() %>></title>
</head>
<body>
		<div class="row">
 
    <div class="card">
     
      <h2><%= hotel.getHotelname()%></h2>
      <br>
      <h3><%=hotel.getAddress() %></h3>
      <br>
      <h3>City:<%=hotel.getCity() %></h3>
      <h2>Contact Info :  <%=  hotel.getContactno() %></h2>
	<p>Description...</p>
     <%=hotel.getDescription() %>
     <p>Pricing</p>
     <h4>Single Room (One Night Stay):Rs.<%=hotel.getPricesingleroom() %></h4>
     <h4>Double Room (One Night Stay):Rs.<%=hotel.getPricedoubleroom() %></h4>
     <h4>Family Room(Max 3 Adults(5+ yrs.) and Max 3 childs(1-5 yrs.))(One Night Stay):Rs.<%=hotel.getPricefamilyroom() %></h4>
     </div> 
     

</div>

</body>
</html>