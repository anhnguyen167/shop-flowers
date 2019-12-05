<%-- 
    Document   : login
    Created on : Dec 3, 2019, 10:52:44 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/Login.css">
	<title>Login</title>
</head>
<body>

	
	<div id="id01" class="modal">
    	<div class="div-login">
       		<form class="modal-content animate" action="AuthServlet" method="post">
    			<div class="imgcontainer">
      				<span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close">&times;</span>
      				<img src="Hoa/small_logo.png" alt="Avatar" class="avatar">
    			</div>

	    		<div class="container">
	      			<label for="uname"><b>Username</b></label>
      				<input type="text" placeholder="Enter Username" name="uname" required>

      				<label for="psw"><b>Password</b></label>
      				<input type="password" placeholder="Enter Password" name="psw" required>
        			
        			<label>
        				<input type="checkbox" checked="checked" name="remember"> Remember me
		    		</label>
        		
      				<button type="submit">Login</button>
      			      		
	    		</div>

	    		<div class="container" style="background-color:#f1f1f1">
      				<button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
      				<span class="psw"><a href="SignUp">SignUp?</a></span>
    			</div>
		  	</form>
		</div>
	</div>

	<script>
		// Get the modal
		var modal = document.getElementById('id01');

		// Khi người dùng nhấp vào bất cứ nơi nào bên ngoài phương thức, thì đóng LoginForm lại
		window.onclick = function(event) {
    		if (event.target == modal) {
        		modal.style.display = "none";
    		}
		}
	</script>

</body>
</html>