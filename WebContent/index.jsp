<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>home</title>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css?ver=5" rel="stylesheet" type="text/css" media="all" />

<script src="js/jquery.min.js"></script>
<script src="js/simpleCart.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>

<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/jquery.countdown.css" />
<link href="css/animate.min.css" rel="stylesheet"> 
<script src="js/wow.min.js"></script>
<script>
 new WOW().init();
</script>

</head>
<body>
	<!-- header -->
	<div class="header">
			<div class="container">
				<div class="header-grid">
					<div class="header-grid-left animated wow slideInLeft" data-wow-delay=".5s">
						<ul>
							<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">shipget0401@gmail.com</a></li>
							<%
								String id = (String)session.getAttribute("id");
								if(id!=null)
								{
							%>
							<li><i class="glyphicon glyphicon-user" aria-hidden="true"></i><%= session.getAttribute("name") %>님</li>
							<li><i class="glyphicon glyphicon-log-out" aria-hidden="true"></i><a href="logout.eun">LogOut</a></li>
							<%
								}
								else
								{
							%>
							<li><i class="glyphicon glyphicon-log-in" aria-hidden="true"></i><a href="login.eun">Login</a></li>
							<li><i class="glyphicon glyphicon-book" aria-hidden="true"></i><a href="signup.eun">SignUp</a></li>
							<%
								}
							%>
							<li><i class="glyphicon glyphicon-question-sign" aria-hidden="true"></i><a href="qna.eun">Q &amp; A</a></li>
							<li><i class="glyphicon glyphicon-info-sign" aria-hidden="true"></i><a href="info.eun">Info</a></li>
						</ul>
					</div>
					<div class="header-grid-right animated wow slideInRight" data-wow-delay=".5s">
						<ul class="social-icons">
							<li><a href="https://www.facebook.com/" class="facebook"></a></li>
							<li><a href="https://twitter.com/" class="twitter"></a></li>
							<li><a href="https://www.google.co.kr/" class="g"></a></li>
							<li><a href="https://www.instagram.com/" class="instagram"></a></li>
						</ul>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="logo-nav">
					<div class="logo-nav-left animated wow zoomIn" data-wow-delay=".5s">
						<h1><a href="index.eun">Ship Get <span>shop anywhere</span></a></h1>
					</div>
					<div class="logo-nav-left1">
						<nav class="navbar navbar-default">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header nav_2">
							<button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div> 
						<div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
							<ul class="nav navbar-nav">
								<li class="active"><a href="index.eun" class="act">Home</a></li>	
								<!-- Mega Menu -->
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown">수요조사 <b class="caret"></b></a>
									<ul class="dropdown-menu multi-column columns-3">
										<div class="row">
											<div class="col-sm-4">
												<ul class="multi-column-dropdown">
													<a class="euncate" href="Beauty.eun"><h6>Beauty</h6></a>
												</ul>
											</div>
											<div class="col-sm-4">
												<ul class="multi-column-dropdown">
													<a class="euncate" href="Book&Music.eun"><h6>Book &amp; Music</h6></a>
												</ul>
											</div>
											<div class="col-sm-4">
												<ul class="multi-column-dropdown">
													<a class="euncate" href="Electronic equipment.eun"><h6>Electronic equipment</h6></a>
												</ul>
											</div>
											<div class="col-sm-4">
												<ul class="multi-column-dropdown">
													<a class="euncate" href="Fashion.eun"><h6>Fashion</h6></a>
												</ul>
											</div>
											<div class="col-sm-4">
												<ul class="multi-column-dropdown">
													<a class="euncate" href="Game&Toy.eun"><h6>Game &amp; Toy</h6></a>
												</ul>
											</div>
											<div class="col-sm-4">
												<ul class="multi-column-dropdown">
													<a class="euncate" href="Living.eun"><h6>Living</h6></a>
												</ul>
											</div>
											<div class="col-sm-4">
												<ul class="multi-column-dropdown">
													<a class="euncate" href="ETC.eun"><h6>ETC</h6></a>
												</ul>
											</div>
											<div class="clearfix"></div>
										</div>
									</ul>
								</li>
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown">공동구매 <b class="caret"></b></a>
									<ul class="dropdown-menu multi-column columns-3">
										<div class="row">
											<div class="col-sm-4">
												<ul class="multi-column-dropdown">
													<a class="euncate" href="pBeauty.eun"><h6>Beauty</h6></a>
												</ul>
											</div>
											<div class="col-sm-4">
												<ul class="multi-column-dropdown">
													<a class="euncate" href=""><h6>Book &amp; Music</h6></a>
												</ul>
											</div>
											<div class="col-sm-4">
												<ul class="multi-column-dropdown">
													<a class="euncate" href=""><h6>Electronic equipment</h6></a>
												</ul>
											</div>
											<div class="col-sm-4">
												<ul class="multi-column-dropdown">
													<a class="euncate" href=""><h6>Fashion</h6></a>
												</ul>
											</div>
											<div class="col-sm-4">
												<ul class="multi-column-dropdown">
													<a class="euncate" href=""><h6>Game &amp; Toy</h6></a>
												</ul>
											</div>
											<div class="col-sm-4">
												<ul class="multi-column-dropdown">
													<a class="euncate" href=""><h6>Living</h6></a>
												</ul>
											</div>
											<div class="col-sm-4">
												<ul class="multi-column-dropdown">
													<a class="euncate" href=""><h6>ETC</h6></a>
												</ul>
											</div>
											<div class="clearfix"></div>
										</div>
									</ul>
								</li>
								<!-- <li><a href="order.eun">신청내역관리</a></li> -->
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown">마이페이지 <b class="caret"></b></a>
									<ul class="dropdown-menu multi-column columns-3">
										<div class="row">
											<div class="col-sm-4">
												<ul class="multi-column-dropdown">
													<a href="mail.html">주문/배송</a>
												</ul>
											</div>
										</div>
									</ul>
								</li>
								<li><a href="mail.html">고객센터</a></li>
							</ul>
						</div>
						</nav>
					</div>
					<div class="logo-nav-right">
						<div class="search-box">
							<div id="sb-search" class="sb-search">
								<form>
									<input class="sb-search-input" placeholder="찾고 싶은 상품을 검색하세요" type="search" id="search">
									<input class="sb-search-submit" type="submit" value="">
									<span class="sb-icon-search"> </span>
								</form>
							</div>
						</div>
							<!-- search-scripts -->
							<script src="js/classie.js"></script>
							<script src="js/uisearch.js"></script>
								<script>
									new UISearch( document.getElementById( 'sb-search' ) );
								</script>
							<!-- //search-scripts -->
					</div>
<!-- 					<div class="header-right">
						<div class="cart box_1">
							<a href="checkout.html">
								<h3> <div class="total">
									<span class="simpleCart_total"></span> (<span id="simpleCart_quantity" class="simpleCart_quantity"></span> items)</div>
									<img src="images/bag.png" alt="" />
								</h3>
							</a>
							<p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>
							<div class="clearfix"> </div>
						</div>	
					</div> -->
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<!-- end header -->
		<!-- banner -->
		<div class="banner">
			<div class="container">
				<div class="banner-info animated wow zoomIn" data-wow-delay=".5s">
					<h3></h3>
					<h4><span>100% <i>Direct <br>Shipping</i></span></h4>
					<div class="wmuSlider example1">
						<div class="wmuSliderWrapper">
							<article style="position: absolute; width: 100%; opacity: 0;"> 
								<div class="banner-wrap">
									<div class="banner-info1">
										<p>T-Shirts + Formal Pants + Jewellery + Cosmetics</p>
									</div>
								</div>
							</article>
							<article style="position: absolute; width: 100%; opacity: 0;"> 
								<div class="banner-wrap">
									<div class="banner-info1">
										<p>Toys + Furniture + Lighting + Watches</p>
									</div>
								</div>
							</article>
							<article style="position: absolute; width: 100%; opacity: 0;"> 
								<div class="banner-wrap">
									<div class="banner-info1">
										<p>Tops + Books & Music + Sports</p>
									</div>
								</div>
							</article>
						</div>
					</div>
						<script src="js/jquery.wmuSlider.js"></script> 
						<script>
							$('.example1').wmuSlider();         
						</script> 
				</div>
			</div>
		</div>
<!-- //banner -->
<!-- banner-bottom -->
	<div class="banner-bottom">
		<div class="container"> 
			<div class="banner-bottom-grids">
				<div class="banner-bottom-grid-left animated wow slideInLeft" data-wow-delay=".5s">
					<div class="grid">
						<figure class="effect-julia">
							<img src="images/about.jpg" alt=" " class="img-responsive" />
							<figcaption>
								<h3>Welcome<span></span><i> About &nbsp; us</i></h3>
								<div>
									<p>누구나 자유롭게 원하는 물건에 대한 수요조사하고,</p>
									<p>공동구매를 진행 할 수 있습니다.</p>
									<p>많이 이용해주세요.♥</p>
								</div>
							</figcaption>			
						</figure>
					</div>
				</div>
				<div class="banner-bottom-grid-left1 animated wow slideInUp" data-wow-delay=".5s">
					<div class="banner-bottom-grid-left-grid left1-grid grid-left-grid1">
						<div class="banner-bottom-grid-left-grid1">
							<img src="images/1.jpg" alt=" " class="img-responsive" />
						</div>
						<div class="banner-bottom-grid-left1-pos">
							<p>쉬운 해외 직구</p>
						</div>
					</div>
					<div class="banner-bottom-grid-left-grid left1-grid grid-left-grid1">
						<div class="banner-bottom-grid-left-grid1">
							<img src="images/ship.jpg" alt=" " class="img-responsive" />
						</div>
						<div class="banner-bottom-grid-left1-position">
							<div class="banner-bottom-grid-left1-pos1">
								<p>배송비 절감<br>가격 절감</p>
							</div>
						</div>
					</div>
				</div>
				<div class="banner-bottom-grid-right animated wow slideInRight" data-wow-delay=".5s">
					<div class="banner-bottom-grid-left-grid grid-left-grid1">
						<div class="banner-bottom-grid-left-grid1">
							<img src="images/h4.jpg" alt=" " class="img-responsive" />
						</div>
						<div class="grid-left-grid1-pos">
							<p>누구나 공동구매를 <span>진행할 수 있습니다.</span></p>
						</div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //banner-bottom -->
<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="footer-grids">
				<div class="col-md-3 footer-grid animated wow slideInLeft" data-wow-delay=".5s">
					<h3>About Us</h3>
					<p> <span>누구나 자유롭게 원하는 물건에 대한 <br>공동구매를 진행 할 수 있습니다.<br> 많이 이용해주세요.♥</span></p>
				</div>
				<div class="col-md-3 footer-grid animated wow slideInLeft" data-wow-delay=".6s">
					<h3>Contact Info</h3>
					<ul>
						<li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>서울특별시 성북구 <span>서경대학교</span></li>
						<li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i><a href="mailto:info@example.com">shipget0401@gmail.com</a></li>
						<li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>+1234 567 567</li>
					</ul>
				</div>
				<div class="col-md-3 footer-grid animated wow slideInLeft" data-wow-delay=".7s">
					<h3>Flickr Posts</h3>
					<div class="footer-grid-left">
						<a href="single.html"><img src="images/benefit.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="footer-grid-left">
						<a href="single.html"><img src="images/sun.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="footer-grid-left">
						<a href="single.html"><img src="images/ham.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="footer-grid-left">
						<a href="single.html"><img src="images/ipad.jpg" alt=" " class="img-responsive" /></a>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="col-md-3 footer-grid animated wow slideInLeft" data-wow-delay=".8s">
					<h3>Blog Posts</h3>
					<div class="footer-grid-sub-grids">
						<div class="footer-grid-sub-grid-left">
							<a href="single.html"><img src="images/2_3.JPG" alt=" " class="img-responsive" /></a>
						</div>
						<div class="footer-grid-sub-grid-right">
							<h4><a href="single.html">culpa qui officia deserunt</a></h4>
							<p>Posted On 25/3/2017</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="footer-grid-sub-grids">
						<div class="footer-grid-sub-grid-left">
							<a href="single.html"><img src="images/2_4.JPG" alt=" " class="img-responsive" /></a>
						</div>
						<div class="footer-grid-sub-grid-right">
							<h4><a href="single.html">Quis autem vel eum iure</a></h4>
							<p>Posted On 8/4/2017</p>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="footer-logo animated wow slideInUp" data-wow-delay=".5s">
				<h2><a href="index.html">Ship Get <span>shop anywhere</span></a></h2>
			</div>
		</div>
	</div>
<!-- //footer -->
</body>
</html>