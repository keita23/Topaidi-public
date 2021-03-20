package fr.epsi.controller;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.epsi.model.BuzzIdeaModel;
import fr.epsi.service.IIdeaService;

@WebServlet("buzz")
public class BuzzServlet extends HttpServlet{
	@EJB
	private IIdeaService ideaService;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException
	    {
			List<BuzzIdeaModel> buzzIdeasModel = this.ideaService.getBuzzIdeas();
		   req.setAttribute("buzzIdeasModel", buzzIdeasModel);
		   this.getServletContext().getRequestDispatcher("/WEB-INF/pages/buzzPage.jsp").forward(req, resp);
	    }
}
