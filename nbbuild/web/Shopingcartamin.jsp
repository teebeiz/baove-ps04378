<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
var me;
var me1
$.fn.update=function() {
    me = setInterval( $.fn.load, 1*10*1000);
    me1 = setInterval($.fn.load1 , 1*10*1000);
}


          $.fn.load =  function(){
        	   $.ajax({
       	       	
       	       	type:"POST",
       	       	 url:"Shoppingcarservlet?action=showor",
       				  headers:{
       					  Accept :"application/json; charset=utf-8",
       					  "Content-Type" : "application/json; charset=utf-8"
       				  },
       				  success:function(res){
       					  var listor = $.parseJSON(res);
    					  var s = "";
    					  $.each(listor,function(key,val){
    						  s+="<tr>";
    						  s+="<td>"+val.ID+"</td>";
    						  s+="<td>"+val.data_trans+"</td>";
    						  s+="<td>"+val.totail+"</td>";
    						  s+="<td>"+val.Status+"</td>";
    						  s+="<td>"+val.method+"</td>";
    						  s+="<td>"+val.customername+"</td>";
    						  s+="<td>"+val.sdt+"</td>";
    						  s+="<td>"+val.email+"</td>";
    						  s+="<td>"+val.Address+"</td>";
    						  s+="<td>"+val.tx+"</td>";
    						  s+="</tr>";
    					  });
    					  
    					  $("#showorder").html(s);
    				
    					  
    					  
       				  },
       				  error:function(){
       					  alert("not load")
       				  }
        	   });
          }
          
          

          $.fn.load1 =  function(){
        	   $.ajax({
       	       	
       	       	type:"POST",
       	       	 url:"Shoppingcarservlet?action=showorde",
       				  headers:{
       					  Accept :"application/json; charset=utf-8",
       					  "Content-Type" : "application/json; charset=utf-8"
       				  },
       				  success:function(res){
       					  var listorde = $.parseJSON(res);
    					  var s = "";
    					  $.each(listorde,function(key,val){
    						  s+="<tr>";
    						  s+="<td>"+val.Order_ID+"</td>";
    						  s+="<td>"+val.product_ID+"</td>";
    						  s+="<td>"+val.price+"</td>";
    						  s+="<td>"+val.quantity+"</td>";
    					
    						  s+="</tr>";
    					  });
    					  
    					  $("#showorder1").html(s);
    				
    					  
    					  
       				  },
       				  error:function(){
       					  alert("not load")
       				  }
        	   });
          }

</script>
</head>
<body onload="$.fn.update()">

<h2>Table Customer Order</h2>

  <table border="1" cellpadding="2" cellspacing="2" >
         <thead>
                <tr>
                   <th>ID</th>
                    <th>Date</th>
                      <th>Total</th>
                       <th>Status</th>
                    <th>Method</th>
                      <th>Customer name</th>
                       <th>Phone</th>
                          <th>Email</th>
                           <th>Address</th>
                            <th>TX</th>
                </tr>    
         </thead>
         
         <tbody id="showorder">
         
         </tbody>
      
      </table>
      

  
   
   ========================================================================================================
<br>
<br>
      <h2>Table Order Detail</h2>

  <table border="1" cellpadding="2" cellspacing="2" >
         <thead>
                <tr>
                   <th>Order ID</th>
                    <th>Product ID</th>
                      <th>Price</th>
                       <th>quantity</th>
                 
                </tr>    
         </thead>
         
         <tbody id="showorder1">
         
         </tbody>
      
      </table>


</body>
</html>