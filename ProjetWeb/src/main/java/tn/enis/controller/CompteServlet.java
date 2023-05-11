package tn.enis.controller;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tn.enis.entity.Client;
import tn.enis.entity.Compte;
import tn.enis.service.ClientService;
import tn.enis.service.CompteService;

@WebServlet("/CompteServlet")
public class CompteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	CompteService compteService;
	@EJB
	ClientService clientService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if ("add".equals(request.getParameter("action"))) {
			String cin = request.getParameter("cin");
			float solde = Float.parseFloat(request.getParameter("solde"));
			Client client = clientService.find(cin);
			Compte compte = new Compte(solde, client);
			compteService.save(compte);
		} else if ("delete".equals(request.getParameter("action"))) {
			System.out.println("deelete ");
			long rib = Long.parseLong(request.getParameter("rib"));
			compteService.remove(compteService.find(rib));
		} else if ("delete-ajax".equals(request.getParameter("action"))) {
			long rib = Long.parseLong(request.getParameter("rib"));
			compteService.remove(rib);
			response.getWriter().print("it is ok");
			return;

		} else if ("edit".equals(request.getParameter("action"))) {
			long rib = Long.parseLong(request.getParameter("rib"));
			request.setAttribute("compte", compteService.find(rib));
			request.getRequestDispatcher("edit-compte.jsp").forward(request, response);
			return;
		} else if ("update".equals(request.getParameter("action"))) {
			long rib = Long.parseLong(request.getParameter("rib"));
			String cin = request.getParameter("cin");
			float solde = Float.parseFloat(request.getParameter("solde"));
			Client client = clientService.find(cin);
			Compte compte = new Compte(rib, solde, client);
			compteService.update(compte);
		}
		request.setAttribute("comptes", compteService.findAll());
		request.setAttribute("clients", clientService.findAll());
		request.getRequestDispatcher("Compte.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
