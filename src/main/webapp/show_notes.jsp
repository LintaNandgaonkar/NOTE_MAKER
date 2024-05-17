<%@page import="com.entities.Notes"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file = "all_js.jsp" %>
<title>SHOW NOTES</title>
</head>
<body>
<%@include file = "navbar.jsp" %>

	<div class="container">
  <br>
    <br>
  <h2 class="text-primary text-center">ALL NOTES</h2>
  <div class="row">
  <div class="col-12">
    <%
    Session s = FactoryProvider.getFactory().openSession();
    Query q = s.createQuery("from Notes");
    List<Notes> list  = q.list();
    for(Notes notes : list)
    {
     %>
    <div class="card mt-3 p-2">
    <div class="card-body px-4">
    <img class="card-img-top  mb-4" style="max-width:80px;" src="img/notebook.png"/>
    <h5 class="card-title"><%= notes.getTitle()  %></h5>
    <p class="card-text"> <%=notes.getContent() %></p>
   
    <a href="logout?id=<%= notes.getId()%>" class="btn mr-1 btn-primary">DELETE</a>
    <a href="update_notes.jsp?id=<%= notes.getId() %>" class="btn btn-dark text-white">UPDATE</a>
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