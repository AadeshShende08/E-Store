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
</head>
<body class="bg-light">

<%
String msg=(String)request.getAttribute("msg");
if(msg != null)
{
%>
<h3 class="text-center text-danger"><%=msg %></h3>
<%} %>
	<section class="container w-50 border rounded-5 bg-white p-5"
		style="margin-top: 4rem">
		<h1 class="text-center fs-5 text-danger">Admin SignUp</h1>
		<form action="asignup" method="post">
			<div class="row g-3">
				<div class="col-md-12">
					<div>
						<label for="uname" class="form-label">Enter Username</label> <input
							type="text" name="uname" id="uname" class="form-control">
					</div>
				</div>
				<div class="col-md-12">
					<div>
						<label for="upass" class="form-label">Enter Password</label> <input
							type="password" name="upass" id="upass" class="form-control">
					</div>
				</div>
				<div class="col-md-12">
					<div>
						<label for="uphone" class="form-label">Enter Phone no</label> <input
							type="text" name="uphone" id="uphone" class="form-control">
					</div>
				</div>
				<div class="offset-md-5 col-md-6">
					<div>
						<button class="btn btn-success">SignUp</button>
					</div>
				</div>
		</form>
		<div class="col-md-12">
			<div>
				<p class="form-text">Already SignUp?</p>
				<a class="btn btn-danger" href="xyz">Login</a>
			</div>
		</div>
		</div>

	</section>

</body>
</html>










