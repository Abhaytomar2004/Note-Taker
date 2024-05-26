<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List"%>
<%@page import="org.hibernate.query.*"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
<div class="container">
		<%@include file="navbar.jsp"%>
		<h1>Edit your note</h1>
		<br>
		<h1 class="text-uppercase">This edit page </h1>
		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s= FactoryProvider.getFactory().openSession();
		Note note = (Note)s.get(Note.class , noteId);
		%>
		<form action="UpdateServlet" method="post">
		<input value ="<%= note.getId()%>" name="noteId" type="hidden"/>

			<div class="form-group">
				<label for="title">Note title</label> 
				<input 
				name="title"
				required 
				type="text"
				class="form-control" 
				id="title" 
				aria-describedby="emailHelp"
				placeholder="Enter here" 
				value="<%= note.getTitle() %>"
				/>
				

			</div>


			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea 
				name="content"
				required 
				id="content"
				placeholder="Enter your content here"				 
				class="form-control" 
				style="height: 300px;"		
					value="<%= note.getContent() %>">
					</textarea>


			</div>

			<div class="container text-center">

				<button type="submit" class="btn btn-success">Save your Note </button>
			</div>

		</form>
		
</div>

</body>
</html>