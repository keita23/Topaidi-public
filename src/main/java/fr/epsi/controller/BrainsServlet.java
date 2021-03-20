package fr.epsi.controller;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.epsi.model.UserModel;
import fr.epsi.service.IUserService;

@WebServlet("brains")
public class BrainsServlet extends HttpServlet{
	@EJB
	private IUserService userService;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException
	    {
			List<UserModel> usersModel = this.userService.getBrains();
		   req.setAttribute("usersModel", usersModel);
		   this.getServletContext().getRequestDispatcher("/WEB-INF/pages/brainsPage.jsp").forward(req, resp);
	    }
}
