<%-- 
    Document   : login
    Created on : Dec 3, 2019, 10:52:44 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<%= request.getContextPath()%>/css/main.css" rel="stylesheet" type="text/css"/>
        <link href="<%= request.getContextPath()%>/css/util.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
<div class="limiter">
<div class="container-login100">
<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
<form class="login100-form validate-form">
<span class="login100-form-title p-b-33">
Account Login
</span>
<div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
<input class="input100" type="text" name="email" placeholder="Email">
<span class="focus-input100-1"></span>
<span class="focus-input100-2"></span>
</div>
<div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
<input class="input100" type="password" name="pass" placeholder="Password">
<span class="focus-input100-1"></span>
<span class="focus-input100-2"></span>
</div>
<div class="container-login100-form-btn m-t-20">
<button class="login100-form-btn">
Sign in
</button>
</div>
<div class="text-center p-t-45 p-b-4">
<span class="txt1">
Forgot
</span>
<a href="#" class="txt2 hov1">
Username / Password?
</a>
</div>
<div class="text-center">
<span class="txt1">
Create an account?
</span>
<a href="#" class="txt2 hov1">
Sign up
</a>
</div>
</form>
</div>
</div>
</div>

<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script src="vendor/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>

<script src="vendor/animsition/js/animsition.min.js" type="text/javascript"></script>

<script src="vendor/bootstrap/js/popper.js" type="text/javascript"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<script src="vendor/select2/select2.min.js" type="text/javascript"></script>

<script src="vendor/daterangepicker/moment.min.js" type="text/javascript"></script>
<script src="vendor/daterangepicker/daterangepicker.js" type="text/javascript"></script>

<script src="vendor/countdowntime/countdowntime.js" type="text/javascript"></script>

<script src="js/main.js" type="text/javascript"></script>

<script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13" type="text/javascript"></script>
<script type="text/javascript">
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-23581568-13');
	</script>


</body>
</html>
