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
        <link href="<%= request.getContextPath()%>/css/tc.css" rel="stylesheet" type="text/css"/>
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
                <% if (session.getAttribute("user") == null) {%>
                <% signIn = "Sign In";
                    }%>
                <li id="headerSignIn" >
                    <a href="<%= request.getContextPath()%>/login"><%= signIn%></a>
                </li>
                <% String signOut = ""; %>
                <% if (session.getAttribute("user") != null) {%>
                <% signOut = "Sign Out";
                    }%>
                <li id="headerSignOut" >
                    <a href="SignOut"><%= signOut%></a>
                </li>
                <% String name = ""; %>
                <% if (session.getAttribute("user") != null) {%>
                <% User user = (User) session.getAttribute("user"); %>
                <% name = user.getUsername();
                    }%>
                <li id="profile" >
                    <a href="ViewOrderUser"><%= name%></a>
                </li>
                <li id="checkout-icon">
                    <a href="ViewBasketDetail">
                        <i class="fas fa-shopping-basket" aria-hidden="true">
                        </i>
                        <% String checkout = "Checkout"; %>
                        <% if (session.getAttribute("user") != null) {
                                checkout = "My Basket";
                            }%>
                        <span><%= checkout%></span>
                        <% if (session.getAttribute("list") != null) {%>
                        (<%= session.getAttribute("quantity")%>)
                        <% } else {%>
                        (<%= 0%>)
                        <% } %>
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
            <li><a href="ViewAll?type=3"> <b> Flowers Box </b> </a></li>
            <li><a href="ViewAll?type=1"> <b> Flowers Basket </b> </a></li>
            <li><a href="ViewAll?type=2"> <b> Bouquets </b> </a></li>
            <li><a href="ViewAll?type=4"> <b> Flowers Shelf </b> </a></li>
        </ul>
    </div>	

    <div style="clear: both;"></div>
    <h1 style="text-align: center; color: grey; font-size: 38px;"> 
        My Basket
    </h1>
    <% int index = 1;%>
    <c:forEach items="${listSPA}" var="list">
        <div class="GioSP">
            <div class="GioSPCol1">
                <div style="margin-top: 90px;"> <%= index%> </div>
            </div>
            <div class="GioSPCol2">
                <a href="A2.html">
                    <img src="<%= request.getContextPath()%>/${list.product.image}">
                </a>
            </div>
            <div class="GioSPCol3">
                <div class="GioSPCol3Row1">
                    <div class="GioSPCol3Row3Col1">
                        Tên:
                    </div>
                    <div class="GioSPCol3Row1Col2">
                        <b> ${list.product.product_name} </b>
                    </div>
                </div>
                <div class="GioSPCol3Row2">
                    <div class="GioSPCol3Row3Col1">
                        Giá:
                    </div>
                    <div class="GioSPCol3Row1Col2">
                        <b> ${list.product.price} </b>
                    </div>
                </div>
                <div class="GioSPCol3Row3">
                    <div class="GioSPCol3Row3Col1">
                        Số Lượng:
                    </div>
                    <div class="GioSPCol3Row1Col2">
                        <b> ${list.quantity} </b>
                    </div>
                </div>
                <div class="GioSPCol3Row4">
                    <div class="GioSPCol3Row3Col1">
                        Thành Tiền:
                    </div>
                    <div class="GioSPCol3Row1Col2">
                        <% ArrayList<BasketDetail> listDT = new ArrayList<BasketDetail>(); %>
                        <% listDT = (ArrayList<BasketDetail>) session.getAttribute("list");%>
                        <%= listDT.get(index - 1).getProduct().getPrice() * listDT.get(index - 1).getQuantity()%>
                    </div>
                </div>
                <% index++;%>
                <div class="GioSPCol3Row5">
                    <form method="post" action="ViewBasketDetail?id=${list.product.id}">
                        <button type="submit" style="width:50px; font-family:cursive; color:#737373; margin-top: 30px; margin-left: 200px;"> Delete </button> 
                    </form>
                </div>
            </div>
        </div>
    </c:forEach>
    <div class="GioSP">
        <div style="margin-left: 300px; margin-top: 20px;">
            <b>
                <div class="GioSPCol3Row3Col1" style="font-size: 24px;">
                    Tổng Hóa Đơn:
                </div>
                <div class="GioSPCol3Row1Col2" style="font-size: 24px; margin-left:40px">
                    <%= request.getAttribute("total")%>
                </div>
            </b>
        </div>
        <div style="margin-left: 300px;">
            <b>
                <div class="GioSPCol3Row3Col1" style="font-size: 24px;">
                    Tổng Sản Phẩm:
                </div>
                <div class="GioSPCol3Row1Col2" style="font-size: 24px; margin-left:40px">
                    <%=request.getAttribute("sum")%>
                </div>
            </b>
        </div>
        <div>
            <form action="BookingBasket" method="post">
                <button type="submit"  class="btnDatHang">Đặt Hàng</button> 
            </form>
        </div>
    </div>

    <div style="clear: both;"></div>
    <footer>
        <image src="Hoa/footer.png" style="width: 100% ;height :30%">
    </footer>
</body>
</html>
