package com.vit.JavaEE.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.vit.JavaEE.dao.ProductDAO;
import com.vit.JavaEE.dao.UserDAO;
import com.vit.JavaEE.model.Product;
import com.vit.JavaEE.model.User;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDAO userDAO;

	@Override
	public void init() throws ServletException {
		userDAO = new UserDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();

		User user = userDAO.authenticateUser(email, password);
		System.out.println("user : " + user.getEmail());
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			User usr = (User) request.getSession().getAttribute("user");
			response.sendRedirect("ProductServlet?action=list");
		} else {
			request.setAttribute("errorMessage", "Invalid email or password");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
