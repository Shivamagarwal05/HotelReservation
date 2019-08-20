<%@page import="com.localhost.BookingDetailsBean"%>
<%@page import="com.localhost.MyBookingsBean"%>
<%@page import="com.localhost.MyHotels"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="BookHotel.css" type="text/css"></link>
</head>
<body>
<%

response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

//response.setDateHeader("Expires", -1);
MyHotels hotel =null;
String username =(String) session.getAttribute("username");
HashMap<String,MyHotels> map =	(HashMap<String,MyHotels>)session.getAttribute("hotels");
System.out.println(map+"In Bookhotel jsp");
BookingDetailsBean obj = (BookingDetailsBean)session.getAttribute("bookingdetails");
if(map==null || obj == null)
{
	response.sendRedirect("UserLoggedIn.jsp");
	return;
	
}
	String hid =request.getParameter("hid");
	 hotel = map.get(hid);
	
	String roomtype = (String)obj.getRoomtype();
	long price=0;
	long unitprice;
	long nodays = obj.getNoofdays();
	if(roomtype.equals("Single"))
	
		unitprice = hotel.getPricesingleroom();
	else if(roomtype.equals("Double"))
	
		unitprice = hotel.getPricedoubleroom();
	else
			unitprice = hotel.getPricefamilyroom();
	
	price = 	nodays * unitprice; 

obj.setBookingamount(price);
obj.setHid(hid);
obj.setPricepernight(unitprice);
obj.setUsername(username);


%>

<div class="header">
 <div ><h3 ><%= username %></h3></div>
  <h1>WELCOME TO indiatours.com</h1>
  <p>Get the best Hospitalty here..</p>
</div>



<div class="row">
  <div class="leftcolumn">
    <div class="Guestcard">
    <h1>Guest Details</h1>
    <form action="BookingProcessing.jsp" method="post">
     <div class="input-container">
    <i class="fa fa-user icon"></i>
    <input class="input-field" type="text" placeholder="Full Name" name="guestname" required >
  </div>
  
  <div class="input-container">
    <i class="fa fa-phone icon"></i>
    <input class="input-field" type="text" placeholder="Mobile No." name="guestmobileno" required >
  </div>
  <div class="input-container">
    <i class="fa fa-envelope icon"></i>
    <input class="input-field" type="email" placeholder="Email Id" name="guestemail" required >
  </div>
    <button type="submit" class="btn">Book</button>
</form>
  
     
    </div>
   
  </div>
  <div class="rightcolumn">
    <div class="card">
      <h2>Booking Details</h2>
       <h2><%= hotel.getHotelname()%></h2>
      
      <h5><%=hotel.getAddress() %></h5>
      
      <h3>City:<%=hotel.getCity() %></h3>
      <h6>Contact Info :  <%=  hotel.getContactno() %></h6>
      <div class="cincout">
      	<h5>CheckinDate:</h5>
      	<h4><%=obj.getCheckindate() %></h4>
      	<h5>CheckoutDate:</h5>
      	<h4><%=obj.getCheckoutdate()%></h4>
      <br>
      	<h5>CheckinTime:</h5>
      	<h4>12:00 PM</h4>
      	<h5>CheckoutTime:</h5>
      	<h4>11:00AM</h4>
      </div>
		 <div class="cincout">
		 <h3>1 Guests <%=obj.getRoomtype()%> Room</h3>
		 </div>
		  <div class="cincout">
		 <h2>Payment Details</h2>
		 <h5>Booking Amount:Rs.<%=price %>(<%=nodays %>x<%=unitprice %>)</h5>
		
		 </div>
    
    </div>
   
  </div>
</div>



</body>
</html>
