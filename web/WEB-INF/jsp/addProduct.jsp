<%-- 
    Document   : addProduct
    Created on : Dec 4, 2019, 1:18:47 PM
    Author     : Admin
--%>

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
            table, th, td {
                border: 1px solid white;
                border-collapse: collapse;
            }
            th, td {
                padding: 15px;
            }
        </style>
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
                    <input class="form-control mr-sm-2" type="text" placeholder="Search" size="30" id="search-input">
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
                <li><a href="ViewAll?type=3"> <b> Flowers Box </b> </a></li>
                <li><a href="ViewAll?type=1"> <b> Flowers Basket </b> </a></li>
                <li><a href="ViewAll?type=2"> <b> Bouquets </b> </a></li>
                <li><a href="ViewAll?type=4"> <b> Flowers Shelf </b> </a></li>
            </ul>
        </div>	
        <div class="clear"></div>


        <div style="clear: both;"></div>
        <h1 style="text-align: center;"> 
		ADD New Product
	</h1>
        <div class="Arow1">
            <form method="POST">
                <br>
                <table border="1">
                    <br>
                    <div class="fix-post2" style="font-size:25px; text-decoration:none; text-align:left">
                        <b> Image : </b>
                        <input type="file" name="image" value="${product.product_name}" class="btn-file"/>
                    </div>
                    <tr>
                        <td style="font-size:25px; text-decoration:none; text-align:left"> <b> Name : </b> </td>
                        <td><input type="text" name="product_name" value="${product.product_name}"></td>
                    </tr>
                    <tr>
                        <td style="font-size:25px; text-decoration:none; text-align:left"> <b> Price: </b> </td>
                        <td><input type="text" name="price" value="${product.price}"></td>
                    </tr>
                    <tr>
                        <td style="font-size:25px; text-decoration:none; text-align:left"> <b> Type : </b> </td>
                        <td><input type="text" name="type" value="${product.type}"></td>
                    </tr>
                    <tr>
                        <td style="font-size:25px; text-decoration:none; text-align:left"> <b> Color : </b> </td>
                        <td><input type="text" name="color" value="${product.color}"></td>
                    </tr>
                    <tr>
                        <td style="font-size:25px; text-decoration:none; text-align:left"> <b> State : </b> </td>
                        <td><input type="text" name="state" value="${product.state}"></td>
                    </tr>
<!--                    <tr>
                        <td style="font-size:25px; text-decoration:none; text-align:left"> <b> Image : </b> </td>
                        <td><input type="text" name="image" value="${product.image}"></td>
                    </tr>-->
                    <tr>
                        <td style="font-size:25px; text-decoration:none; text-align:left"> <b> Description : </b> </td>
                        <td><input type="text" name="description" value="${product.description}"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><button type="submit" formaction="AddProduct" class="btnEdit">ADD</button></td>
                    </tr>
                </table>
            </form>
        </div>
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
                data.forEach(item => {
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
