<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="fr.epita.quiz.datamodel.Question"%>
<%@ page import="java.util.List"%>

<%
	List<Question> questionsList = (List<Question>)session.getAttribute("ques");
      session.setAttribute("questionsList", questionsList);
%>

<html>
<head>

<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
	<div class="row">

			<div class="container teax-info">
				<h1 align="center">Java Quiz</h1>
			</div>

					<div class="container" align="left">
				</div>
			<div class="container" align="right">
				<b> <a class="btn"  href="logout.html">LogOut</a></b>
			</div>


	</div>
<br>
	<div class="container">
		<form class="form-horizontal" method="post" action="examServices">
			<table class="table">
				<core:if test="${!empty ques}">
					<%
						int i = 0;
					%>

					<core:forEach var="questionPaperCommand" items="${ques}">
						<input type="hidden" name="question" />
						<input type="hidden" value="${questionPaperCommand.id}"
							name="quesNum[<%=i%>]" />
						<tr>
							<td><core:out value="<%=i + 1%>"></core:out> <core:out
									value="."></core:out> <core:out
									value="${questionPaperCommand.question}"></core:out></td>
						</tr>
						<tr>
							<td><input type="radio" name="ans<%=i%>"
								value="${questionPaperCommand.ans1}"> <core:out
									value="${questionPaperCommand.ans1}"></core:out></td>
						</tr>
						<tr>
							<td><input type="radio" name="ans<%=i%>"
								value="${questionPaperCommand.ans2}"> <core:out
									value="${questionPaperCommand.ans2}"></core:out></td>
						</tr>
						<tr>
							<td><input type="radio" name="ans<%=i%>"
								value="${questionPaperCommand.ans3}"> <core:out
									value="${questionPaperCommand.ans3}"></core:out></td>
						</tr>
						<tr>
							<td><input type="radio" name="ans<%=i%>"
								value="${questionPaperCommand.ans4}"> <core:out
									value="${questionPaperCommand.ans4}"></core:out></td>
						</tr>
						<%
							i++;
						%>
					</core:forEach>
<br>
<div class="col-md-11 submit">
		

		</div>
					
					
					
				</core:if>
				<core:if test="${empty questionPaperList}">
					<tr>
						<td><core:out value="Quiz ends here"></core:out>
						</td>
					</tr>
				</core:if>
				
			</table>
									<button type="submit" class="btn btnn btn-success" value="exam" name="exam">Submit</button>
			
		</form>
		
	</div>
</body>
</html>