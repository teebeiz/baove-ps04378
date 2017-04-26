<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    
    <%@ taglib prefix="templates" tagdir="/WEB-INF/tags/"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  
  
  <script type="text/javascript" src="js/jquery-1.6.2.js"></script>
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	  $("#cretaeaccount").click(function(){
		  var name = $("#name").val();
		  var email = $("#email").val();
		  var password = $("#password").val();
		  var conpassword = $("#confpassword").val();
		  if($.trim(name)==''){
			  alert("Please! Input name");
			  return false;
		  }
		  if($.trim(email)==''){
			  alert("Please! Input Email");
			  return false;
		  }
		  if($.trim(password)==''){
			  alert("Please ! Input Password ");
			  return false;
		  }
		  if($.trim(conpassword)==''){
                            alert("Please ! Confirm Password ");
			  return false;
		  }
		  $.ajax({
			  type:"POST",
			  data:{name:name,email:email,password:password,conpassword:conpassword},
			  url:"AccountServlet?action=createacount",	  
			  success:function(res){
				  alert(res);
				  $("#secuus").html(res);
				 $("#name").val("");
				$("#email").val("");
				$("#password").val("");
				   $("#confpassword").val("");
				
			  },
			  error:function(){
				  alert("Create Fail");
			  }
			  
		  });
			  
		  
		 
	  });
  });
  

</script>
  
  
    <templates:templatesuser title="register">
    
      <jsp:attribute name="language">
    
    
					
						<li>
				 <a href="LanguaServlet?lang=en_GB&action=register"><img src="images/Britain-32.png" alt="" title="" border="0" /></a>
				  <a href="LanguaServlet?lang=fr_FR&action=register"><img src="images/fr.png" alt="" title="" border="0" /></a>
				   <a href="LanguaServlet?lang=vi_VN&action=register"><img src="images/vi.png" alt="" title="" border="0" /></a>
				    <a href="LanguaServlet?lang=ja_JP&action=register"><img src="images/jp.png" alt="" title="" border="0" /></a>
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
      <div class="container">
	<div class="register">
		<h1>Register</h1>
		<h3><span id="secuus"></span></h3>
		<br>
	
		  	  <form> 
				 <div class="col-md-6  register-top-grid">
					
					<div class="mation">
						
					
						<span>Name</span>
						<input type="text" id="name"> 
					 
						 <span>Email Address</span>
						 <input type="text" id="email"> 
					</div>
					 <div class="clearfix"> </div>
					   <a class="news-letter" href="#">
						 <label class="checkbox"><input name="checkbox"  type="checkbox"><i> </i>Sign Up</label>
					   </a>
					 </div>
				     <div class=" col-md-6 register-bottom-grid">
						   
							<div class="mation">
								<span>Password</span>
								<input type="password" id="password">
								<span>Confirm Password</span>
								<input type="password" id="confpassword">
							</div>
					 </div>
					 <div class="clearfix"> </div>
				</form>
				
				<div class="register-but">
				   <form>
					   <input value="Create Account" type="button" id="cretaeaccount">
					   <div class="clearfix"> </div>
				   </form>
				</div>
		   </div>
</div>
  </jsp:attribute>
  
  </templates:templatesuser>