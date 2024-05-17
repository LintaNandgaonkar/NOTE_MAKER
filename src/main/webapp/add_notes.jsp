<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD NOTES</title>
<%@include file = "all_js.jsp" %>
</head>
<body>
<%@include file = "navbar.jsp" %>

<div class="container">
  <br>
  <br>
  <h2 class="text-primary">PLEASE FILL YOUR NOTE DETAILS </h2>
  <br>
  <!-- Form -->
  <form action="login" method="post">
  <div class="form-group">
    <label for="title">NOTE TITLE</label>
    <input name="title" required type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="ENTER HERE">
  </div>
  <div class="form-group">
    <label for="content">NOTE CONTENT</label>
    <textarea name="content" required style="height:200px" class="form-control" id="note-content" placeholder="ENTER YOUR CONTENT HERE "></textarea>
  </div>
  
  <div class="container text-center">  <button type="submit" class="btn btn-primary text-white">ADD</button> </div>
</form>
  </div>
</body>
</html>