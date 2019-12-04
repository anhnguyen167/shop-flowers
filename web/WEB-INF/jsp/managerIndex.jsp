<%-- 
    Document   : managerIndex
    Created on : Dec 3, 2019, 8:37:05 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Flowers Delivery | Bunches</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link href="<%= request.getContextPath()%>/css/tt.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        
        <div id="header">
        <div id="left">
          <form class="search-form">
            <input type="text" name="search" placeholder="Search..">
          </form>
        </div>
        <div id="middle">
          <a href="HOME.html"> <img src="Hoa/logo.png"> </a>
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
        
        <div style="clear: both;"></div>
        
        <hr>
	<h1 style="text-align: center;"> 
		Basket
		<a href="ViewAllFlowerInManager?type=1" style="color: black; font-size:17px "> View All </a>
	</h1>
        <c:forEach items="${listSP1}" var="list">
	<div class="row1">
		<div class="anhhoa1">
			<a href="FlowersDetail?id=${list.id}">
				<img src="<%= request.getContextPath()%>/${list.image} ">
			</a>
		</div>
		<div class="anhhoa1asu"> 
			<p>
				<a href="A2.html" style="text-decoration:none; text-align:center; color: black">
					<b> ${list.product_name} </b>
					<br>
                                            <a style="font-family:cursive; color:#737373; font-size:20px; text-decoration:none; text-align:center"> <b> ${list.price} </b></a>
                                        <br>
                                            <form >
                                                <button type="submit" 
                                                        formmethod="POST" formaction="DeleteProducts?id=${list.id}">
                                                    <img src="<%= request.getContextPath()%>/Hoa/thungrac.png" style="width: 30px; height: 30px">
                                                </button>
                                                <a style="color: black; font-size:30px">| </a>
                                                <button type="submit" formmethod="POST" formaction="nEditProducts?id=${list.id}">
                                                    <img src="<%= request.getContextPath()%>/Hoa/edit.png" style="width: 30px; height: 30px">
                                                </button>
                                            </form>
				</a>
			</p>
		</div>
	</div>	
        </c:forEach>
        <div style="clear: both;"></div>
        
        <hr>
	<h1 style="text-align: center;"> 
		Bouquets
		<a href="ViewAllFlowerInManager?type=2" style="color: black; font-size:17px "> View All </a>
	</h1>
        <c:forEach items="${listSP2}" var="list">
	<div class="row1">
		<div class="anhhoa1">
			<a href="FlowersDetail?id=${list.id}">
				<img src="<%= request.getContextPath()%>/${list.image} ">
			</a>
		</div>
		<div class="anhhoa1asu"> 
			<p>
				<a href="A2.html" style="text-decoration:none; text-align:center; color: black">
					<b> ${list.product_name} </b>
					<br>
                                            <a style="font-family:cursive; color:#737373; font-size:20px; text-decoration:none; text-align:center"> <b> ${list.price} </b></a>
                                        <br>
                                            <form >
                                                <button type="submit" 
                                                        formmethod="POST" formaction="DeleteProducts?id=${list.id}">
                                                    <img src="<%= request.getContextPath()%>/Hoa/thungrac.png" style="width: 30px; height: 30px">
                                                </button>
                                                <a style="color: black; font-size:30px">| </a>
                                                <button type="submit" formmethod="POST" formaction="nEditProducts?id=${list.id}">
                                                    <img src="<%= request.getContextPath()%>/Hoa/edit.png" style="width: 30px; height: 30px">
                                                </button>
                                            </form>
				</a>
			</p>
		</div>
	</div>	
        </c:forEach>
        <div style="clear: both;"></div>
        
        <hr>
	<h1 style="text-align: center;"> 
		Box
		<a href="ViewAllFlowerInManager?type=3" style="color: black; font-size:17px "> View All </a>
	</h1>
        <c:forEach items="${listSP3}" var="list">
	<div class="row1">
		<div class="anhhoa1">
			<a href="FlowersDetail?id=${list.id}">
				<img src="<%= request.getContextPath()%>/${list.image} ">
			</a>
		</div>
		<div class="anhhoa1asu"> 
			<p>
				<a href="A2.html" style="text-decoration:none; text-align:center; color: black">
					<b> ${list.product_name} </b>
					<br>
                                            <a style="font-family:cursive; color:#737373; font-size:20px; text-decoration:none; text-align:center"> <b> ${list.price} </b></a>
                                        <br>
                                            <form >
                                                <button type="submit" 
                                                        formmethod="POST" formaction="DeleteProducts?id=${list.id}">
                                                    <img src="<%= request.getContextPath()%>/Hoa/thungrac.png" style="width: 30px; height: 30px">
                                                </button>
                                                <a style="color: black; font-size:30px">| </a>
                                                <button type="submit" formmethod="POST" formaction="nEditProducts?id=${list.id}">
                                                    <img src="<%= request.getContextPath()%>/Hoa/edit.png" style="width: 30px; height: 30px">
                                                </button>
                                            </form>
				</a>
			</p>
		</div>
	</div>	
        </c:forEach>
        <div style="clear: both;"></div>
        
        <hr>
	<h1 style="text-align: center;"> 
		Shelf
		<a href="ViewAllFlowerInManager?type=4" style="color: black; font-size:17px "> View All </a>
	</h1>
        <c:forEach items="${listSP4}" var="list">
	<div class="row1">
		<div class="anhhoa1">
			<a href="FlowersDetail?id=${list.id}">
				<img src="<%= request.getContextPath()%>/${list.image} ">
			</a>
		</div>
		<div class="anhhoa1asu"> 
			<p>
				<a href="A2.html" style="text-decoration:none; text-align:center; color: black">
					<b> ${list.product_name} </b>
					<br>
                                            <a style="font-family:cursive; color:#737373; font-size:20px; text-decoration:none; text-align:center"> <b> ${list.price} </b></a>
                                        <br>
                                            <form >
                                                <button type="submit" 
                                                        formmethod="POST" formaction="DeleteProducts?id=${list.id}">
                                                    <img src="<%= request.getContextPath()%>/Hoa/thungrac.png" style="width: 30px; height: 30px">
                                                </button>
                                                <a style="color: black; font-size:30px">| </a>
                                                <button type="submit" formmethod="POST" formaction="nEditProducts?id=${list.id}">
                                                    <img src="<%= request.getContextPath()%>/Hoa/edit.png" style="width: 30px; height: 30px">
                                                </button>
                                            </form>
				</a>
			</p>
		</div>
	</div>	
        </c:forEach>
        <div style="clear: both;"></div>
        <footer>
		<image src="Hoa/footer.png" style="width: 100% ;height :30%">
	</footer>
    </body>
</html>
