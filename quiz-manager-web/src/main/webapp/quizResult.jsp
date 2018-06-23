<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="fr.epita.quiz.datamodel.Question"%>
<%@ page import="java.util.List"%>

<html>

<head>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet"	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
</head>
<body>
 <h1 align="center" >Paper Result </h1>
 <hr width=600 >
<div class="login" align="left" >
  <%if(session.getAttribute("userName")!=null){ %>
    Welcome to your result :<% out.print(session.getAttribute("userName"));%>
  <%} %>&nbsp;
  <a float="right" class="btn btnn btn-success" href="studentLogin.html" >LogOut</a> 
</div>
 <table align="center" >
   <% int i=0; %> 
  
  
  
  <tr>
    <td><core:out value="Result"></core:out></td>   
  </tr>
  <tr>
    <td colspan="2">
        <core:out value="Total Question"></core:out>
        <core:out value="${questions}"></core:out>
    </td>   
  </tr>
  <tr>
    <td colspan="2" >
        <core:out value="Result Marks"></core:out>
        <core:out value="${answer}"></core:out>
    </td>   
  </tr>
  <tr>
    <td colspan="2" >
       <core:out value="Number of right answer : "></core:out>
       <core:out value="${answer}"></core:out>
   </td>   
  </tr>
  <tr>
    <td colspan="2" >
      <core:out value="Number of wrong answer : "></core:out>
      <core:out value="${wrong}"></core:out>
    </td>   
  </tr>
</table>
</body>
</html>