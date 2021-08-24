<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adminstrator</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body style="background-image:url('buisness.jpg')">
<%
		if(session.getAttribute("user")==null)
		{
			response.sendRedirect("login.jsp");
		}

		%>
		
		<form action="LogoutServ">
		<input type= "submit" value="LOGOUT">
		</form>
		
	<p style="font-size: 50px; margin-left: 30%; margin-right:30%; text-align:center; color: silver;">Welcome Admin</p>
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-4" data-toggle="modal" data-target="#categoryModal">
				<div class="card">
					<div class="card-body text-center">
						<img src="two.png" class="img-fluid" style="max-width: 150px">
						<h1>Add Category </h1>
					</div>
				</div>
			</div>

			<div class="col-md-4" data-toggle="modal" data-target="#productModal">
				<div class="card">
					<div class="card-body text-center">
						<img src="three.png" class="img-fluid" style="max-width: 150px">
						<h1>Add Product </h1>
					</div>
				</div>
			</div>

			<div class="col-md-4" data-toggle="modal" data-target="#viewModal" action="UserCount">
				<div class="card">
					<div class="card-body text-center">
						<img src="four.png" class="img-fluid" style="max-width: 150px">
						<h1>View Details </h1>
					</div>
				</div>
			</div>
	
	<div class="modal" id="categoryModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="CategoryServlet" method="post">
        <div class="form-group">
        <label>Category Name </label>
		<input type="text" class="form-control" name="cat_name">
        </div>
		
		 <div class="form-group">
        <label>Category Description </label>
		<textarea class="form-control" name="cat_desc" rows="3"></textarea>
        </div>
        <input type="submit" class="btn btn-success"  value="ADD CATEGORY">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<div class="modal" id="productModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Product</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="ProductServlet" method="post" enctype="multipart/form-data">
        <div class="form-group">
        <label>Product Name </label>
		<input type="text" class="form-control" name="prod_name">
        </div>
        
        <div class="form-group">
        <label>Product Price </label>
		<input type="text" class="form-control" name="prod_price">
        </div>
		
		 <div class="form-group">
        <label>Product Description </label>
		<textarea class="form-control" name="prod_desc" rows="3"></textarea>
        </div>
        
        <div class="form-group">
        <label for="exampleFormControlFile1">Upload Product Image</label>
		<input type="file" class="form-control-file" id="exampleFormControlFile1" name="p_img">
        </div>
        
        <input type="submit" class="btn btn-success"  value="ADD Product">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<div class="modal"  tabindex="-1" role="dialog" id="viewModal" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">View Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
      <%String a=(String)request.getAttribute("u_count"); %>
      <%String b=(String)request.getAttribute("c_count"); %>
      <%String c=(String)request.getAttribute("p_count"); %>
      
      <form action="UserCount" method="post">
	      <label>No of users : <%=a %></label> <br>
	      <label>No of categories : <%=b %></label> <br>
	      <label>No of products : <%=c %></label> <br>
		  <input type="submit" value="View Details" style="width: 250px; color: blue;">
	  </form>
     
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>	
</div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>	
</body>
</html>