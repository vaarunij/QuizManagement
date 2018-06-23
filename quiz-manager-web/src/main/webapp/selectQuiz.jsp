<%@page import="fr.epita.quiz.datamodel.Question"%>
<%@page import="fr.epita.quiz.services.GenericORMDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	List<String> ques = (List<String>)session.getAttribute("ques");
   session.removeAttribute("ques");
%>
<head>
<%
	Boolean auth = (Boolean) session.getAttribute("authenticated");
	if (auth == null || !auth) {
%>
<meta http-equiv="refresh" content="0; URL=home.html">
<%
	}
%>

<link rel="stylesheet" href="resources/css/style.css">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
   <div class="container">
		<div class="row">
		<div class="login">
				<h1 align="center" class="txt"> Quiz List </h1>
			</div>
			</div>

	<div class="container">
		

		<form class="form-horizontal"  method="post" action="examServices">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>Select</th>
							<th>Quiz Name</th>
							
						</tr>
					</thead>
					<tbody>
					   <%
					   	if (ques == null || ques.isEmpty()){
					   %>
						  <tr>
						      <td colspan="3">No result</td>
						  </tr>
						   
					   <%
						   					   	} else{
						   					   			   for (String quest : ques){
						   					   %>
						<tr>
 							<td><input name="selection" type="radio" value="<%=quest.toString()%>"/></td>
 							<%-- <td> <label for="id" name="id" id="id" value="<%=id.getId() %>"><%=id.getId() %></label></td> --%>
<%-- 							<td><%=id.getId() %></td>
 --%>							
  							<td><%=quest.toString() %></td>
						</tr>
                        <%} 
                        }%>

					</tbody>
				</table>
			</div>
			<div class="form-group">
				<div class=" col-sm-offset-2 col-sm-10 text-right">
					
					<button type="submit" class="btn btnn btn-success" value="quizTitle" name="quizTitle">Select</button>
				</div>
	</div>
	</form>
	</div>

</body>
</html>
