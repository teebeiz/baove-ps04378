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
var me1
$.fn.update=function() {
    me = setInterval( $.fn.loadcu , 1*10*1000);
  
}

$.fn.loadcu =  function(){
	   $.ajax({
       	
       	type:"POST",
       	 url:"Shoppingcarservlet?action=showcus",
			  headers:{
				  Accept :"application/json; charset=utf-8",
				  "Content-Type" : "application/json; charset=utf-8"
			  },
			  success:function(res){
				  var listorcu = $.parseJSON(res);
				  var s = "";
				  $.each(listorcu,function(key,val){
					  s+="<tr>";
					  s+="<td>"+val.Email+"</td>";
					  s+="<td>"+val.password+"</td>";
					  s+="<td>"+val.hoten+"</td>";
					
				
					  s+="</tr>";
				  });
				  
				  $("#showcu").html(s);
			
				  
				  
			  },
			  error:function(){
				  alert("not load")
				  }
	   });
}
 
</script>
</head>
<body onload="$.fn.update()">
  <table border="1" cellpadding="2" cellspacing="2" >
         <thead>
                <tr>
                  
                    <th>Email</th>
                      <th>Password</th>
                       <th>Ho ten</th>
                  
                        
                </tr>    
         </thead>
         
         <tbody id="showcu">
         
         </tbody>
      
      </table>
      
</body>
</html>