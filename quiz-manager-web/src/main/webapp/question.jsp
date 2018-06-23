<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>

<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
</head>
<body>

		
			
	<div class="row">
		<div class="login">
				<h1 align="center" class="txt"> Add a Question </h1>
			</div>
			</div>
			<div class="txt2" align="center" ><a class="btnn btn btn-success" href="<%=request.getContextPath() %>/questionList">List of Questions</a>
					
			<a class="btnn btn btn-success" href="adminLogin.html">Logout</a>
			</div>
			
		<form action="editQuestion" method="post">
			<div class="form-group row">
				<label for="quizTitle" class="col-sm-2 col-form-label">Quiz
					Name</label>
				<div class="col-sm-10">
					<textarea type="text" class="form-control" id="quizTitle"
						name="quizTitle"
						placeholder="Please provide the name of Quiz under this question will populate"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label for="question" class="col-sm-2 col-form-label">Question
					Title</label>
				<div class="col-sm-10">
					<textarea type="text" class="form-control" id="question"
						name="question" placeholder="Your question here"></textarea>
				</div>
			</div>
			<fieldset class="form-group">
				<div class="row">
					<legend class="col-form-label col-sm-2 pt-0">Options</legend>
					<div class="col-sm-10"> 
						<div class="form-check" style="padding-left: 0em;padding-bottom:5px;"> Option 1
							<input class="form-control" type="text" name="ans1"
								id="ans1" >
						</div>
						<div class="form-check" style="padding-left: 0em;padding-bottom:5px;"> Option 2
							<input class="form-control" type="text" name="ans2"
								id="ans2" >
						</div>
						<div class="form-check" style="padding-left: 0em;padding-bottom:5px;"> Option 3
							<input class="form-control" type="text" name="ans3"
								id="ans3" >
						</div>
						<div class="form-check" style="padding-left: 0em;padding-bottom:5px;"> Option 4
							<input class="form-control" type="text" name="ans4"
								id="ans4" >
						</div>
					</div>
			</fieldset>

			<div class="form-group row">
				<label for="answer" class="col-sm-2 col-form-label">Correct
					Answer</label>
				<div class="col-sm-10">
					<select class="form-control" id="answer" name="answer">
						<option>Please Select An Answer</option>
						<option value="ans1">Option 1</option>
						<option value="ans2">Option 2</option>
						<option value="ans3">Option 3</option>
						<option value="ans4">Option 4</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-12" align="center">
					<button type="submit" class="btn btn-success">Validate</button>
				</div>
			</div>
	

	

	</form>
	</div>

</body>
</html>