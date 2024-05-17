<%@page import="com.entities.Notes"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UPDATE NOTES</title>
<%@include file="all_js.jsp"%>
</head>
<body>
<%@ include file="navbar.jsp"%>
 <div class="container">
   <br>
     <br>
  <h4 class="text-primary">EDIT CAREFULLY</h4>

  <%
  int id  = Integer.parseInt(request.getParameter("id"));
  Session s = FactoryProvider.getFactory().openSession();
  Notes note = s.get(Notes.class, id);
  %>  
  <!-- Form -->
  <form action="update" method="post">
  
  <input value="<%= note.getId() %>" name="id" type="hidden" />
  <div class="form-group">
    <label for="title">NOTE TITLE</label>
    <input value="<%= note.getTitle().toUpperCase()%>"name="titleupdate" required type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="ENTER HERE">
  </div>
  <div class="form-group">
    <label for="content">NOTE CONTENT</label>
    <textarea name="contentupdate" required style="height:200px" class="form-control" id="note-content" placeholder="ENTER YOUR CONTENT HERE "><%= note.getContent() %></textarea>
    
    
  </div>
  
  <div class="container text-center">  <button type="submit" class="btn btn-primary text-white">SAVE</button> </div>
</form>
 
  
  
  
  
  
  </div>

</body>
</html>