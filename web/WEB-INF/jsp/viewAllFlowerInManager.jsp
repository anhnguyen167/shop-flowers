<%-- 
    Document   : viewAllFlowerInManager
    Created on : Dec 4, 2019, 9:38:48 AM
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
            <a href="nManager"> <img src="Hoa/logo.png"> </a>
        </div>
        <div id="right">
            <ul class="header-options">
                <li id="headerName">
                    <a>Quản Lý</a>
                </li>
                <li id="headerViewOrder">
                    <a  href="ViewOrder">
                        <span>View Order</span>
                    </a>
                </li>
                <li id="headerAddFlowers">
                    <a href="nAddProduct">
                        <span>Add Flowers</span>
                    </a>
                </li>
                <li id="headerSignOut">
                    <a href="SignOut">
                        <span>Sign Out</span>
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
                    <li><a href="GetFlowerByToneInManager?tone=1"> <b> Pink Tone </b> </a></li>
                    <li><a href="GetFlowerByToneInManager?tone=2"> <b> Red Tone </b> </a></li>
                    <li><a href="GetFlowerByToneInManager?tone=3"> <b> Yellow Tone </b> </a></li>
                    <li><a href="GetFlowerByToneInManager?tone=4"> <b> Blue Tone </b> </a></li>
                    <li><a href="GetFlowerByToneInManager?tone=5"> <b> White Tone </b> </a></li>
                    <li><a href="GetFlowerByToneInManager?tone=6"> <b> Orange Tone </b> </a></li>
                </ul>
            </li>
            <li><a href="ViewAllFlowerInManager?type=3"> <b> Flowers Box </b> </a></li>
            <li><a href="ViewAllFlowerInManager?type=1"> <b> Flowers Basket </b> </a></li>
            <li><a href="ViewAllFlowerInManager?type=2"> <b> Bouquets </b> </a></li>
            <li><a href="ViewAllFlowerInManager?type=4"> <b> Flowers Shelf </b> </a></li>
        </ul>
    </div>

    <div style="clear: both;"></div>

    <c:forEach items="${listSPA}" var="list">
        <div class="row3">
            <div class="anhhoa1">
                <a>
                    <img src="<%= request.getContextPath()%>/${list.image}">
                </a>
            </div>
            <div class="anhhoa1asu"> 
                <p>
                    <div class="flowerInf">
                    <a style="text-decoration:none; text-align:center; color: black">
                        <b> ${list.product_name} </b>
                        <br>
                        <a style="font-family:cursive; color:#737373; font-size:20px; text-decoration:none; text-align:center"> 
                            <b> ${list.price}<%="$"%> </b>
                        </a>
                        <br>
                        </div>
                        <form >
                                <div class="flowerEdit">
                                    <button type="submit" formmethod="POST"  formaction="nEditProducts?id=${list.id}" style="width:50px; font-family:cursive; color:#737373;"> Edit </button> 
                                </div>
                                <div class="flowerS">
                                    <a style="color: black; font-size:22px"> | </a>
                                </div>
                                <div class="flowerDelete">
                                    <button type="submit" formmethod="POST"  formaction="DeleteProducts?id=${list.id}" style="width:50px; font-family:cursive; color:#737373;"> Delete </button> 
                                </div>
                        </form>
                    </a>

                </p>
            </div>
        </div>	
    </c:forEach>
    <br>
    <footer>
        <image src="Hoa/footer.png" style="width: 100% ;height :30%; float: left;">
    </footer>

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
