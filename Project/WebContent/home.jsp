<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body style="background-image:url('buisness.jpg')">
		<%
		if(session.getAttribute("user")==null)
		{
			response.sendRedirect("login.jsp");
		}

		%>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          ${user}
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#"><form action="LogoutServ">
		<input type= "submit" value="LOGOUT">
	</form>
	</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

<br>

<div>

<form action="CategoryName" method="post" style="float: left;">
	<input type="submit" value="View Categories" style="width: 300px; color: blue;">
</form>
<form action="ProductName" method="post" style="float: right;">
	<input type="submit" value="View Products" style="width: 300px; color: blue;">
</form>
</div>

<br>
<hr>
<br>

<h1 style="color: white;">Enter Category or Product name and view details :-</h1>
<br>

<div align="center">
<form action="GetCategory" method="post">
	<label style="color: white">Enter Category name :- </label>
	<input type="text" name="cat"/>
	<input type="submit" value="View Details" style="width: 250px; color: blue;">
</form>
</div>

<h2 style="color: white;">Category:-</h2>

<%
	String iname=(String)request.getAttribute("pname");
	String idesc=(String)request.getAttribute("pdesc");
%>

<div align="center">
	<table border="5px" style="width: 600px">
		<tr>
			<th style="color: white">Category name</th>
			<th style="color: white">Category description</th>
		</tr>
		<tr>
			<td style="color: white"><%=iname%></td>
			<td style="color: white"><%=idesc%></td>
		</tr>
	</table>
</div>

<br>
<hr>
<br>

<div align="center">

<form action="GetProduct" method="post">
	<label style="color: white;">Enter product name :- </label>
	<input type="text" name="nam"/>
	<input type="submit" value="View Details" style="width: 250px; color: blue;">
</form>
</div>

<h2 style="color: white;">Product:-</h2>

<%
	String imgname=(String)request.getAttribute("name");
	String imgprice=(String)request.getAttribute("price");
	String imgdesc=(String)request.getAttribute("desc");
	String imgurl=(String)request.getAttribute("image");
%>

<div align="center">
	<table border="5px" style="width: 600px">
		<tr>
			<th style="color: white">name</th>
			<th style="color: white">Price</th>
			<th style="color: white">Description</th>
			<th style="color: white">Image</th>
		</tr>
		<tr>
			<td style="color: white"><%=imgname%></td>
			<td style="color: white"><%=imgprice%></td>
			<td style="color: white"><%=imgdesc%></td>
			<td><img src="C:/Users/prati/workspace/Project/WebContent/img/<%=imgurl%>" style="height: 100px;width: 100px;"></td>
		</tr>
		
	</table>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</body>
</html>