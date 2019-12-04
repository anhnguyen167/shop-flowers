<%-- 
    Document   : flowerDetail
    Created on : Dec 3, 2019, 12:56:01 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Flowers Delivery | Bunches</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link href="<%=request.getContextPath()%>/css/tt.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="header">
        <div id="left">
          <form class="search-form">
            <input type="text" name="search" placeholder="Search..">
          </form>
        </div>
        <div id="middle">
          <a href="WEB-INF/jsp/index.jsp"> <img src="Hoa/logo.png"> </a>
        </div>
        <div id="right">
          <ul class="header-options">
            <li id="headerSignIn" >
              <a href="#">Sign In</a>
            </li>
            <li id="contact-us">
              <a  href="#">
                <i class="fas fa-phone" aria-hidden="true"></i>
                <span>03896 15656</span>
              </a>
            </li>
            <li id="checkout-icon">
              <a href="#">
                <i class="fas fa-shopping-basket" aria-hidden="true">
                </i>
                <span>Checkout</span>
                (0)
              </a>
            </li>
            
          </ul>
          <div class="bar">
              <a href="BarLayout.html">
                <i class="fas fa-bars" style="font-size: 24px;" aria-hidden="true"></i>
                
                </script>
              </a>
            </div>
        </div>
        
        
    </div>
	<div style="clear: both;"></div>
	<div id="menu">
		<ul>
			<li><a href="#"> <b> Flowers </b> </a>
				<ul class="sub-menu">
					<li><a href="#"> <b> Pink Tone </b> </a></li>
					<li><a href="#"> <b> Red Tone </b> </a></li>
					<li><a href="#"> <b> Yellow Tone </b> </a></li>
					<li><a href="#"> <b> Blue Tone </b> </a></li>
					<li><a href="#"> <b> White Tone </b> </a></li>
					<li><a href="#"> <b> Orange Tone </b> </a></li>
				</ul>
			</li>
			<li><a href="#"> <b> Flowers Box </b> </a></li>
			<li><a href="#"> <b> Flowers Basket </b> </a></li>
			<li><a href="#"> <b> Bouquets </b> </a></li>
			<li><a href="#"> <b> Flowers Shelf </b> </a></li>
		</ul>
	</div>	
	<div class="clear"></div>
		
		
	<div style="clear: both;"></div>
	<div class="Arow1">
		<div class="Aanhhoa1">
			<img src="<%= request.getContextPath() %>/${Product.image}">
		</div>
	</div>	
	<div class="Arow1">
		<<h1 id="text">${Product.description}</h1>
	</div>
	
	
	<div style="clear: both;"></div>
	<hr>
	<h1 style="text-align: center;"> 
		You might also be interested in...
	</h1>
	<div class="row2">
		<div class="anhhoa2">
			<img src="Hoa/flowers(1).jpg">
		</div>
		<div class="anhhoa1asu"> 
			<p>
				Special gift
			</p>
		</div>
	</div>
	<div class="row2">
		<div class="anhhoa2">
			<img src="Hoa/flowers(2).jpg">
		</div>
		<div class="anhhoa1asu"> 
			<p>
				Special gift
			</p>
		</div>
	</div>
	<div class="row2">
		<div class="anhhoa2">
			<img src="Hoa/flowers(3).jpg">
		</div>
		<div class="anhhoa1asu"> 
			<p>
				Special gift
			</p>
		</div>
	</div>
	<div class="row2">
		<div class="anhhoa2">
			<img src="Hoa/flowers(4).jpg">
		</div>
		<div class="anhhoa1asu"> 
			<p>
				Special gift
			</p>
		</div>
	</div>
	
	
	<footer>
		<image src="footer.png" style="width: 100% ;height :30%">
	</footer>
    </body>
</html>
