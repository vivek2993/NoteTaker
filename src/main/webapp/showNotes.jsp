<!doctype html>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.factory.FactoryProvider"%>
<%@page import="com.entities.*"%>

<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>Note Taker</title>

<%@include file="all_css_js.jsp"%>
</head>
<body>

	<div class="container-fluid p-0 m-0">

		<%@include file="Navbar.jsp"%>
		<br>
		<h1>Show Notes</h1>
		<div class="row">

			<div class="col-12">
				<%
					SessionFactory factory = FactoryProvider.getFactory();
					Session s = factory.openSession();
					Query q = s.createQuery("from Note");

					List<Note> list = q.list();
					for (Note note : list) {
				%>

				<div class="card mt-3">

					<div class="card-body">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>
						<p><b class="text-primary"><%=note.getAddedDate() %></b></p>
						<a href="Delete?id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
						<a href="Update.jsp?id=<%=note.getId()%>" class="btn btn-primary">Update</a>
					</div>
				</div>
				<%
					}

					s.close();
				%>
			</div>

		</div>



	</div>
</body>
</html>