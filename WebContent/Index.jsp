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
			  alert("Product Into Cart");
			$("#count").html(res);
		  },
		  error:function(){
			  alert("Not Load")
		  }
	   });
	   
	   
	  
   }
</script>
  
  <templates:templatesuser title="Home">
  
  <jsp:attribute name="language">
    
    
					
						<li>
				 <a href="LanguaServlet?lang=en_GB&action=index"><img src="images/Britain-32.png" alt="" title="" border="0" /></a>
				  <a href="LanguaServlet?lang=fr_FR&action=index"><img src="images/fr.png" alt="" title="" border="0" /></a>
				   <a href="LanguaServlet?lang=vi_VN&action=index"><img src="images/vi.png" alt="" title="" border="0" /></a>
				    <a href="LanguaServlet?lang=ja_JP&action=index"><img src="images/jp.png" alt="" title="" border="0" /></a>
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
       <div class="banner">
	<div class="col-sm-3 banner-mat">
		<img class="img-responsive" src="images/ba1.jpg" alt="">
	</div>
	<div class="col-sm-6 matter-banner">
	 	<div class="slider">
	    	<div class="callbacks_container">
	      		<ul class="rslides callbacks callbacks1" id="slider">
	        		<li class="" style="display: block; float: none; position: absolute; opacity: 0; z-index: 1; transition: opacity 500ms ease-in-out 0s;" id="callbacks1_s0">
	          			<img src="images/1.jpg" alt="">
	       			 </li>
			 		 <li class="" style="float: none; position: absolute; opacity: 0; z-index: 1; display: list-item; transition: opacity 500ms ease-in-out 0s;" id="callbacks1_s1">
	          			<img src="images/2.jpg" alt="">   
	       			 </li>
					 <li class="callbacks1_on" style="float: left; position: relative; opacity: 1; z-index: 2; display: list-item; transition: opacity 500ms ease-in-out 0s;" id="callbacks1_s2">
	          			<img src="images/1.jpg" alt="">
	        		</li>	
	      		</ul><ul class="callbacks_tabs callbacks1_tabs"><li class="callbacks1_s1"><a href="#" class="callbacks1_s1">1</a></li><li class="callbacks1_s2"><a href="#" class="callbacks1_s2">2</a></li><li class="callbacks1_s3 callbacks_here"><a href="#" class="callbacks1_s3">3</a></li></ul>
	 	 	</div>
		</div>
	</div>
	<div class="col-sm-3 banner-mat">
		<img class="img-responsive" src="images/ba.jpg" alt="">
	</div>
	<div class="clearfix"> </div>
</div>
    </jsp:attribute>
  
  
  <jsp:attribute name="content">
     <div class="content">
	<div class="container">
		<div class="content-top">
		 <fmt:setLocale value="${sessionScope.lang==null ? en_GB : sessionScope.lang}"></fmt:setLocale>
		   <fmt:setBundle  var="la" basename="Resoucre.Language"></fmt:setBundle>
			<h1><fmt:message bundle="${la}" key="RecentProducts"></fmt:message></h1>
			
			
			
	 <div class="content-top1">
			<c:set var="s" value="0"></c:set>
	      <c:forEach var="pr" items="<%=(new Productdao()).fillallpr() %>">
			   <c:set var="s" value="${s+1}"></c:set>
			  	<div class="col-md-3 col-md2">
					<div class="col-md1 simpleCart_shelfItem">
						<a href="ProductServlet?action=single&pr_id=${pr.pr_id}">
							<img class="img-responsive" src="images/${pr.images}" alt="">
						</a>
						<h3><a href="ProductServlet?action=single&pr_id=${pr.pr_id}">${pr.pr_name}</a></h3>
						<div class="price">
								<h5 class="item_price" style="font-size: 15;" >$${pr.price}</h5> 
		               <input type="button" value="Add To Cart" style="margin-left: 20px;color: black;font-size: 15px" 
		               onclick="addss('${pr.pr_id}')" >
			                    
								
								<div class="clearfix"> </div>
						</div>
					</div>
				</div>	
				
				<c:if test="${s==4}">
				  	<div class="clearfix"> <span style="color:white;">br</span> </div>
				</c:if>
			
			
		
			  </c:forEach>
			
				   
				
				<div class="clearfix"> </div>
			
			</div>	
		
		
			
				
		</div>
	</div>
</div>
  </jsp:attribute>
  
  </templates:templatesuser>