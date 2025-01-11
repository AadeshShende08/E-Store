<%@page import="com.MainApp.Entity.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
	
<style type="text/css">
#box{
display: none;
position: relative;
}

#close{
position: absolute;
top: 0px;
right: 0px;
margin: 2rem;
}
</style>
</head>
<body class="bg-light">

	<%
	String acheck = (String) session.getAttribute("acheck");
	if (acheck != null) {
	%>

<!-- nav start -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary shadow-sm">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><%=acheck %></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a href="alogout" class="btn btn-outline-danger btn-sm"
						aria-disabled="true" role="button">Logout</a></li>
				</ul>
				<form  class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>


<!-- nav end -->


<!-- add product start -->
<button onclick="openbox()" class="btn btn-outline-danger btn-sm m-5">Add Products</button>


<%
Product p1=(Product) request.getAttribute("p");
if(p1 == null)
{
	p1=new Product();
	p1.setPcat("");
	p1.setPdes("");
	p1.setPname("");
	p1.setPprice("");
	p1.setPunit("");
}
%>


<%
if(!p1.getPcat().equals(""))
{
%>
<section id="box" class="container w-50 border rounded-5 p-5 bg-white" style="display: block;">
<%
}
else
{
%>
<section id="box" class="container w-50 border rounded-5 p-5 bg-white" style="display: none;">
<%
}
%>

	
	<button id="close" onclick="closebox()" class="btn-close btn btn-danger	"></button>
	<form action="addproduct" enctype="multipart/form-data" method="post">
		<div class="row g-3">
			<div class="col-md-6">
				<div>
					<label class="form-label" for="pname">Enter Product Name</label>
					<input value="<%=p1.getPname() %>"  type="text" name="pname" class="form-control form-control-sm" id="pname">
				</div>
			</div>
			<div class="col-md-6">
				<div>
					<label class="form-label" for="punit">Enter Total Units</label>
					<input value="<%=p1.getPunit() %>"  type="text" name="punit" class="form-control form-control-sm" id="punit">
				</div>
			</div>
			<div class="col-md-6">
				<div>
					<label class="form-label" for="pcat">Enter Product Category</label>
					<input value="<%=p1.getPcat() %>" type="text" name="pcat" class="form-control form-control-sm" id="pcat">
				</div>
			</div>
			<div class="col-md-6">
				<div>
					<label class="form-label" for="pprice">Enter Product Price</label>
					<input value="<%=p1.getPprice() %>"  type="text" name="pprice" class="form-control form-control-sm" id="pprice">
				</div>
			</div>
			<div class="col-md-12">
				<div>
					<label class="form-label" for="pimage">Upload Product Image</label>
					<input type="file" name="pimage" class="form-control form-control-sm" id="pimage">
				</div>
			</div>
			<div class="col-md-12">
				<div>
					<label class="form-label" for="pdes">Enter product Description</label>
					<textarea rows="" cols="" name="pdes" class="form-control form-control-sm"><%=p1.getPdes() %></textarea>
				</div>
			</div>
			<div class="offset-md-5 col-md-6">
				<div>
					<button class="btn btn-success">Add</button>
				</div>
			</div>
		</div>
		<input type="hidden" name="aname" value="<%=acheck%>">
		<%
		if(p1 != null)
		{
		%>
		<input type="hidden" name="pid" value="<%=p1.getPid()%>">
		<%
		}
		%>
	</form>

</section>


<!-- add product end -->

<%
List<Product> l=(List<Product>) request.getAttribute("lp");
%>


<section class="container mt-5">

	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>Name</th>
				<th>Units</th>
				<th>Category</th>
				<th>Price</th>
				<th>Image</th>
				<th>Description</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>
		
		<tbody>	
			<%
			if(l.size() > 0)
			{
				for(Product p: l)
				{
			%>
					<tr>
					<td><%=p.getPname() %></td>
					<td><%=p.getPunit() %></td>
					<td><%=p.getPcat() %></td>
					<td><%=p.getPprice() %></td>
					<td>
						<img width="100" src="/images/<%=p.getPimagename() %>" alt="loading...">
					</td>
					<td><%=p.getPdes() %></td>
					<td>
						<form action="editproduct" method="post">
							<input type="hidden" name="aname" value="<%=acheck%>">
							<input type="hidden" name="pid" value="<%=p.getPid()%>">
							<button class="btn btn-outline-danger btn-sm">Edit</button>
						</form>
					</td>
					<td>
						<form action="deleteproduct" method="post">
							<input type="hidden" name="aname" value="<%=acheck%>">
							<input type="hidden" name="pid" value="<%=p.getPid()%>">
							<button class="btn btn-danger btn-sm">Delete</button>
						</form>
					</td>
					</tr>
			<% 		
				}
			}
			else
			{
			%>
					<tr>
						<td colspan="8">Add Products</td>
					</tr>
			<% 
			}
			%>
		</tbody>
		
	</table>

</section>























<script type="text/javascript">
function openbox()
{
	document.getElementById("box").style.display="block";
}
function closebox()
{
	document.getElementById("box").style.display="none";
}
</script>




	<%
	} else {
	response.sendRedirect("/views/AdminLogin.jsp");
	}
	%>

</body>
</html>










