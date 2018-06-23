package fr.epita.quiz.web.actions;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.exception.DataException;
import org.springframework.beans.factory.annotation.Autowired;

import fr.epita.quiz.datamodel.IsAdmin;
import fr.epita.quiz.datamodel.Users;
import fr.epita.quiz.services.AuthenticationService;
import fr.epita.quiz.services.UsersDAO;

/**
 * 
 * @author Vaaruni
 *
 */

@WebServlet(urlPatterns = "/login")
public class Login extends SpringServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	AuthenticationService auth;
	@Autowired
	private UsersDAO repository;

	/**
	 * Default constructor.
	 */
	public Login() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		if (request.getParameter("login") != null) {
			final String login = request.getParameter("login");
			final String password = request.getParameter("password");

			List<Users> users = (List<Users>) repository.searchUsers(new Users());
			for (Users user : users) {
				if (user.getUsername().equals(login) && user.getPassword().equals(password)) {
					final boolean authenticated = auth.authenticate(login, password);
					request.getSession().setAttribute("authenticated", authenticated);
					request.getSession().setAttribute("userName", login);
					if (user.getIsAdmin().name().equals(IsAdmin.Admin.name())) {
						response.sendRedirect("question.jsp");
					} else if (user.getIsAdmin().name().equals(IsAdmin.User.name())) {
						response.sendRedirect("selectType.jsp");
					}
				}
			}

		
		} else if (request.getParameter("registerUser") != null) {
			addUser(request, response, IsAdmin.User);
		
		} else {
			request.getRequestDispatcher("Error.jsp").forward(request, response);
			request.getSession().setAttribute("authenticated", false);
		}
	}

	private void addUser(HttpServletRequest request, HttpServletResponse response, IsAdmin isadmin)
			throws ServletException, IOException {
		final Users user = new Users();
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setEmail(request.getParameter("email"));
		user.setIsAdmin(isadmin);
		try {
			repository.create(user);
			response.sendRedirect(request.getContextPath() + "/home.html");

		} catch (DataException e) {
			e.printStackTrace();
		}
	}

}
