
<%@page import="com.entities.Note"%>
<%@page import="com.factory.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="all_css_js.jsp"%>
<title>Update Notes</title>
</head>
<body>                                                    
	<div class="container-fluid ">                     

		<%@include file="Navbar.jsp"%>                
		<br>  
		<h3>Please Update</h3>
		<%
		 int id=Integer.parseInt(request.getParameter("id"));
		 Session s=FactoryProvider.getFactory().openSession();
		 Note note=s.get(Note.class,id);
		%>
		
		<!--Add Form  -->
		<form action="UpdateServlet" method="get">
		
			<input name="id" value="<%=note.getId() %>" type="hidden"/>
			<div class="form-group">
				<label for="title">Note Title</label> 
				<input required
					name="title"
					type="text" 
					placeholder="enter your title"
					class="form-control"
					id="title"
					value="<%=note.getTitle() %>"
					aria-describedby="title">
			</div>
			<div class="form-group">
				<label for="content">Note Content</label> 
				
				 <textarea id="content" required name="content" 
				
				 class="form-control" a
				 style="height:250px"><%=note.getContent() %>
				 </textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Save you note</button>
			</div>
		</form>
		
	</div> 
</body>
</html>