package fr.epsi.controller;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.epsi.entity.Idea;
import fr.epsi.service.IIdeaService;

@WebServlet("ideas")
public class IdeasServlet extends HttpServlet{
	@EJB
	private IIdeaService ideaService;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException
	    {	
			if(req.getParameter("action").equals("ideas")) {
				List<Idea> ideas = this.ideaService.getIdeas();
				req.setAttribute("ideas", ideas);
				this.getServletContext().getRequestDispatcher("/WEB-INF/pages/ideasPage.jsp").forward(req, resp);
				
			}else if(req.getParameter("action").equals("add")) {
				List<Idea> ideas = this.ideaService.getIdeas();
				req.setAttribute("ideas", ideas);
				req.setAttribute("message", "Fonctionnalité en construction...");
				this.getServletContext().getRequestDispatcher("/WEB-INF/pages/ideasPage.jsp").forward(req, resp);
				
			}else if(req.getParameter("action").equals("create")) {
				List<Idea> ideas = this.ideaService.getIdeas();
				req.setAttribute("ideas", ideas);
				req.setAttribute("message", "Fonctionnalité en construction...");
				this.getServletContext().getRequestDispatcher("/WEB-INF/pages/ideasPage.jsp").forward(req, resp);
			}
			
	    }
}
