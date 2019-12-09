<%-- 
    Document   : flowerDetail
    Created on : Dec 3, 2019, 12:56:01 PM
    Author     : Admin
--%>

<%@page import="BEAN.Product"%>
<%@page import="BEAN.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Flowers Delivery | Bunches</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <link href="<%=request.getContextPath()%>/css/tc.css" rel="stylesheet" type="text/css"/>
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
                <div class="form-inline" id="search-form">
                    <input class="form-control mr-sm-2" type="text" placeholder="Search" size="30" id="search-input">
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
                            <i class="fas fa-shopping-basket" aria-hidden="true"></i>
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
        <div class="Arow1">
            <div class="Aanhhoa1">
                <img src="<%= request.getContextPath()%>/${Product.image}">
            </div>
        </div>	
        <div class="Arow1">
            <div class="Arow1-row1">
                <div class="Arow1-row1-col1">${Product.product_name}</div>
                <div class="Arow1-row1-col2">${Product.price}<%="$"%></div>
            </div>
            <div class="Arow1-row2">
                <div class="Arow1-row2-cel">
                    <br>
                    <a style="color:pink;font-style: italic;">Thông Tin Sản Phẩm: </a>
                    <br>
                    ${Product.description}
                    <br> <br>
                    <a style="color:pink;font-style: italic;">Trạng thái:</a>
                    <br> 
                    <% Product p = (Product) request.getAttribute("Product"); %>
                    <% int state = p.getState(); %>
                    <% String text = "Hết hàng"; %>
                    <% if (state == 1) {
                            text = "Còn hàng";
                        }%>
                    <a style="color:red"><%= text%> </a>
                </div>
            </div>
            <div class="Arow1-row3">
                <form action="AddToBasket" method="get">
                    <input type="text" name="id" value="${Product.id}" style=" width:0px;height:0px;" hidden="true">
                    <div class="Arow1-row3-col1"> 
                        <div class="Arow1-row3-col1-row1">
                            <br> Số Lượng:
                        </div>
                        <div>
                            <a class="soluong"> <input id="number-text" type="number" name="ten" style="text-align:center; width:100px;height:30px;" value="1" min="1"> </a>
                        </div>
                    </div>
                    <div class="Arow1-row3-col2"> 
                        <button type="submit"  class="btnThemVaoGioHang">Thêm Vào Giỏ Hàng</button> 
                    </div>
                </form>
            </div>
        </div>
        <div style="clear: both;"></div>

        <br>
        <footer>
            <image src="footer.png" style="width: 100% ;height :30%">
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
                            data.forEach(item => {
                            const ten = item.product_name;
                            const trangthai=item.state;
                                    const str = '<li class="list-group-item"><a href="/FlowersShop/FlowersDetail?id=' + item.id + '">' + ten + ' Trạng thái: ' + (item.state === 1 ? 'Còn' : 'Hết') + '</a></li>';
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
