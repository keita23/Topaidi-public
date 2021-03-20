package fr.epsi.controller;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.epsi.model.IdeaModel;
import fr.epsi.service.IIdeaService;

@WebServlet("/")
public class HomeServlet extends HttpServlet{
	@EJB
	private IIdeaService ideaService;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException
	    {
			List<IdeaModel> ideasModel = this.ideaService.getTopsIdeas();
		   req.setAttribute("ideasModel", ideasModel);
		   this.getServletContext().getRequestDispatcher("/WEB-INF/pages/homePage.jsp").forward(req, resp);
	    }
}
