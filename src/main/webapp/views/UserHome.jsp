<%@page import="java.util.Set"%>
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
	
</head>

<body class="bg-ligth">


<%
String ucheck=(String)session.getAttribute("ucheck");
if(ucheck != null)
{
%>

<!-- nav start -->


<nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><%=ucheck %></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="btn btn-outline-danger btn-sm" href="ulogout" tabindex="-1" aria-disabled="true">Logout</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success " type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

<!-- nav end -->

<%
List<Product> l=(List<Product>) request.getAttribute("lap");
Set<String> soc=(Set<String>) request.getAttribute("soc");
%>
<section class="container-fluid mt-5">
<%
if(soc != null)
{
	for(String cat:soc)
	{
	%>
	<h1 class="display-5"><%=cat.toUpperCase() %></h1>
	<hr class="border border-danger opacity-50">
	<div class="row g-3 mb-5">
	<% 
		for(Product p: l)
		{
			if(p.getPcat().equals(cat))
			{
			%>
				
					<div class="col-md-3">
						<div class="border p-3 rounded-3">
							<h4 ><%=p.getPname() %></h4>
							<img width="200" alt="loading..." src="/images/<%=p.getPimagename()%>">
							<p><%=p.getPdes() %></p>
							<p><b>Price :</b> <%=p.getPprice() %>Rs</p>
							<form action="#" method="post">
								<button class="btn btn-sm btn-outline-info">Add to Cart</button>
							</form>
						</div>
					</div>
				
			<% 
			}
		}
	%>
	</div>
	<%
		
	}
}
%>
</section>
















































<%
}
else
{
	response.sendRedirect("UserLogin");
}
%>
</body>
</html>