package fr.epita.quiz.web.services.user;

import java.io.IOException;
import java.util.List;

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
@WebServlet(urlPatterns = "/examServices")
public class ExamServices extends SpringServlet {
	private static final long serialVersionUID = 1L;
	@Autowired
	AddQuestionDAO repository;

	public ExamServices() {
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("mcq") != null) {
			final Question question = new Question();
			question.setType(QuestionType.MCQ);
			List<Question> ques = repository.getQuizTitle(question);
			request.getSession().setAttribute("ques", ques);
			response.sendRedirect("selectQuiz.jsp");
		} else if (request.getParameter("quizTitle") != null) {
			final Question question = new Question();
			question.setQuizTitle(request.getParameter("selection"));
			List<Question> ques = repository.getQuestions(question);
			request.getSession().setAttribute("ques", ques);
			response.sendRedirect("createExam.jsp");
		}
		else if (request.getParameter("exam") != null){
			final Question question = new Question();
			List<Question> questionsList=(List<Question>) request.getSession().getAttribute("questionsList");
			int answer=0;
			for(int i=0; i< request.getParameterValues("question").length; i++)
			{
				if (request.getParameter("quesNum[" + i + "]") != null
						&& request.getParameter("ans" + i ) != null) {
					int questionId = Integer.parseInt(request.getParameter("quesNum[" + i + "]"));
					String ansSelected = request.getParameter("ans" + i );
					for (Question id : questionsList){
						System.out.println(ansSelected);
						System.out.println(id.getAnswer());

						int comp = ansSelected.compareTo(id.getAnswer());
						if (comp == 0) {
							answer++;
						}
					}
			      
			}
			
			
			

		}
	request.getSession().setAttribute("answer", answer);
		request.getSession().setAttribute("questions", request.getParameterValues("question").length);
		request.getSession().setAttribute("incorrect", (request.getParameterValues("question").length)-answer);
			response.sendRedirect("quizResult.jsp");

	}
}
}