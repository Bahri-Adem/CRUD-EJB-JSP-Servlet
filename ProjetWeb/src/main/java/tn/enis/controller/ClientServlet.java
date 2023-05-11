package tn.enis.controller;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/ClientServlet")
public class ClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	ClientService clientService;
	@EJB
	CompteService compteService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if ("add".equals(request.getParameter("action"))) {
			String cin = request.getParameter("cin");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String adresse = request.getParameter("adresse");
			Client client = new Client(cin, nom, prenom, adresse);
			clientService.save(client);
		} else if ("delete".equals(request.getParameter("action"))) {
			String cin = request.getParameter("cin");
			Client c = clientService.find(cin);
			List<Compte> comptes = c.getComptes();
			for (Compte compte : comptes) {
				compteService.remove(compte);
			}
			clientService.delete(clientService.find(cin));
		} else if ("delete-ajax".equals(request.getParameter("action"))) {
			String cin = request.getParameter("cin");
			clientService.delete(cin);
			response.getWriter().print("it is ok");
			return;
		} else if ("edit".equals(request.getParameter("action"))) {
			String cin = request.getParameter("cin");
			request.setAttribute("client", clientService.find(cin));
			request.getRequestDispatcher("edit-client.jsp").forward(request, response);
			return;
		} else if ("update".equals(request.getParameter("action"))) {
			String cin = request.getParameter("cin");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String adresse = request.getParameter("adresse");
			Client client = new Client(cin, nom, prenom, adresse);
			clientService.update(client);
		} else if ("addCompte".equals(request.getParameter("action"))) {
			String cin = request.getParameter("cin");
			Client client = clientService.find(cin);
			float solde = Float.parseFloat(request.getParameter("solde"));
			Compte compte = new Compte(solde, client);
			compteService.save(compte);
		}
		request.setAttribute("clients", clientService.findAll());
		request.getRequestDispatcher("Client.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
