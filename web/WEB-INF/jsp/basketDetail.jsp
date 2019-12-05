<%-- 
    Document   : viewAll
    Created on : Dec 3, 2019, 4:53:29 PM
    Author     : Admin
--%>

<%@page import="BEAN.User"%>
<%@page import="BEAN.BasketDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BEAN.Basket"%>
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
    </head>
    <body>
        <div id="header">
        <div id="left">
          <form class="search-form">
            <input type="text" name="search" placeholder="Search..">
          </form>
        </div>
        <div id="middle">
          <a href=""> <img src="Hoa/logo.png"> </a>
        </div>
        <div id="right">
          <ul class="header-options">
              
            <% String signIn = ""; %>
                    <% if(session.getAttribute("user") == null){%>
                    <% signIn = "Sign In"; }%>
                    <li id="headerSignIn" >
                        <a href="<%= request.getContextPath()%>/login"><%= signIn %></a>
                    </li>
                    <% String signOut = ""; %>
                    <% if(session.getAttribute("user") != null){%>
                    <% signOut = "Sign Out"; }%>
                    <li id="headerSignOut" >
                        <a href="SignOut"><%= signOut %></a>
                    </li>
                    <% String name = ""; %>
                    <% if(session.getAttribute("user") != null){%>
                    <% User user = (User)session.getAttribute("user"); %>
                    <% name = user.getUsername(); }%>
                    <li id="profile" >
                        <a href="#"><%= name %></a>
                    </li>
             <li id="contact-us">
              <a  href="#">
                <i class="fas fa-phone" aria-hidden="true"></i>
                <span>03896 15656</span>
              </a>
            </li>
            <li id="checkout-icon">
              <a href="ViewBasketDetail">
                <i class="fas fa-shopping-basket" aria-hidden="true">
                </i>
                
                <% int quantity = Integer.parseInt(request.getAttribute("quantity").toString()); %>
                <%String checkout = "(" + quantity + ")"; %>
                <span>Checkout</span>
                <%=checkout%>
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
        <div> Số lượng sản phẩm: <%=quantity%></div>
        <div> Tổng tiền: <%= request.getAttribute("total").toString()%></div>
        <c:forEach items="${listSPA}" var="list">
            <div class="row1">
                <div class="anhhoa1">
                    <a>
                        <img src="<%= request.getContextPath()%>/${list.image}">
                    </a>
                </div>
                <div class="anhhoa1asu"> 
                    <p>
                        <a href="A2.html" style="text-decoration:none; text-align:center; color: black">
                            <b> ${list.product_name} </b>
                            <br>
                            <a style="font-family:cursive; color:#737373; font-size:20px; text-decoration:none; text-align:center"> 
                                <b> ${list.price} </b>
                            </a>
                            <form >
                                                <input type="submit" 
                                                       formmethod="POST" formaction="ViewBasketDetail?id=${list.id}" value="Delete">
                                                </input>
                                               
                                                
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
