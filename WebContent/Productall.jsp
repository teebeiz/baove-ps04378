<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="DAO.*"%>
    <%@page import="Model.*"%>
    <%@page import="java.util.*"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Fashion Mania Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- start menu -->
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>$(document).ready(function(){$(".memenu").memenu();});</script>
<script src="js/simpleCart.min.js"> </script>
<!-- slide -->

  <script type="text/javascript" src="js/jquery-1.6.2.js"></script>
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

   function addss(pr_id){

	   $.ajax({
		  type:"POST",
		  data:{pr_id:pr_id},
		  url:"Shoppingcart?action=buy",
		  success:function(res){
			  alert("Product Into cart");
			$("#count").html(res);
		  },
		  error:function(){
			  alert("Not load")
		  }
	   });
	   
	   
	  
   }
</script>
</head>
<body>

<!--header-->
<div class="header">
	<div class="header-top">
		<div class="container">
		<div class="col-md-4 world">
					<ul >
								<li>
				 <a href="LanguaServlet?lang=en_GB&action=productall"><img src="images/Britain-32.png" alt="" title="" border="0" /></a>
				  <a href="LanguaServlet?lang=fr_FR&action=productall"><img src="images/fr.png" alt="" title="" border="0" /></a>
				   <a href="LanguaServlet?lang=vi_VN&action=productall"><img src="images/vi.png" alt="" title="" border="0" /></a>
				    <a href="LanguaServlet?lang=ja_JP&action=productall"><img src="images/jp.png" alt="" title="" border="0" /></a>
						</li>
					</ul>
					
		 <fmt:setLocale value="${sessionScope.lang==null ? en_GB : sessionScope.lang}"></fmt:setLocale>
		   <fmt:setBundle  var="la" basename="Resoucre.Language"></fmt:setBundle>
				</div>
				<div class="col-md-4 logo">
					<a href="Index.jsp"><img src="images/logo.png" alt=""></a>	
				</div>
		
			<div class="col-md-4 header-left">		
					<p class="log"><a href="account.jsp"  ><fmt:message bundle="${la}" key="Login"></fmt:message></a>
						<span>or</span><a  href="register.jsp"  ><fmt:message bundle="${la}" key="Register"></fmt:message></a></p>
					<div class="cart box_1">
						<a href="Shoppingcart?action=showcart">
						<h3> <div class="total">
							</div>
							<img src="images/cart.png" alt=""/></h3>
						</a>
						<p><a href="Shoppingcart?action=showcart" class="simpleCart_empty"><span style="font-size: 17px;">Empty Cart :<span id="count">${sessionScope.n==null?0:sessionScope.n}</span></span> </a></p>

					</div>
					<div class="clearfix"> </div>
			</div>
				<div class="clearfix"> </div>
		</div>
		</div>
		<div class="container">
			<div class="head-top">
				<div class="col-md-2 number">
					<span><i class="glyphicon glyphicon-phone"></i>0977788948</span>
				</div>
		<div class="col-md-8 h_menu4">
				<ul class="memenu skyblue">
					  <li class=" grid"><a  href="Index.jsp"><fmt:message bundle="${la}" key="Home"></fmt:message></a></li>	
				      <li><a  href="#"><fmt:message bundle="${la}" key="Men"></fmt:message></a>
				      	<div class="mepanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<h4>All Clothing</h4>
									<ul>
								<c:forEach var="ca" items="<%=(new Categorydao()).findallca() %>">
									  	<li><a href="ProductServlet?action=products&cate_id=${ca.cate_id}">${ca.cate_name}</a></li>
									</c:forEach>
										
										
									</ul>	
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Footwear</h4>
									<ul>
									<c:forEach var="ca" items="<%=(new Categorydao()).findallca() %>">
									  	<li><a href="ProductServlet?action=products&cate_id=${ca.cate_id}">${ca.cate_name}</a></li>
									</c:forEach>
									
									</ul>	
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Popular Brands</h4>
									<ul>
								<c:forEach var="ca" items="<%=(new Categorydao()).findallca() %>">
									  	<li><a href="ProductServlet?action=products&cate_id=${ca.cate_id}">${ca.cate_name}</a></li>
									</c:forEach>
									</ul>	
								</div>												
							</div>
						  </div>
						</div>
					</li>
				    <li class="grid"><a  href="#">	<fmt:message bundle="${la}" key="Women"></fmt:message></a>
					  	<div class="mepanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<h4>All Clothing</h4>
									<ul>
										<c:forEach var="ca" items="<%=(new Categorydao()).findallca() %>">
									  	<li><a href="ProductServlet?action=products&cate_id=${ca.cate_id}">${ca.cate_name}</a></li>
									</c:forEach>
									</ul>	
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Footwear</h4>
									<ul>
								<c:forEach var="ca" items="<%=(new Categorydao()).findallca() %>">
									  	<li><a href="ProductServlet?action=products&cate_id=${ca.cate_id}">${ca.cate_name}</a></li>
									</c:forEach>
									</ul>
								</div>							
							</div>
							<div class="col1">
								<div class="h_nav">
									<h4>Popular Brands</h4>
									<ul>
							<c:forEach var="ca" items="<%=(new Categorydao()).findallca() %>">
									  	<li><a href="ProductServlet?action=products&cate_id=${ca.cate_id}">${ca.cate_name}</a></li>
									</c:forEach>
									</ul>	
								</div>												
							</div>
						  </div>
						</div>
			    </li>
				<li><a class="color6" href="contact.jsp"><fmt:message bundle="${la}" key="Contact"></fmt:message></a></li>				
				<li><a class="color6" href="Productall.jsp"><fmt:message bundle="${la}" key="Shop"></fmt:message></a></li>
			  </ul> 
			</div>
				<div class="col-md-2 search">		
			<a class="play-icon popup-with-zoom-anim" href="#small-dialog"><i class="glyphicon glyphicon-search"> </i> </a>
		</div>
		<div class="clearfix"> </div>
			<!---pop-up-box---->
					  <script type="text/javascript" src="js/modernizr.custom.min.js"></script>    
					<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
					<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
					<!---//pop-up-box---->
				<div id="small-dialog" class="mfp-hide">
				<div class="search-top">
						<div class="login">
                                                    <form action="Search">
							<input type="submit" value="">
							<input type="text" name="tenSP" value="Type something..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}">		
						</form>
                                                        </div>
						<p>Shopping</p>
					</div>				
				</div>
				 <script>
						$(document).ready(function() {
						$('.popup-with-zoom-anim').magnificPopup({
							type: 'inline',
							fixedContentPos: false,
							fixedBgPos: true,
							overflowY: 'auto',
							closeBtnInside: true,
							preloader: false,
							midClick: true,
							removalDelay: 300,
							mainClass: 'my-mfp-zoom-in'
						});
																						
						});
				</script>			
	<!---->		
		</div>
	</div>
</div>
<!--content-->
<div class="products">
    
<%
Productdao prd =  new Productdao();
List<Product> listpr=  prd.fillall();
String page1 = "";
String page2 = "";
int start = 0;
int end;
if(listpr.size()<18){
	 end = listpr.size();
}else{
	 end = 9;
}
if(request.getParameter("start")!=null){
	 page1 = request.getParameter("start");
	 start = Integer.parseInt(page1);
}

if(request.getParameter("end")!=null){
	 page2 = request.getParameter("end");
	 end = Integer.parseInt(page2);
}
List<Product> list = prd.getlist(listpr, start, end);
%>

<!-- --------------------------------------------------------------ERROR------------------------------------------------------------------- !!!!!-->
	<div class="container">
		<h1>Products</h1>
		<div class="col-md-9">
		
		
			<div class="content-top1">
			<%int s=0; %>
			<%for(Product pr:list){ %>
			   <%s++; %>
				<div class="col-md-4 col-md3">
					<div class="col-md1 simpleCart_shelfItem">
						<a href="ProductServlet?action=single&pr_id=<%=pr.getPr_id()%>">
							<img class="img-responsive" src="images/<%=pr.getImages() %>" alt="" />
						</a>
						<h3><a href="ProductServlet?action=single&pr_id=<%=pr.getPr_id()%>"><%=pr.getPr_name() %></a></h3>
						<div class="price">
                                                    <h5 class="item_price" style="font-size: 18px ;">$<%=pr.getPrice() %></h5>
                                                    <input type="button" value="Add To Cart" style="margin-left: 30px;color: black;font-size: 15px" 
                                                        onclick="addss('<%=pr.getPr_id()%>')" >
								<div class="clearfix"> </div>
						</div>
					</div>
				</div>	
                                                                
				<%
				  if(s==3 || s==6){
					  
				 %>
                                 
					  <div class="clearfix"> <span style="color:white;"><br><br><br></span> </div>
				  <%} %>
				
				
		
		<%} %>
			
			<div class="clearfix"> </div>
			</div>	
			
		<%
		  int limit = listpr.size()/9;
		 if( limit*9 < listpr.size()){
			 limit+=1;
		 }
		 
		 for(int i=1;i<=limit;i++){
			 
			 int a = (i-1)*9;
			 int b = i*9;
			 if(b>listpr.size()){
				 b = listpr.size();
			 }
		 
		 
		%>
		
		  <a href="?start=<%=a%>&end=<%=b%>"><span  style="font-size: 20px"><%=i%></span> </a>
		
		<%} %>
			<!-- END -->
		</div>
		<div class="col-md-3 product-bottom">
			<!--categories-->
				<div class=" rsidebar span_1_of_left">
						<h3 class="cate">Categories</h3>
							 <ul class="menu-drop">
						
							
						<c:set var="prd" value="<%=(new Productdao()) %>"></c:set>
					
					 <c:forEach var="ca" items="<%=(new Categorydao()).findallca() %>">
							<li class="item4"><a href="#">${ca.cate_name}</a>
								<ul class="cute">
								<c:forEach var="pr" items="${prd.fillallprca(ca.cate_id)}">
								      <li class="subitem1"><a href="ProductServlet?action=single&pr_id=${pr.pr_id}">${pr.pr_name}</a></li>
								</c:forEach>
								
								</ul>
							</li>
							</c:forEach>
						</ul>
					</div>
				<!--initiate accordion-->
						<script type="text/javascript">
							$(function() {
							    var menu_ul = $('.menu-drop > li > ul'),
							           menu_a  = $('.menu-drop > li > a');
							    menu_ul.hide();
							    menu_a.click(function(e) {
							        e.preventDefault();
							        if(!$(this).hasClass('active')) {
							            menu_a.removeClass('active');
							            menu_ul.filter(':visible').slideUp('normal');
							            $(this).addClass('active').next().stop(true,true).slideDown('normal');
							        } else {
							            $(this).removeClass('active');
							            $(this).next().stop(true,true).slideUp('normal');
							        }
							    });
							
							});
						</script>
<!--//menu-->
<!--seller-->
				<div class="product-bottom">
						<h3 class="cate">Best Sellers</h3>
				<c:forEach var="pr" items="<%=(new Productdao()).fillallpr2() %>">
				
				   <div class="product-go">
						<div class=" fashion-grid">
							<a href="ProductServlet?action=single&pr_id=${pr.pr_id}"><img class="img-responsive " src="images/${pr.images}" alt=""></a>	
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2"><a href="ProductServlet?action=single&pr_id=${pr.pr_id}">${pr.pr_name} </a></h6>
							<span class=" price-in1"> $${pr.price}</span>
						</div>	
						<div class="clearfix"> </div>
					</div>	
				
				</c:forEach>
						
				</div>

<!--//seller-->
<!--tag-->
				<div class="tag">	
						<h3 class="cate">Tags</h3>
					<div class="tags">
						<ul>
							<li><a href="#">design</a></li>
							<li><a href="#">fashion</a></li>
							<li><a href="#">lorem</a></li>
							<li><a href="#">dress</a></li>
							<li><a href="#">fashion</a></li>
							<li><a href="#">dress</a></li>
							<li><a href="#">design</a></li>
							<li><a href="#">dress</a></li>
							<li><a href="#">design</a></li>
							<li><a href="#">fashion</a></li>
							<li><a href="#">lorem</a></li>
							<li><a href="#">dress</a></li>
						<div class="clearfix"> </div>
						</ul>
				</div>					
			</div>
		</div>
		<div class="clearfix"> </div>
	</div>
</div>
<!--//content-->
<!--footer-->
<div class="footer">

	<div class="footer-bottom">
		<div class="container">
				<div class="col-md-3 footer-bottom-cate">
					<h6><fmt:message bundle="${la}" key="Categories"></fmt:message></h6>
					<ul>
				<c:forEach var="ca" items="<%=(new Categorydao()).findallca() %>">
				
						<li><a href="ProductServlet?action=products&cate_id=${ca.cate_id}">${ca.cate_name}</a></li>
				</c:forEach>
				
				
						
					</ul>
				</div>
				<div class="col-md-3 footer-bottom-cate">
					<h6><fmt:message bundle="${la}" key="Categories"></fmt:message></h6>
					<ul>
					 
							<c:forEach var="ca" items="<%=(new Categorydao()).findallca() %>">
				
						<li><a href="ProductServlet?action=products&cate_id=${ca.cate_id}">${ca.cate_name}</a></li>
				</c:forEach>
				
						
					</ul>
				</div>
				<div class="col-md-3 footer-bottom-cate">
					<h6><fmt:message bundle="${la}" key="Categories"></fmt:message></h6>
					<ul>
						<c:forEach var="ca" items="<%=(new Categorydao()).findallca() %>">
				
						<li><a href="ProductServlet?action=products&cate_id=${ca.cate_id}">${ca.cate_name}</a></li>
				</c:forEach>
					
						
					</ul>
				</div>
				<div class="col-md-3 footer-bottom-cate cate-bottom">
					<h6>Our Address</h6>
					<ul>
						<li>391A Nam Kì Khởi Nghĩa </li>
						<li>Quận 3</li>
						<li>Thành Phố Hồ Chí Minh</li>
						<li>FPT Polytechnic </li>
						<li>University</li>
						<li class="phone">PH : 0977788948 (Gặp BÌNH)</li>
					</ul>
				</div>
				<div class="clearfix"> </div>
				<p class="footer-class"> © 2015 Fashion Mania. All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
                                <p class="footer-class"> © FPT Polytechnic <a href="http://fpt.edu.vn/" target="_blank">Cao Đẳng Thực Hành FPT Polytechnic</a> </p>
			</div>
	</div>
</div>

<!--//footer-->
</body>
</html>