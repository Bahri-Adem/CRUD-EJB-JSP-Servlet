<%@page import="javax.ejb.EJB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="tn.enis.service.CompteService"%>
<%@page import="tn.enis.entity.Client"%>
<%@page import="tn.enis.entity.Compte"%>
<%@page import="java.util.*"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.101.0">
    <title>Client</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/starter-template/">
<link href="include/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link
	href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css'
	rel='stylesheet'>

  <title>Table des Clients</title>
  <style>
    body {
  padding-top: 5rem;
}
.starter-template {
  padding: 3rem 1.5rem;
  text-align: center;
}

    table{
    border:3px solid black;
}
th, td {
    border-style: groove;
}
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }
  </style>
</head>

<body>
  <div class="container">
    <div class="row">
      <div class="col">
      <nav class="navbar navbar-expand-sm bg-light navbar-light">
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link " href="">Acceuil</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" href="ClientServlet">Clients</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="CompteServlet">Comptes</a>
        </li>
    </ul>
</nav>
      	<%
		List<Client> clients = (List<Client>) request.getAttribute("clients");
		%>
      <div class="card">
	<div class="card-header bg-dark text-white">
		Gestion des Clients
	</div>
	<div class="card-body">
		<table class="table">
			<thead class="thead-light ">
				<tr>
					<th>Cin</th>
					<th>Nom</th>
					<th>Prenom</th>
					<th>Adresse</th>
					<th>Comptes</th>
					<th>Delete</th>
					<th>delete-ajax</th>
					<th>Edit</th>
					<th>
						<a href="#addClientModal" class="btn btn-success" data-toggle="modal"><i
						class="material-icons">&#xE147;</i> <span>Ajouter Client</span></a>
					</th>
				</tr>
			</thead>
			<%
				for (Client client : clients) {
			%>
				<tr>
				<td><%=client.getCin()%></td>
				<td><%=client.getNom()%></td>
				<td><%=client.getPrenom()%></td>
				<td><%=client.getAdresse()%></td>
				<td>
					<button type="button" class="btn btn-primary"
						data-toggle="modal" data-target="#ModalShow<%=client.getCin() %>">
						<i class="fa fa-list"></i>
					</button>
					<div class="modal" id="ModalShow<%=client.getCin() %>"
						tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-body">
									<table class="table table-bordered table-striped"
										style="color: black; font-weight: bold;">
										<tr>
												<th>Rib</th>
												<th>Solde</th>
											</tr>
											<% List<Compte> comptes =client.getComptes();%>
										<%
											for (Compte compte : comptes) {
										%>
											<tr>
											<td><%=compte.getRib()%></td>
											<td><%=compte.getSolde()%></td>
											</tr>
										<%
										}
										%>
									</table>
								</div>
								<div class="modal-footer">
									<a href="#addCompteModal<%=client.getCin()%>" class="btn btn-outline-success waves-effect" data-toggle="modal">
									 <span>Ajouter Compte</span></a>
									 	<div id="addCompteModal<%=client.getCin()%>" class="modal fade">
											<div class="modal-dialog">
												<div class="modal-content">
													<form action="ClientServlet?action=addCompte&cin=<%=client.getCin()%>" method="POST">
														<div class="modal-header">
															<h4 class="modal-title">Ajouter Compte</h4>
															<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
														</div>
														<div class="modal-body">
															<div class="form-group">
																<label>Solde</label>
																<input type="number" name="solde" class="form-control" required>
															</div>
														</div>
														<div class="modal-footer">
															<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
															<input type="submit" class="btn btn-info" value="ADD">
														</div>
													</form>
												</div>
											</div>
										</div>
									<button type="button"
										class="btn btn-outline-danger waves-effect"
										data-dismiss="modal">Fermer</button>

								</div>
							</div>
						</div>
					</div>
			</td>
				<td><a href="ClientServlet?action=delete&cin=<%=client.getCin()%>">Delete</a></td>
				<td><a href="javascript:deleteClient(<%=client.getCin()%>)">Delete-ajax</a></td>
				<td>
					<form action="ClientServlet" method="POST">
						<input type="hidden" name="cin" value="<%=client.getCin()%>"> <input
							type="submit" name="action" value="edit">
					</form>
				</td>
				
			</tr>
			<%
			}
			%>
		</table>
	</div>
</div>
      
      
       </div>
 </div>
 </div>
 	<div id="addClientModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="ClientServlet?action=add" method="POST">
					<div class="modal-header">
						<h4 class="modal-title">Ajouter Client</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Cin</label>
							<input type="number" name="cin" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Nom</label>
							<input type="text" name="nom" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Prenom</label>
							<input type="text" name="prenom" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Adresse</label>
							<input type="text" name="adresse" class="form-control" required>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
						<input type="submit" class="btn btn-info" value="ADD">
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.6.4.min.js"></script>
	<script src="js/sweetalert.min.js"></script>
	<script src="js/client.js"></script>
 <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
 <script>
   window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')
 </script>
 <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
 <script src="inc/dashboard.js"></script>
 </body>

 </html>