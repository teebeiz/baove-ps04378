<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Index</title>
<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	$("#formcateregory").hide();
	 $.fn.load();

		
  
  });
  
  $.fn.load = function() {
	
	   $.ajax({
	       	
	       	type:"POST",
	       	 url:"CategoryServlet?action=showcate",
				  headers:{
					  Accept :"application/json; charset=utf-8",
					  "Content-Type" : "application/json; charset=utf-8"
				  },
				  success:function(res){
						
					  var listca = $.parseJSON(res);
					
					  var s="";
		                 $.each(listca,function(key,val){
		                	 s+="<tr>";
		                	 s+="<td> " + val.cate_id + "</td>";
		                	 s+="<td> " + val.cate_name + "</td>";
		                	 s+="<td><button type='button' onclick='deletes("+val.cate_id+")''>Delete</button> | <button type='button' onclick='Edit("+val.cate_id+")''>Edit</button></td>";
		                	 s+="</tr>";
		                 });
		                
		                  $("#showcategory").html(s);

				  },
				  error:function(){
					  alert("that bai")
				  }
	       	
	       });
	  
  }

  function add() {
	var catename = $("#catename").val();
	
	if($.trim(catename)==''){
		alert("ban bo rong cate_name");
		return false;
	}
	  $.ajax({
			type:"POST",
			data:{catename:catename},
	       	 url:"CategoryServlet?action=createcate",
				
				  success:function(res){
						
					  alert("Add success");
						 $.fn.load();
		             
		            

				  },
				  error:function(){
					  alert("that bai")
				  }
	  });
	
 }
  
  function deletes(cate_id) {
	  var c = confirm("are you sure");

	  if(c==false){
		  return;
	  }else{
		  $.ajax({
			  type:"POST",
			  data:{cate_id:cate_id},
			  url:"CategoryServlet?action=detelecate",
			  success:function(res){
					
			      alert("detele success");
					 $.fn.load();
	               
	            

			  },
			  error:function(){
				  alert("delete fail")
			  }	  
		  });
	  }
   }
  
  
  function Edit(cate_id) {
	
	  $("#bttcreate").hide();

		  $.ajax({
			  type:"POST",
			  data:{cate_id:cate_id},
			  url:"CategoryServlet?action=findcate",
			
			  success:function(res){
				  var ca = $.parseJSON(res);
			   $("#cateid").val(ca.cate_id);
			   $("#catename").val(ca.cate_name);
			   $("#formcateregory").show();
			   $('#bttupdate').show();
	            

			  },
			  error:function(){
				  alert("delete fail")
			  }	  
		  });
	  
   }
  
  
  
  function update() {
	 var cate_id =  $("#cateid").val();
	  var cate_name =  $("#catename").val();

		  $.ajax({
			  type:"POST",
			  data:{cate_id:cate_id,cate_name:cate_name},
			  url:"CategoryServlet?action=updatacate",
			
			  success:function(res){
				   alert("update success");
					 $.fn.load();
				
				   
			  
			    
			   
	            

			  },
			  error:function(){
				  alert("update fail")
			  }	  
		  });
	  
   }



</script>
</head>

   
<body>
  <center>
  <a href="ProductAdmin.jsp" target="blank"><h2>Product Admin</h2></a>
  <a href="Shopingcartamin.jsp" target="blank"><h2>Shoping cart Admin</h2></a>
  <a href="customeradmin.jsp" target="blank"><h2>Customer</h2></a>
  <br>
  <br>
  <br>
<fieldset>
       <legend>Category Admin</legend>

  <form>
 <button  type="button" onclick="$('#formcateregory').show(); $('#bttcreate').show();$('#bttupdate').hide()">Create Category</button>
  <br>
  <br>
 
   
      <table border="1" cellpadding="2" cellspacing="2" >
         <thead>
                <tr>
                   <th>Cate_id</th>
                    <th>Cate_Name</th>
                      <th>Action</th>
                </tr>    
         </thead>
         
         <tbody id="showcategory">
         
         </tbody>
      
      </table>
      <br>
      <br>
      <br>
         
 
   

   
   
   <div id="formcateregory">
 
     <input type="hidden" id="cateid">
      <br>
      Cate name  <input type="text" id="catename">
       <br>
       <br>
       <button type="button" id="bttcreate" onclick="add()">Add category</button>
        <button type="button" id="bttupdate" onclick="update()">Update category</button>
  
   </div>
   
       </form>

</fieldset>

        

 </center>
</body>
</html>