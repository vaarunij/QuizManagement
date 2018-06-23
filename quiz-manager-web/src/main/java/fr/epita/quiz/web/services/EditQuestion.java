package fr.epita.quiz.web.services;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fr.epita.quiz.datamodel.Question;
import fr.epita.quiz.datamodel.QuestionType;
import fr.epita.quiz.services.AddQuestionDAO;
import fr.epita.quiz.web.actions.SpringServlet;

/**
 * 
 * @author Vaaruni
 *
 */
@Service
@Transactional
@WebServlet(urlPatterns = "/editQuestion")
public class EditQuestion extends SpringServlet {
	private static final long serialVersionUID = 1L;
	@Autowired
	private AddQuestionDAO repository;

	public EditQuestion() {
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String question = request.getParameter("question");
		System.out.println(question);
		final Question addQuestion = new Question();
		addQuestion.setQuestion(request.getParameter("question"));
		String correctAnswer = request.getParameter("answer");
		addQuestion.setAns1(request.getParameter("ans1"));
		addQuestion.setAns2(request.getParameter("ans2"));
		addQuestion.setAns3(request.getParameter("ans3"));
		addQuestion.setAns4(request.getParameter("ans4"));
		addQuestion.setAnswer(request.getParameter(correctAnswer));
		addQuestion.setQuizTitle(request.getParameter("quizTitle"));
		addQuestion.setType(QuestionType.MCQ);
		repository.create(addQuestion);
		response.sendRedirect("questionList");

	}

}
