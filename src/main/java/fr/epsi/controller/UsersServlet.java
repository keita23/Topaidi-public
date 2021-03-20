package fr.epsi.controller;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.epsi.entity.User;
import fr.epsi.service.IUserService;

@WebServlet("users")
public class UsersServlet extends HttpServlet{
	@EJB
	private IUserService userService;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException
	    {
			if (req.getParameter("action").equals("users")) {
				List<User> users = this.userService.getUsers();
				   req.setAttribute("users", users);
				   this.getServletContext().getRequestDispatcher("/WEB-INF/pages/usersPage.jsp").forward(req, resp);
				   
			}else if(req.getParameter("action").equals("create")) {
				List<User> users = this.userService.getUsers();
				   req.setAttribute("users", users);
				   
				   this.getServletContext().getRequestDispatcher("/WEB-INF/pages/subscribeUserPage.jsp").forward(req, resp);
			}
	    }
}
