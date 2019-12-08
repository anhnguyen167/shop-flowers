<%-- 
    Document   : viewOrderDetail
    Created on : Dec 7, 2019, 5:03:22 PM
    Author     : Admin
--%>

<%@page import="BEAN.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Flowers Delivery | Bunches</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <link href="<%= request.getContextPath()%>/css/tc.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
                font-family: "Times New Roman", Times, serif;
            }
            #search-form {
                position: relative;

            }
            .search-data.show {
                visibility: unset;
            }
            .search-data {
                position: absolute;
                background: pink;
                top: 40px;
                width: 300px;
                z-index: 100;
                visibility: hidden;
            }


        </style>
    </head>
    <body>
        <div id="header">
            <div id="left">
                <form class="search-form">
                    <input type="text" name="search" placeholder="Search..">
                </form>
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
                            <% }%>
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
                <li><a href="ViewAllFlowerInManager?type=3"> <b> Flowers Box </b> </a></li>
                <li><a href="ViewAllFlowerInManager?type=1"> <b> Flowers Basket </b> </a></li>
                <li><a href="ViewAllFlowerInManager?type=2"> <b> Bouquets </b> </a></li>
                <li><a href="ViewAllFlowerInManager?type=4"> <b> Flowers Shelf </b> </a></li>
            </ul>
        </div>	

        <div style="clear: both;"></div>
        <h1 style="text-align: center; color: grey; font-size: 38px;"> 
            Chi Tiết Hóa Đơn
        </h1>
        <div class="GioSP">
            <div class="CTHD-ThongTinKhachHang">
                <div class="HDrow1">
                    <a style="color:pink;"> Tên Khách Hàng: </a>
                    ${basket.user.full_name}
                </div>
                <div class="HDrow1">
                    <a style="color:pink;"> Ngày Đặt: </a>
                    ${basket.booking_date}
                </div>
                <div class="HDrow">
                    <a style="color:pink;"> Địa Chỉ: </a>
                    ${basket.address}
                </div>
            </div>
        </div>
        <% int index = 1;%>
        <c:forEach items="${basket.listBasketDetail}" var="list">
            <div class="GioSP">
                <div class="GioSPCol1">
                    <div style="margin-top: 90px;"><%= index++%> </div>
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
                            ${list.product.price}<%="$"%>
                        </div>
                    </div>
                    <div class="GioSPCol3Row3">
                        <div class="GioSPCol3Row3Col1">
                            Số Lượng:
                        </div>
                        <div class="GioSPCol3Row1Col2">
                            ${list.quantity}
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <div class="GioSP">
            <div>
                <b>
                    <div class="GioSPTongHoaDon" style="font-size: 24px;">
                        Tổng Hóa Đơn:
                        ${basket.total}<%="$"%>
                    </div>
                </b>
            </div>

        </div>

        <footer>
            <image src="footer.png" style="width: 100% ;height :30%">
        </footer>
    </body>
</html>
