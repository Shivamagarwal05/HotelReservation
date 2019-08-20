<%@page import="com.localhost.BookingEntryInDatabase"%>
<%@page import="com.localhost.BookingDetailsBean"%>
<%@page import="com.localhost.MyHotels"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

	.rightcolumn {
  float: left;
  width: 60%;
  background-color: #f1f1f1;
  padding-left: 20px;
}
.card {
  background-color: white;
  padding: 20px;
  margin-top: 20px;
  text-align:justify;
}
.cincout{
	
	border-top:2px inset ;
	border-bottom:2px outset ;
	
	
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
//response.setDateHeader("Expires", -1);

		String username =(String) session.getAttribute("username");
		HashMap<String,MyHotels> map =	(HashMap<String,MyHotels>)session.getAttribute("hotels");
		BookingDetailsBean obj = (BookingDetailsBean)session.getAttribute("bookingdetails");
	if(username==null || map==null || obj==null)
	{
		response.sendRedirect("Welcomefile.jsp");
		return;
		
		
	}
		String guestname = request.getParameter("guestname");
		String guestmobileno = request.getParameter("guestmobileno");
	String guestemail = request.getParameter("guestemail");
		String hid = obj.getHid();
	MyHotels hotel = map.get(hid);
	String roomno = hotel.getRoomsavail().get(0);
	obj.setRoomno(roomno);
	obj.setBookingdate(BookingDetailsBean.date(new java.sql.Date(System.currentTimeMillis())));
	obj.setGuestemailid(guestemail);
	obj.setGuestmobileno(guestmobileno);
	obj.setGuestname(guestname);
	obj.setUsername(username);
	String bid = String.valueOf(obj.hashCode());
	obj.setBid(bid);
	boolean res = BookingEntryInDatabase.bookingEntry(obj, hotel.getContactno());
%>
 <div class="rightcolumn">
    <div class="card">
      <h2>Booking Details</h2>
      <h2>Room No.<%=obj.getRoomno() %></h2>
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
		 <h5>Booking Amount:Rs.<%=obj.getBookingamount() %>(<%=obj.getNoofdays() %>x<%=obj.getPricepernight() %>)</h5>
		
		 </div>
    
    </div>
   
  </div>

<%

	session.setAttribute("hotels",null);
	session.setAttribute("bookingdetails",null);



%>
</body>
</html>