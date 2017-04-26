<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    
    <%@ taglib prefix="templates" tagdir="/WEB-INF/tags/"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  
  
    <script type="text/javascript" src="js/jquery-1.6.2.js"></script>
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

   function deteles(pr_id){

	   $.ajax({
		  type:"POST",
		  data:{pr_id:pr_id},
		  url:"Shoppingcart?action=detele",
		  success:function(res){
		      location.reload();
			    
			  
		  },
		  error:function(){
			  alert("not load")
		  }
	   });
	   
	   
	  
   }
   function edits(pr_id){
		  var quantity = parseInt($("#" + pr_id).val());
	 if(quantity==0 || 	isNaN(quantity)){
		  $.ajax({
			  type:"POST",
			  data:{pr_id:pr_id},
			  url:"Shoppingcart?action=detele",
			  success:function(res){
			      location.reload();
				    
				  
			  },
			  error:function(){
				  alert("not load")
			  }
		   });
	 }

	 
	 else{
		 $.ajax({
			 type:"POST",
			 data:{pr_id:pr_id,quantity:quantity},
			 url:"Shoppingcart?action=update",
		     success:function(res){
		    	
		         location.reload();
		         
		     },
		     error:function(){
				  alert("not load")
			  }
		  });
	 }
	 
	 
	 
	
   }
   
   function check(){
	   var name = $("#name").val();
	   var phone = $("#phone").val();
	   var email = $("#email").val();
	   var address = $("#address").val();
	   var totail = $("#totail").val();
	   if($.trim(name)==''){
		   alert("Please Input Name")
		   return false
	   }
	   if($.trim(phone)==''){
		   alert("Please Input Phone Number")
		   return false
	   }
	   
		 $.ajax({
			 type:"POST",
			 data:{name:name,phone:phone,email:email,address:address,totail:totail},
			 url:"Shoppingcart?action=save",
		     success:function(res){
		    	
		        alert("Buy Success, We will contact you")
	     	   $("#name").val("");
		 	   $("#phone").val("");
		    	$("#email").val("");
		 	   $("#address").val("");
		         
		     },
		     error:function(){
				  alert("not load")
			  }
		  });
	
	   
   }
</script>
  
  
  
    <templates:templatesuser title="Checkout">
    

    
       <jsp:attribute name="cart">
   
	<div class="cart box_1">
						<a href="Shoppingcart?action=showcart">
						<h3> <div class="total">
							</div>
							<img src="images/cart.png" alt=""/>${sessionScope.s==null?0:sessionScope.s}</h3>
						</a>
						<p><a href="Shoppingcart?action=showcart" class="simpleCart_empty"><span style="font-size: 17px;">Empty Cart :<span >${sessionScope.n==null?0:sessionScope.n}</span></span> </a></p>

					</div>
   
   </jsp:attribute>
    
    <jsp:attribute name="banner">
 
    </jsp:attribute>
  
  
  <jsp:attribute name="content">
<div class="container">
	<div class="check-out">
		<h1>Checkout</h1>
    	    <table>
		  <tbody><tr>
			<th>Item</th>
			<th>Qty</th>		
			<th>Prices</th>
			<th>Delery Detials</th>
			<th>Subtotal</th>
		    <th><img src="images/btn_delete.png"></th>
		  </tr>
	
	  <c:set var="s" value="0"></c:set>
	   <c:forEach var="pr" items="${sessionScope.lstprs}">
	   
	        <tr>
		  <td class="ring-in"><a href="ProductServlet?action=single&pr_id=${pr.pr_id}"" class="at-in"><img src="images/${pr.images}" class="img-responsive" alt=""></a>
			<div class="sed">
				<h5>${pr.pr_name}</h5>
				<p> </p>
			</div>
			<div class="clearfix"> </div></td>
			<td class="check"><input value="${pr.quantity}"type="text" id="${pr.pr_id}" onblur="edits('${pr.pr_id}')"></td>		
			<td>$${pr.price}</td>
			<td>FREE SHIPPING</td>
			<td>$${pr.price * pr.quantity}</td>
			<td><button type="button" onclick="deteles('${pr.pr_id}')"><img src="images/btn_delete.png"></button></td>
		  </tr>
		  
		  <c:set var="s" value="${s + pr.price*pr.quantity}"></c:set>
	   
	   </c:forEach>
		<tr>
            <td colspan="6" style="text-align:right; font-size: 18px">Total : <span style="color: green;">$${s}</span> </td>
        </tr>
	</tbody></table>
	
   <br>
	<br>
	<a href="Index.jsp"><span style="font-size: 18px; color:orange;" > << Continue Shopping</span></a> 
	<br>
	<br>
	<br>
	<fieldset>
        <legend>Customer Information</legend>
             <form>
         <span style="font-size: 18px;">Name</span>  <input type="text" id ="name" style="margin-left: 15px">
        <br>
        <br>
        <br>
     
       <span style="font-size: 18px;">Phone</span>   <input type="text" id ="phone" style="margin-left: 15px">
        <br>
        <br>
        <br>
     
     <span style="font-size: 18px;">Email</span>    <input type="text" id ="email" style="margin-left: 15px">
        <br>
        <br>
        <br>
         <p style="font-size: 18px;">Address</p> <textarea rows="4" cols="30" id="address"></textarea>
        <br>
        <br>
        <br>
          <input type="hidden" value="${s}" id="totail">
           <button type="button" onclick="check()"  class="to-buy" style="color: black;">PROCEED TO BUY</button>
       
       </form>
       
       </fieldset>

	<div class="clearfix"> </div>
    </div>
</div>
  </jsp:attribute>
  
  </templates:templatesuser>