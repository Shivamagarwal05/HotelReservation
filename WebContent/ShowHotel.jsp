<%@page import="com.localhost.BookingDetailsBean"%>
<%@page import="java.util.Map"%>
<%@page import="com.localhost.MyHotels"%>
<%@page import="java.util.ArrayList,java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="ShowHotel.css" type="text/css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show hotel></title>
</head>
<body>
<%
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			
			String username =(String) session.getAttribute("username");
			if(username==null)
			{
				System.out.println("$$$$$$$$$");
				response.sendRedirect("Welcomefile.jsp");
				
			}

		String city = request.getParameter("city");
		String checkindate = request.getParameter("checkindate");
		String checkoutdate = request.getParameter("checkoutdate");
		String roomtype = request.getParameter("roomtype");
		String adults="",childs="";
		if(roomtype.equals("Family"))
		{
			adults = request.getParameter("adults");
			childs = request.getParameter("child");
		}
		BookingDetailsBean obj = BookingDetailsBean.getBookingDetailsBeanObject(city,checkindate,checkoutdate,roomtype,adults,childs);
	System.out.println(Date.valueOf(checkindate));	
	
	HashMap<String,MyHotels> map  = MyHotels.getHotels(city,Date.valueOf(checkindate),Date.valueOf(checkoutdate),roomtype);
	session.setAttribute("hotels",map);
	session.setAttribute("bookingdetails",obj);
	System.out.println(map.size());
	
%>

		<div class="main-container">

<div class="header">
<div ><h3 ><%= username %></h3></div>
  <h1>WELCOME TO indiatours.com</h1>
  <p>Get the best Hospitalty here..</p>
	

</div>

<div class="topnav">
  Hotels  Available For You...<%if(map.isEmpty()){%>
  No Hotels Found....
  <%} %>
 
</div>


  
    <div class="slideshow-container">
	<div class="myslides fade">
		<img src="Images\img_nature_wide.jpg" style="width:100%">
	</div>

	<div class="myslides fade">
		<img src="Images\img_snow_wide.jpg" style="max-width:100%">
	</div>  
	
	<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
	<a class="next" onclick="plusSlides(1)">&#10095;</a>
   </div>
<br>


<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("myslides");
 
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
 
  slides[slideIndex-1].style.display = "block";  
 
}
</script>
<div class="row">
  <%
  	String hid ="";
  	MyHotels hotel = null;
  	for(Map.Entry<String,MyHotels> entry:map.entrySet())
  	{
  		 hid = entry.getKey();
  		 hotel = entry.getValue();		
  %>
    <div class="card">
     
      <h2><%= hotel.getHotelname()%></h2>
      <h5>Contact Info :  <%=  hotel.getContactno() %></h5>
	<p>Description...</p>
     <%=hotel.getDescription() %>
    
    <div class="links">
    <br>
   <a href="ShowHotelDetails.jsp?hid=<%= hid%>" target="_blank">Show Data</a> 
   <a href="BookHotel.jsp?hid=<%= hid%>">Book Now</a> 
     </div>
     <br>
     
     </div> 
<%} %>
</div>

<div class="footer">
  <p>Footer</p>
</div>
</div>
		

</body>
</html>