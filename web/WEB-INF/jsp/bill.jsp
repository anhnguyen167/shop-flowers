<%-- 
    Document   : bill
    Created on : 07-Dec-2019, 15:33:38
    Author     : Admin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="BEAN.BasketDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BEAN.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Flowers Delivery | Bunches</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/tc.css">
        <!--Get your own code at fontawesome.com-->
        <style>
            table, th, td {
                border: 1px solid white;
                border-collapse: collapse;
            }
            th, td {
                padding: 15px;
            }
            p.round {
                border: 1px solid black;
                border-radius: 8px;
            }
        </style>
    </head>
    <body>
        <div id="header">
            <div id="left">
                <div class="form-inline" id="search-form">
                    <input autocomplete="off" class="form-control mr-sm-2" type="text" placeholder="Search" size="30" id="search-input">
                    <div class="search-data">
                        <ul class="list-group" id="search-data">
                        </ul>
                    </div>
                </div>
            </div>
            <div id="middle">
                <a href="GetFlowers"> <img src="Hoa/logo.png"> </a>
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
                    <% String token[] = user.getFull_name().split(" "); %>
                    <% name = token[token.length - 1];
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
                        <li><a href="GetFlowersByTone?tone=1"> <b> Pink Tone </b> </a></li>
                        <li><a href="GetFlowersByTone?tone=2"> <b> Red Tone </b> </a></li>
                        <li><a href="GetFlowersByTone?tone=3"> <b> Yellow Tone </b> </a></li>
                        <li><a href="GetFlowersByTone?tone=4"> <b> Blue Tone </b> </a></li>
                        <li><a href="GetFlowersByTone?tone=5"> <b> White Tone </b> </a></li>
                        <li><a href="GetFlowersByTone?tone=6"> <b> Orange Tone </b> </a></li>
                    </ul>
                </li>
                <li><a href="ViewAll?type=3"> <b> Flowers Box </b> </a></li>
                <li><a href="ViewAll?type=1"> <b> Flowers Basket </b> </a></li>
                <li><a href="ViewAll?type=2"> <b> Bouquets </b> </a></li>
                <li><a href="ViewAll?type=4"> <b> Flowers Shelf </b> </a></li>
            </ul>
        </div>	
        <div class="clear"></div>
        <div style="clear: both;"></div>

        <h1 style="text-align: center; color: grey; font-size: 35px;"> 
            Hóa Đơn
        </h1>
        <% User user = (User) session.getAttribute("user");%>
        <div class="addFlower1"> </div>
        <form action="CreateBill" method="post">
            <div class="addFlower">
                <div class="HDrow1">
                    <a style="color:pink;"> Tên Khách Hàng: </a>
                    <%= user.getFull_name()%>
                </div>
                <div class="HDrow1">
                    <a style="color:pink;"> Ngày Đặt: </a>
                    <% long millis = System.currentTimeMillis();
                        java.sql.Date date = new java.sql.Date(millis);
                    %>
                    <%= date%>

                </div>
                <div class="HDrow">
                    <div>
                        <a style="color:pink;"> Địa Chỉ: </a>
                    </div>
                    <div class="HDrowDC">
                        <br>
                        <input type="text" name="diaChi" class="HDrowDC" style="width:500px;" value="*">

                    </div>
                </div>

                <div class="SP">
                    <div class="SProw1">
                        <a style="color:pink;"> Sản Phẩm: </a>
                    </div>
                    <div class="SProw2">
                        <div class="SProw2col">
                            Tên
                        </div>
                        <div class="SProw2col">
                            Giá
                        </div>
                        <div class="SProw2col">
                            Số Lượng
                        </div>
                        <div class="SProw2col">
                            Thành Tiền
                        </div>
                    </div>
                    <% int index = 1; %>
                    <c:forEach items="${listSPA}" var="list">
                        <div class="SProw2">
                            <div class="SProw2col">
                                <b>${list.product.product_name}</b>
                            </div>
                            <div class="SProw2col">
                                <b>${list.product.price}</b>
                            </div>
                            <div class="SProw2col">
                                <b>${list.quantity}</b>
                            </div>
                            <div class="SProw2col">
                                <% ArrayList<BasketDetail> listDT = new ArrayList<BasketDetail>(); %>
                                <% listDT = (ArrayList<BasketDetail>) session.getAttribute("list");%>
                                <%= listDT.get(index - 1).getProduct().getPrice() * listDT.get(index - 1).getQuantity()%>
                            </div>
                        </div>
                        <% index++;%>
                    </c:forEach>
                </div>

                <div class="HDrow1">
                    <a style="color:pink;"> Tổng Hóa Đơn: </a>
                    <%= request.getAttribute("total")%>
                </div>
                <div class="HDrow1">

                    <button type="submit" class="btnThanhToan">Xác Nhận & Thanh Toán</button> 

                </div>
            </div>
        </form>
        <footer>
            <image src="footer.png" style="width: 100% ;height :30%">
        </footer>
    </body>
</html>
