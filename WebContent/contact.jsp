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
			  alert("product into cart");
			$("#count").html(res);
		  },
		  error:function(){
			  alert("not load")
		  }
	   });
	   
	   
	  
}


   function bttsend(){
      

	var name =  $("#name").val();
	var email =  $("#email").val();
	var phone =  $("#phone").val();
	var message =  $("#message").val();
	if($.trim(name)==""){
		alert("Please Input Name");
		return false;
	}
	if($.trim(email)==""){
		alert("Please Input Email");
		return false;
	}
	if($.trim(phone)==""){
		alert("Please Input Phone number");
		return false;
	}

	
	$.ajax({
		type:"POST",
		data:{name:name,email:email,phone:phone,message:message},
		url:"ContractServlet?action=sends",
	    success:function(res){
	    	alert(res);
	        $("#message").val("");
	    },
	    error:function(){
	    	
	    }
	});
	   
	   
	  
   }
</script>
    <templates:templatesuser title="Contact">
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
<div class="contact">
			<div class="container">
				<h1>Contact</h1>
				
				<div class="contact-grids">
					<div class="contact-form">
							<form>
								<div class="contact-bottom">
									<div class="col-md-4 in-contact">
										<span>Name</span>
										<input type="text" id="name" style="font-size: 15px;color: black;">
									</div>
									<div class="col-md-4 in-contact">
										<span>Email</span>
										<input type="text" id="email" style="font-size: 15px;color: black;">
									</div>
									<div class="col-md-4 in-contact">
										<span>Phone number</span>
									
										<input type="text" id="phone" style="font-size: 15px;color: black;">
									</div>
									<div class="clearfix"> </div>
								</div>
							
								<div class="contact-bottom-top">
									<span>Message</span>
									<textarea id="message" style="font-size: 15px;color: black;"> </textarea>								
									</div>
									<br>
								<input value="Send" type="button" onclick="bttsend()">
							</form>
						</div>
				<div class="address">
					<div class=" address-more">
						<h2>Address</h2>
						<div class="col-md-4 address-grid">
							<i class="glyphicon glyphicon-map-marker"></i>
                                                        <div class="address1" style="font-size: 13px;">
								<p>437 Tran Phu, District 5</p>
								<p>Ho Chi Minh City</p>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="col-md-4 address-grid ">
							<i class="glyphicon glyphicon-phone" ></i>
							<div class="address1" style="font-size: 15px;">
								<p>+84977788948</p>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="col-md-4 address-grid ">
							<i class="glyphicon glyphicon-envelope"></i>
							<div class="address1" style="font-size: 15px;">
								<p><a href="mailto:@example.com"> @example.com</a></p>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>
		</div>
	</div>
  </jsp:attribute>
  
  </templates:templatesuser>