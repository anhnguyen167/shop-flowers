<%-- 
    Document   : editProduct
    Created on : Dec 4, 2019, 12:18:37 AM
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
        <link href="<%=request.getContextPath()%>/css/tt.css" rel="stylesheet" type="text/css"/>
        <style>
            table, th, td {
                border: 1px solid white;
                border-collapse: collapse;
            }
            th, td {
                padding: 15px;
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
                <a href="QLHome.html"> <img src="Hoa/logo.png"> </a>
            </div>
            <div id="right">
                <ul class="header-options">
                    <li id="headerName">
                        <a>Quản Lý</a>
                    </li>
                    <li id="headerViewOrder">
                        <a  href="#">
                            <span>View Order</span>
                        </a>
                    </li>
                    <li id="headerAddFlowers">
                        <a href="ThemSP.html">
                            <span>Add Flowers</span>
                        </a>
                    </li>
                    <li id="headerSignOut">
                        <a href="HOME.html">
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
                <img src="<%= request.getContextPath()%>/${product.image}" >
            </div>
        </div>	
        <div class="Arow1">
            <form method="POST">
                <br>
                <table border="1">
                    <tr>
                    <input type="text" name="image" value="${product.image}" style="visibility:hidden;">
                    <input type="text" name="description" value="${product.description}" style="visibility:hidden;">
                    </tr>
                    <tr>
                        <td style="font-size:25px; text-decoration:none; text-align:left"> <b> ID : </b> </td>
                        <td><input type="text" name="id" value="${product.id}"></td>
                    </tr>
                    <tr>
                        <td style="font-size:25px; text-decoration:none; text-align:left"> <b> Tên : </b> </td>
                        <td><input type="text" name="product_name" value="${product.product_name}"></td>
                    </tr>
                    <tr>
                        <td style="font-size:25px; text-decoration:none; text-align:left"> <b> Giá : </b> </td>
                        <td><input type="text" name="price" value="${product.price}"></td>
                    </tr>
                    <tr>
                        <td style="font-size:25px; text-decoration:none; text-align:left"> <b> Loại : </b> </td>
                        <td><input type="text" name="type" value="${product.type}"></td>
                    </tr>
                    <tr>
                        <td style="font-size:25px; text-decoration:none; text-align:left"> <b> Trạng Thái : </b> </td>
                        <td><input type="text" name="state" value="${product.state}"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><button type="submit" formaction="EditProducts" class="btnEdit">Edit</button></td>
                    </tr>
                </table>
            </form>
        </div>
        <footer>
            <image src="Hoa/footer.png" style="width: 100% ;height :30%">
        </footer>
    </body>
</html>
