<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="welcomecss.css" type="text/css"></link>
</head>
<body>
<div class="main-container">

<div class="header">
  <h1>WELCOME TO indiatours.com</h1>
  <p>Get the best Hospitalty here..</p>
	

</div>

<div class="topnav">
  <a href="#">Admin</a>
  <a href="#">Hotels</a>
  <a href="#">Contact us</a>
  <a href="#">Share Your Hotel With Us</a>
  <a href="#">Feedback</a>
  <a href="Register.html">Signup(New User?)</a>
  <a href="Login.jsp">Login</a>
 
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
  
    <div class="card">
      <h2>TITLE HEADING</h2>
      <h5>Title description, Sep 2, 2017</h5>
	<p>Some text..</p>
       lwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
      wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
     
     </div> 

</div>

<div class="footer">
  <p>Footer</p>
</div>
</div>


</body>
</html>