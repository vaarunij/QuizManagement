<%@page import="fr.epita.quiz.datamodel.Question"%>
<%@page import="fr.epita.quiz.services.GenericORMDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<%
	List<Question> questionsList = (List<Question>)session.getAttribute("questionsList");
   session.removeAttribute("questionsList");
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
			<div class="row">
		<div class="login">
				<h1 align="center" class="txt"> Question List </h1>
			</div>
			</div>

	<div class="container">
		

		<form class="form-horizontal"  method="post" action="modifyQuestion">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Question</th>
							<th>Answer 1</th>
							<th>Answer 2</th>
							<th>Answer 3</th>
							<th>Answer 4</th>
							<th>Answer</th>
						</tr>
					</thead>
					<tbody>
					   <%
					   	if (questionsList == null || questionsList.isEmpty()){
					   %>
						  <tr>
						      <td colspan="7">No result</td>
						  </tr>
						   
					   <%
						   					   	} else{
						   					   			   for (Question id : questionsList){
						   					   %>
						<tr>
							<td><input name="selection" type="radio" value="<%=id.getId()%>"/></td>
								
  							<td><%=id.getQuestion() %></td>
							<td><%=id.getAns1() %></td> 
							<td><%=id.getAns2() %></td>
							<td><%=id.getAns3() %></td>
							<td><%=id.getAns4() %></td>
							<td><%=id.getAnswer() %></td>
						</tr>
                        <%} 
                        }%>

					</tbody>
				</table>
			</div>
			<div class="form-group" align="center">
				<div class=" col-sm-offset-2 col-sm-10 text-right">
					<button type="submit" style="margin-right: 30px"class="btn btn-success" value="Delete" name="delete">Delete</button>
					
					<button type="submit" style="margin-right: 30px" class="btn btn-success" value="Modify" name="modify">Modify</button>
									</div>
	</div>
	</form>
	
	<div class="txt2" align="center" ><a class="btnn btn btn-success" href="<%=request.getContextPath() %>/usersService">List of Users</a>
	
					
				<a class="btnn btn btn-success" href="question.jsp">Add New Question</a>
			<a class="btnn btn btn-success" href="adminLogin.html">Logout</a>
			</div>
			</div>
	
	
					
			
	</div>
</div>
</body>
</html>
