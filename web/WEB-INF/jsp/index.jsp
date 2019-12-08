<%@page import="BEAN.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>Flowers Delivery | Bunches</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <link href="<%= request.getContextPath()%>/css/tc.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
        <style>
            body{
                font-family: 'Roboto', sans-serif;
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
                <li><a href="ViewAll?type=3"> <b> Flowers Box </b> </a></li>
                <li><a href="ViewAll?type=1"> <b> Flowers Basket </b> </a></li>
                <li><a href="ViewAll?type=2"> <b> Bouquets </b> </a></li>
                <li><a href="ViewAll?type=4"> <b> Flowers Shelf </b> </a></li>
            </ul>
        </div>	

        <div style="clear: both;"></div>

        <hr>
        <h1 style="text-align: center;"> 
            Basket
            <a href="ViewAll?type=1" style="color: black; font-size:17px "> View All </a>
        </h1>
        <c:forEach items="${listSP1}" var="list">
            <div class="row1">
                <div class="anhhoa1">
                    <a href="FlowersDetail?id=${list.id}">
                        <img src="<%= request.getContextPath()%>/${list.image}">
                    </a>
                </div>
                <div class="anhhoa1asu"> 
                    <p>
                        <a href="A2.html" style="text-decoration:none; text-align:center; color: black">
                            <b> ${list.product_name} </b>
                            <br>
                            <a href="Hoa/flower1.jpg" style="font-family:cursive; color:#737373; font-size:20px; text-decoration:none; text-align:center"> <b>${list.price} </b> </a>
                        </a>
                    </p>
                </div>
            </div>	
        </c:forEach>
        <div style="clear: both;"></div>
        <hr>
        <h1 style="text-align: center;"> 
            Bouquets
            <a href="ViewAll?type=2" style="color: black; font-size:17px "> View All </a>
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
                            <a href="Hoa/flower1.jpg" style="font-family:cursive; color:#737373; font-size:20px; text-decoration:none; text-align:center"> <b> ${list.price} </b></a>
                        </a>
                    </p>
                </div>
            </div>	
        </c:forEach>
        <div style="clear: both;"></div>
        <hr>
        <h1 style="text-align: center;"> 
            Box
            <a href="ViewAll?type=3" style="color: black; font-size:17px "> View All </a>
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
                            <a href="Hoa/flower1.jpg" style="font-family:cursive; color:#737373; font-size:20px; text-decoration:none; text-align:center"> <b> ${list.price} </b></a>
                        </a>
                    </p>
                </div>
            </div>	
        </c:forEach>
        <div style="clear: both;"></div>
        <hr>
        <h1 style="text-align: center;"> 
            Shelf
            <a href="ViewAll?type=4" style="color: black; font-size:17px "> View All </a>
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
                            <a href="Hoa/flower1.jpg" style="font-family:cursive; color:#737373; font-size:20px; text-decoration:none; text-align:center"> <b> ${list.price} </b></a>
                        </a>
                    </p>
                </div>
            </div>	
        </c:forEach>
        <div style="clear: both;"></div>
        <br>
    <footer>
        <image src="Hoa/footer.png" style="width: 100% ;height :30%">
    </footer>

</body>
<script>
            $(function () {
            // IT WILL BE RAN AFTER YOUR WEBSITE IS LOADED
            $('#search-input').change(function (e) {
            // RAN AFTER your search button is clicked
            e.preventDefault();
                    // prevent your page is reloaded
                    const text = $('#search-input').val();
                    // get text in your input
                    $.post('/FlowersShop/SearchServlet', {text}, function (data) {
                    $('.search-data').addClass('show');
                            $('#search-data').empty();
                            data.forEach(item = > {
                            const ten = item.product_name;
                                    const str = '<li class="list-group-item"><a href="/BTL/ChuyenTrangChiTiet?id=' + item.id + '">' + ten + ' Trạng thái: ' + (item.tinhtrang === 'con' ? 'Còn' : 'Hết') + '</a></li>';
                                    $('#search-data').append(str);
                            });
                    })
            });
                    $('body').click(function () {
            $('.search-data').removeClass('show');
            })
            })
</script>
</html>
