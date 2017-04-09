<%@page import="DAO.Categorydao"%>
<%@page import="Model.Category"%>
<%@page import="DAO.Productdao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    
    <%@ taglib prefix="templates" tagdir="/WEB-INF/tags/"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  
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
			  alert("Product into cart");
			$("#count").html(res);
		  },
		  error:function(){
			  alert("Not load")
		  }
	   });
	   
	   
	  
   }
</script>
    <templates:templatesuser title="single">
    
         <jsp:attribute name="language">
    
    
					
						<li>
				 <a href="LanguaServlet?lang=en_GB&action=single&pr_id=${requestScope.pr_id}"><img src="images/Britain-32.png" alt="" title="" border="0" /></a>
				  <a href="LanguaServlet?lang=fr_FR&action=single&pr_id=${requestScope.pr_id}"><img src="images/fr.png" alt="" title="" border="0" /></a>
				   <a href="LanguaServlet?lang=vi_VN&action=single&pr_id=${requestScope.pr_id}"><img src="images/vi.png" alt="" title="" border="0" /></a>
				    <a href="LanguaServlet?lang=ja_JP&action=single&pr_id=${requestScope.pr_id}"><img src="images/jp.png" alt="" title="" border="0" /></a>
						</li>
				
			
  </jsp:attribute>
    
       <jsp:attribute name="cart">
   
	<div class="cart box_1">
						<a href="Shoppingcart?action=showcart">
						<h3> <div class="total">
							</div>
							<img src="images/cart.png" alt=""/></h3>
						</a>
						<p><a href="Shoppingcart?action=showcart" class="simpleCart_empty"><span style="font-size: 17px;">Empty Cart :<span id="count">${sessionScope.n==null?0:sessionScope.n}</span></span> </a></p>

					</div>
   
   </jsp:attribute>
    <jsp:attribute name="banner">
 
    </jsp:attribute>
  
  
  
  <jsp:attribute name="content">
     <div class="single">

<div class="container">
<div class="col-md-9">
	<div class="col-md-5 grid">		
		<div class="flexslider">
			  
		<div style="overflow: hidden; position: relative;" class="flex-viewport"><ul style="width: 1000%; transition-duration: 0s; transform: translate3d(-304px, 0px, 0px);" class="slides">
                            
			    
			    
			    <li class="" style="width: 304px; float: left; display: block;" data-thumb="images/${requestScope.pr.images}">
			       <div class="thumb-image"> <img draggable="false" src="images/${requestScope.pr.images}" data-imagezoom="true" class="img-responsive"> </div>
			    </li> 
			  <li aria-hidden="true" class="clone" style="width: 304px; float: left; display: block;" data-thumb="images/${requestScope.pr.images}">
			        <div class="thumb-image"> <img draggable="false" src="images/${requestScope.pr.images}" data-imagezoom="true" class="img-responsive"> </div>
  </li></ul></div><ul class="flex-direction-nav">
      <li class="flex-nav-prev"><a class="flex-prev" href="#">Previous</a></li><li class="flex-nav-next"><a class="flex-next" href="#">Next</a></li></ul></div>
	</div>	
<div class="col-md-7 single-top-in">
						<div class="single-para simpleCart_shelfItem">
							<h1>Product Information</h1>
							<p>${requestScope.pr.comment}</p>
							<div class="star-on">
								<ul>
									<li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
									<li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
									<li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
									<li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
									<li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
								</ul>
								<div class="review">
									<a href="#"> 5 reviews </a>/
									<a href="#"> Write a review</a>
								</div>
							<div class="clearfix"> </div>
							</div>
							
								<label class="add-to item_price">$${requestScope.pr.price}</label>
							
							<div class="available">
								<h6>Name product : ${requestScope.pr.pr_name}</h6>
								<ul>
									
								<li>Size : <select>
									<option>Large</option>
									<option>Medium</option>
									<option>small</option>
									<option>Large</option>
									<option>small</option>
								</select></li>
								
							</ul>
						</div>
							     <input type="button" value="Add To Cart" style="margin-left:10 px;color: black;font-size: 18px" 
		               onclick="addss('${pr.pr_id}')" >
						</div>
					</div>
			<div class="clearfix"> </div>
			<div class="content-top1">
				
		<c:forEach var="pr" items="${requestScope.listprre}">
		
		      <div class="col-md-4 col-md3">
					<div class="col-md1 simpleCart_shelfItem">
						<a href="ProductServlet?action=single&pr_id=${pr.pr_id}">
							<img class="img-responsive" src="images/${pr.images}" alt="">
						</a>
						<h3><a href="ProductServlet?action=single&pr_id=${pr.pr_id}">${pr.pr_name}</a></h3>
						<div class="price">
								<h5 class="item_price">$${pr.price}</h5>
									     <input type="button" value="Add To Cart" style="margin-left: 30px;color: black;font-size: 15px" 
		               onclick="addss('${pr.pr_id}')" >
								<div class="clearfix"> </div>
						</div>
						
					</div>
				</div>	
		</c:forEach>
			
			
			<div class="clearfix"> </div>
			</div>		
</div>
<!----->
<div class="col-md-3 product-bottom">
			<!--categories-->
				<div class=" rsidebar span_1_of_left">
						<h3 class="cate">Categories</h3>
							 <ul class="menu-drop">
							 
							 <c:forEach var="ca" items="<%=(new Categorydao()).findallca() %>">
							    	<li class="item1"><a href="#">${ca.cate_name} </a>
							    	<ul style="display: none;" class="cute">
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
  </jsp:attribute>
  
  </templates:templatesuser>
  
  
  
  <!-- slide -->
<script src="js/jquery.min.js"></script>
<script src="js/imagezoom.js"></script>
<!-- start menu -->
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>$(document).ready(function(){$(".memenu").memenu();});</script>
<script src="js/simpleCart.min.js"> </script>
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
						<!-- FlexSlider -->
  <script defer src="js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

<script>
// Can also be used with $(document).ready()
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
});
</script>
<!---pop-up-box---->
					<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
					<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
					<!---//pop-up-box---->
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