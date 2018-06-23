<%@page import="fr.epita.quiz.datamodel.Users"%>
<%@page import="fr.epita.quiz.services.GenericORMDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	List<Users> usersList = (List<Users>)session.getAttribute("usersList");
   session.removeAttribute("usersList");
%>
<head>
<%
	Boolean auth = (Boolean) session.getAttribute("authenticated");
	if (auth == null || !auth) {
%>

<%
	}
%>
<link rel="stylesheet" href="resources/css/style.css">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
   <div class="container">
		<div>
			
	<div class="row">
		<div class="login">
				<h1 align="center" class="txt"> User List </h1>
			</div>
			</div>
	<div class="container">
		

		<form class="form-horizontal"  method="post" action="modifyUser">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Email</th>
						</tr>
					</thead>
					<tbody>
					   <%
					   	if (usersList == null || usersList.isEmpty()){
					   %>
						  <tr>
						      <td colspan="7">No result</td>
						  </tr>
						   
					   <%
						   					   	} else{
						   					   			   for (Users user : usersList){
						   					   %>
						<tr>
							<td><input name="selection" type="radio" value="<%=user.getId()%>"/></td>
  							<td><%=user.getUsername() %></td>
							<td><%=user.getEmail() %></td> 
	
						</tr>
                        <%} 
                        }%>

					</tbody>
				</table>
			</div>
			
	</form>
	<div class="txt2" align="center" ><a class="btnn btn btn-success href="adminLogin.html">Logout</a>
			</div>
	</div>
</div>
</body>
</html>
