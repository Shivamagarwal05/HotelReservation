<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>




<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Booking</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}
.main
{

	
	padding:100px 0px 100px 450px;
		
}
.input-container {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  width: 100%;
  margin-bottom: 15px;

}
i[id=na],i[id=nc],input[id=nas],input[id=nac]{

display:none;

}

.icon {
  padding: 10px;
  background: #333;
  color: white;
  min-width: 50px;
  text-align: center;
}

.input-field {
  width: 100%;
  padding: 10px;
  outline: none;
}

.input-field:focus {
  border: 2px solid #333;
}

/* Set a style for the submit button */
.btn {
  background-color: #333;
  color: white;
  padding: 15px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.btn:hover {
  opacity: 1;
}
</style>
</head>
<body>
	<%
	
		String username = (String)session.getAttribute("username");
	if(username==null)
	{
		response.sendRedirect("Welcomefile.jsp");
		return;
	}
		
	
	
	
	%>
	<div class="main">
<form action="ShowHotel.jsp" method="post" style="max-width:500px;margin=auto;">
  <h2>Show Hotels</h2>
  
  	
<div class="input-container" required>
    <i class="fa fa-calendar icon"></i>
  <select class="input-field" name = "city" >
     <option value="" disabled selected hidden>Select City</option>
    <option value="1">Delhi</option>
    <option value="2">Chandigarh</option>
    <option value="3">Srinagar</option>j
    <option value="4">Darjeling</option>
    <option value="5">Mumbai</option>
    <option >Banglore</option>
    
  </select>
</div>
  
  	  <div class="input-container">
    <i class="fa fa-calendar icon"></i>
    <input class="input-field" type="text" placeholder="CheckIn" name="checkindate" onfocus="this.type='date'" onblur="(this.type='text')" >
  </div>
  
  <div class="input-container">
    <i class="fa fa-calendar icon"></i>
    <input class="input-field" type="text" placeholder="CheckOut" name="checkoutdate" onfocus="this.type='date'" onblur="(this.type='text')">
  </div>
  <div class="input-container" >
    <i class="fa fa-calendar icon"></i>
  <select class="input-field" name="roomtype" onchange=displayfunction() id="room"  required>
     <option value="" disabled selected hidden>room Type</option>
    <option value="Single">Single</option>
    <option value="Double">Double</option>
    <option value="Family">Family</option>
   </select>
    </div>
   <script>

function displayfunction()
{
	console.log("2345");
	var sel = document.getElementById("room");
	var val = sel.options[sel.selectedIndex].value;
	if(val == 3)
		{
		console.log(val);
		document.getElementById("na").style.display = "inline";
		document.getElementById("nc").style.display = "initial";
		document.getElementById("nas").style.display = "inline";
		document.getElementById("nac").style.display = "initial";
		
		
		}
	else
		{
		
		document.getElementById("na").style.display = "none";
		document.getElementById("nc").style.display = "none";
		document.getElementById("nas").style.display = "none";
		document.getElementById("nac").style.display = "none";
		
		
		}
	console.log(val);
	
}



</script>
  
   <div class="input-container" >
    <i class="fa fa-calendar icon" id = "na"></i>
    <input class="input-field" type="text" placeholder="No Of Adults" id = "nas" name="adults" onfocus="this.type='number'" onblur="(this.type='text')" >
  </div>
    <span class="input-container" >
    <i class="fa fa-calendar icon" id="nc"></i>
    <input class="input-field" type="text" placeholder="No Of childs" id="nac" name="childs" onfocus="this.type='number'" onblur="(this.type='text')" >
  </span>
  
  <button type="submit" class="btn">Show</button>
</form>
</div>
</body>
</html>