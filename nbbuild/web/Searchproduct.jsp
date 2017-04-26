<%@page import="DAO.*"%>
    <%@page import="Model.*"%>
    <%@page import="java.util.*"%>
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
			  alert("Product into cart.");
			$("#count").html(res);
		  },
		  error:function(){
			  alert("not load")
		  }
	   });
	   
	   
	  
   }
</script>
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
    <templates:templatesuser title="Search">
    
     <jsp:attribute name="language">
    
    
					
						<li>
				 <a href="LanguaServlet?lang=en_GB&action=product&cate_id=${requestScope.cate_id}"><img src="images/Britain-32.png" alt="" title="" border="0" /></a>
				  <a href="LanguaServlet?lang=fr_FR&action=product&cate_id=${requestScope.cate_id}"><img src="images/fr.png" alt="" title="" border="0" /></a>
				   <a href="LanguaServlet?lang=vi_VN&action=product&cate_id=${requestScope.cate_id}"><img src="images/vi.png" alt="" title="" border="0" /></a>
				    <a href="LanguaServlet?lang=ja_JP&action=product&cate_id=${requestScope.cate_id}"><img src="images/jp.png" alt="" title="" border="0" /></a>
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
        <div class="products">
            
	<div class="container">
            
		<h1>Products</h1>
		<div class="col-md-9">
			<div class="content-top1">
			<div class="col-md-4 col-md3">
					<div class="col-md1 simpleCart_shelfItem">
                                            <c:forEach var="pr" items="${requestScope.list}">
						<a href="ProductServlet?action=single&pr_id=${pr.pr_id}">
							<img class="img-responsive" src="images/${pr.images}" alt="" />
						</a>
						<h3><a href="ProductServlet?action=single&pr_id=${pr.pr_id}">${pr.pr_name}</a></h3>
						<div class="price">
								<h5 class="item_price">${pr.price}</h5>
							   <input type="button" value="Add To Cart" style="margin-left: 60px;color: blue;font-size: 18px" 
		               onclick="addss('${pr.pr_id}')" >
								<div class="clearfix"> </div>
						</div>
                                                </c:forEach>
                                                
					</div>
				</div>	
			</div>	
		
			
		</div>
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