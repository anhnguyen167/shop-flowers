<%-- 
    Document   : flowerDetail
    Created on : Dec 3, 2019, 12:56:01 PM
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
          <a href="GetFlowers"> <img src="Hoa/logo.png"> </a>
        </div>
        <div id="right">
          <ul class="header-options">
            <li id="headerSignIn" >
              <a href="#">Sign In</a>
            </li>
            
            <li id="checkout-icon">
              <a href="#">
                <i class="fas fa-shopping-basket" aria-hidden="true">
                </i>
                <span>Checkout</span>
                (0)
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
	<div class="Arow1">
		<div class="Aanhhoa1">
			<img src="<%= request.getContextPath() %>/${Product.image}">
		</div>
	</div>	
	<div class="Arow1">
		<div class="Arow1-row1">
			<div class="Arow1-row1-col1">${Product.product_name}</div>
			<div class="Arow1-row1-col2">${Product.price}</div>
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
			<a style="color:red"> ${Product.state==1 ? "còn" :"hết "} </a>
			</div>
		</div>
		<div class="Arow1-row3">
			<div class="Arow1-row3-col1"> 
				<div class="Arow1-row3-col1-row1">
					<br> Số Lượng:
				</div>
				<div>
					<button type="submit" formaction="GiamSoLuong" class="btnGiamSoLuong"> - </button> 
					<a class="soluong"> <input type="text" name="ten" style="text-align:center; width:100px;height:30px;" value="1"> </a>
					<button type="submit" formaction="TangSoLuong" class="btnTangSoLuong"> + </button> 
				</div>
			</div>
			<div class="Arow1-row3-col2"> 
				<button type="submit" formaction="ThemVaoGioHang" class="btnThemVaoGioHang">Thêm Vào Giỏ Hàng</button> 
			</div>
		</div>
	</div>
	<div style="clear: both;"></div>
	<hr>
	<h1 style="text-align: center;"> 
		You might also be interested in...
	</h1>
	<div class="row2">
		<div class="anhhoa2">
			<img src="Hoa/flowers(1).jpg">
		</div>
		<div class="anhhoa1asu"> 
			<p>
				Special gift
			</p>
		</div>
	</div>
	<div class="row2">
		<div class="anhhoa2">
			<img src="Hoa/flowers(2).jpg">
		</div>
		<div class="anhhoa1asu"> 
			<p>
				Special gift
			</p>
		</div>
	</div>
	<div class="row2">
		<div class="anhhoa2">
			<img src="Hoa/flowers(3).jpg">
		</div>
		<div class="anhhoa1asu"> 
			<p>
				Special gift
			</p>
		</div>
	</div>
	<div class="row2">
		<div class="anhhoa2">
			<img src="Hoa/flowers(4).jpg">
		</div>
		<div class="anhhoa1asu"> 
			<p>
				Special gift
			</p>
		</div>
	</div>
	
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
                      const str = '<li class="list-group-item"><a href="/FlowersShop/FlowersDetail?id=' + item.id + '">' + ten + '     Trạng thái: ' + (item.state === 1 ? 'Còn' : 'Hết') + '</a></li>';
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
