<%-- 
    Document   : viewOrderDetail
    Created on : Dec 7, 2019, 5:03:22 PM
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
                        <li><a href="GetFlowerByToneInManager"> <b> Pink Tone </b> </a></li>
                        <li><a href="GetFlowerByToneInManager"> <b> Red Tone </b> </a></li>
                        <li><a href="GetFlowerByToneInManager"> <b> Yellow Tone </b> </a></li>
                        <li><a href="GetFlowerByToneInManager"> <b> Blue Tone </b> </a></li>
                        <li><a href="GetFlowerByToneInManager"> <b> White Tone </b> </a></li>
                        <li><a href="GetFlowerByToneInManager"> <b> Orange Tone </b> </a></li>
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
                    <div style="margin-top: 90px;"> <%=index%></div>
		</div>
		<div class="GioSPCol2">
			<a href="A2.html">
				<img src="<%= request.getContextPath()%>/${list.product.image}">
			</a>
		</div>
		<div class="GioSPCol3">
			<div class="GioSPCol3Row1">
                                <div class="GioSPCol3Row3Col0"></div>
				<div class="GioSPCol3Row3Col1">
					Tên:
				</div>
				<div class="GioSPCol3Row1Col2">
					<b> ${list.product.product_name} </b>
				</div>
			</div>
			<div class="GioSPCol3Row2">
                                <div class="GioSPCol3Row3Col0"></div>
				<div class="GioSPCol3Row3Col1">
					Giá:
				</div>
				<div class="GioSPCol3Row1Col2">
					${list.product.price}
				</div>
			</div>
			<div class="GioSPCol3Row3">
                                <div class="GioSPCol3Row3Col0"></div>
				<div class="GioSPCol3Row3Col1">
					Số Lượng:
				</div>
				<div class="GioSPCol3Row1Col2">
					${list.quantity}
				</div>
			</div>
		</div>
	</div>
                        <% index++;%>
                        </c:forEach>
	<div class="GioSP">
		<div>
			<b>
			<div class="GioSPTongHoaDon" style="font-size: 24px;">
				Tổng Hóa Đơn:
				${basket.total}
			</div>
			</b>
		</div>
                        <form>
		<div>
			<button type="submit"formmethod="POST" formaction="/FlowersShop/Completed?id=${basket.id}" class="btnDatHang">Đã Hoàn Thành</button> 
		</div>
                        </form>
	</div>
	
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
