<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/SignUp.css">
	<title>SignUp</title>
</head>
<body>
	<div id="login-box">
  		<div class="div-signup">
                    <form action="SignUp" method="post">
  			
    			<h1>Sign up</h1>
                        <%String error_username = "";
                            String error_pass = "";
                            String error_mail = "";
                            String error_phone = ""; %>
                        <% if(request.getAttribute("error_username") != null){
                               error_username = request.getAttribute("error_username").toString();} %>
                        <% if(request.getAttribute("error_pass") != null){
                            error_pass = request.getAttribute("error_pass").toString();} %>
                        <% if(request.getAttribute("error_email") != null){
                            error_mail = request.getAttribute("error_email").toString();} %>
                        <% if(request.getAttribute("error_phone") != null){
                            error_phone = request.getAttribute("error_phone").toString();} %>
                        
                        <p style="color: red;"><%= error_username %></p>
    			<input type="text" name="username" placeholder="Username" required/>
    			<input type="password" name="password" placeholder="Password" required/>
                        <p style="color: red;"><%= error_pass %></p>
    			<input type="password" name="password2" placeholder="Retype password" required/>
    			<input type="text" name="fullname" placeholder="Full Name" required/>
    			<input type="text" name="address" placeholder="Address" required/>
                        <p style="color: red;"><%= error_mail%></p>
    			<input type="text" name="email" placeholder="E-mail" required/>
                        <p style="color: red;"><%= error_phone%></p>
    			<input type="number" name="phone" placeholder="Phone" required/>
    			<input type="submit" name="signup_submit" value="Sign up" />
    		</form>
            </div>
                        
    </div>
    
</body>
</html>