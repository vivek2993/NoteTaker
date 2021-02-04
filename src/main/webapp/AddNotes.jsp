
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_css_js.jsp"%>
<title>Add Notes</title>
</head>
<body>
	<div class="container-fluid ">

		<%@include file="Navbar.jsp"%>
		<br>
		<h3>Please add your note</h3>

		<!--Add Form  -->
		<form action="NoteSaveServlet" method="post">
		
			<div class="form-group">
				<label for="title">Note Title</label> 
				<input required
					name="title"
					type="text" 
					placeholder="Enter your title"
					class="form-control"
					id="title"
					aria-describedby="title">
			</div>
			<div class="form-group">
				<label for="content">Note Content</label> 
				<textarea required
				  name="content"
				  id="content"
				  class="form-control" 
				  placeholder="Enter content" 
				  style="height:250px"></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>
	</div>

</body>
</html>