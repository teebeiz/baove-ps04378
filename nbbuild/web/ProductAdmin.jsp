<%@page import="Model.Category"%>
<%@page import="DAO.Categorydao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Admin</title

<script type="text/javascript" src="js/jquery-1.6.2.js"></script>
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#formproduct").hide();
	 $.fn.load();

		
  
  });
  
  $.fn.load = function() {
	
	   $.ajax({
	       	
	       	type:"POST",
	       	 url:"ProductAdminservlet?action=showpr",
				  headers:{
					  Accept :"application/json; charset=utf-8",
					  "Content-Type" : "application/json; charset=utf-8"
				  },
				  success:function(res){
						
					  var listpr = $.parseJSON(res);
					  var s = "";
					    $.each(listpr,function(key,val){
		                	 s+="<tr>";
		                	 s+="<td> " + val.pr_id + "</td>";
		                	 s+="<td> " + val.pr_name + "</td>";
		                 	 s+="<td> " + val.price + "</td>";
		                 	 s+="<td> " + val.quantity + "</td>";
		                 	 s+="<td> " + val.comment + "</td>";
		                 	 s+="<td> " + val.Status + "</td>";
		                 	 s+="<td> " + val.cate_id + "</td>";     
                                        
		                 	 s+="<td>  <img  src='images/"+val.images+"' width='120' height='100'></td>";
		          	 s+="<td><button type='button' onclick='deletes("+val.pr_id+")''>Delete</button> | <button type='button' onclick='Edit("+val.pr_id+")''>Edit</button></td>";
		                	 s+="</tr>";
		                 });
		                
		                  $("#showproduct").html(s);
				  },
				  error:function(){
					  alert("Fail")
				  }
	       	
	       });
	  
  }
  
  
  function add(){
	 
	  var pr_name = $("#prname").val();
	  var price = $("#prprice").val();
	  var quantity = $("#quantitys").val();
	  var comment = $("#commentss").val();
	  var Status = $("#status").val();
	  var cate_id = $("#catename").val();
          var images = $("#imagess").val();
		
		if($.trim(pr_name)==''){
			alert("pr_name Empty");
			return false;
		}
		if($.trim(price)==''){
			alert("Price Empty");
			return false;
		}
		
		  $.ajax({
				type:"POST",
				data:{pr_name:pr_name,price:price,quantity:quantity,comment:comment,Status:Status,cate_id:cate_id,images:images},
		       	 url:"ProductAdminservlet?action=createpro",
					
					  success:function(res){
							
						  alert("Add success");
							 $.fn.load();
							 alert(res);
			             
			            

					  },
					  error:function(){
						  alert("Add Fail")
					  }
		  });
  }
  
  
  function deletes(pr_id){

	  var c = confirm("Are Yo Sure?");
	  if(c==false){
		  return
	  }else{
		  $.ajax({
			  type:"POST",
			  data:{pr_id:pr_id},
			  url:"ProductAdminservlet?action=deteles",
			  success:function(res){
					
			      alert("Detele success");
			      $.fn.load();
	               
	            

			  },
			  error:function(){
				  alert("Delete fail")
			  }	  
		  });
	  }
	  
	  
  }
  
  function Edit(pr_id){
	  $('#bttcreate').hide();
	  $.ajax({
		  type:"POST",
		  data:{pr_id:pr_id},
		  url:"ProductAdminservlet?action=findpr",
		  success:function(res){
			
			  var pr = $.parseJSON(res);
		
			$("#prid").val(pr.pr_id);
			  $("#prname").val(pr.pr_name);
			   $("#prprice").val(pr.price);
		
			   $("#commentss").val(pr.comment);
			   $("#catename").val(pr.cate_id);
		
		   
		    $("#formproduct").show();
		    $("#bttupdate").show();
               
            

		  },
		  error:function(){
			  alert("Not load")
		  }	
	  });
  }
  
  function update(){
	  var pr_id = $("#prid").val();
	  var pr_name = $("#prname").val();
	  var price = $("#prprice").val();
	  var quantity = $("#quantitys").val();
	  var comment = $("#commentss").val();
	  var Status = $("#status").val();
	  var cate_id = $("#catename").val();
      var images = $("#imagess").val();
      
		if($.trim(pr_name)==''){
			alert("pr_name Empty ");
			return false;
		}
		if($.trim(price)==''){
			alert("price Empty");
			return false;
		}
		
		
		  $.ajax({
				type:"POST",
				data:{pr_id:pr_id ,pr_name:pr_name,price:price,quantity:quantity,comment:comment,
					Status:Status,cate_id:cate_id,images:images},
		       	 url:"ProductAdminservlet?action=updatepro",
					
					  success:function(res){
							
						  alert("Update Success");
							 $.fn.load();
			             
			            

					  },
					  error:function(){
						  alert("Update Fail");
					  }
		  });
      
  }
</script>
</head>
<body>
    <h1></h1>
    <center><a href="indexadmin.jsp" target="blank"><h2>Index Admin</h2></a></center>
<br>
<br>
<br>
    <center>
<fieldset>
       <legend>Product Admin</legend>

  <form enctype="multipart/form-data">
 <button  type="button" onclick="$('#formproduct').show();$('#bttcreate').show();$('#bttupdate').hide()" >Create Product</button>
  <br>
  <br>
 
   
      <table border="1" cellpadding="2" cellspacing="2" >
         <thead>
                <tr>
                   <th>pr_id</th>
                    <th>pr_Name</th>
                      <th>price</th>
                       <th>quantity</th>
                    <th>comment</th>
                      <th>Status</th>
                       <th>Cate_id</th>
                          <th>Images</th>
                           <th>Action</th>
                </tr>    
         </thead>
         
         <tbody id="showproduct">
         
         </tbody>
      
      </table>
      <br>
      <br>
      <br>
         
 
   

   
   
   <div id="formproduct">
 
     <input type="hidden" id="prid">
      <br>
      Product Name  <input type="text" id="prname"> &nbsp;  &nbsp; &nbsp; Price <input type="text" id="prprice">
      &nbsp;  &nbsp; &nbsp; Quantity <select id="quantitys">
               <option value="1">1</option>
      </select>
       <br>
       <br>
    Comment   <textarea rows="4" cols="15" id="commentss"></textarea> &nbsp;  &nbsp; &nbsp; Status : True <input type="radio" name="status" id="status" value="true">
    &nbsp; false <input type="radio" name="status" id="status" value="false"> &nbsp;  &nbsp; &nbsp; 
    <%
       Categorydao cad = new Categorydao();
    %>
    
    Categoty Name 
    <select id="catename">
     <%
        for(Category ca:cad.findallca()){
        	
        	 
     %>
     
      <option value="<%=ca.getCate_id()%>"><%=ca.getCate_name() %></option>
      <%} %>
    </select>
       <br>
       <br>
       
     <h3>File Upload:</h3>
     Select a file to upload: <br />
     <input type="file" size="2" id="file" />
    <input type="text" id="imagess" value="" size="50" />
        
         <br>
       <br>
         <br>
       <br>
       <button type="button" id="bttcreate" onclick="add()">Add Product</button>
        <button type="button" id="bttupdate" onclick="update()">Update Product</button>
  
   </div>
   
       </form>
    <script>
        document.getElementById("file").onchange=function(){
           var path = this.value;
           var str = path.split("\\");
           document.getElementById("imagess").value=str[2];
        }        
   
    </script>
      

</fieldset>
    </center>
</body>
</html>