<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="tn.enis.entity.Client"%>
<%@page import="tn.enis.entity.Compte"%>
<%@page import="java.util.*"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">


<link
	href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">




<title>Table des Comptes</title>
<style>
body {
	padding-top: 5rem;
}

.starter-template {
	padding: 3rem 1.5rem;
	text-align: center;
}

table {
	border: 3px solid black;
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

@media ( min-width : 768px) {
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
						<li class="nav-item"><a class="nav-link " href="">Acceuil</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="ClientServlet">Clients</a></li>
						<li class="nav-item"><a class="nav-link active"
							href="CompteServlet">Comptes</a></li>

					</ul>
				</nav>
				<%
				List<Compte> comptes = (List<Compte>) request.getAttribute("comptes");
				List<Client> clients = (List<Client>) request.getAttribute("clients");
				%>

				<div class="card">
					<div class="card-header bg-dark text-white">Gestion des
						Comptes</div>
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<a href="#addCompteModal" class="btn btn-success"
							data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Ajouter
								Compte</span></a>
					</div>

					<div class="card-body">
						<table id="example" class="table table-striped table-bordered"
							style="width: 100%">
							<thead class="thead-light ">
								<tr>
									<th>RIB</th>
									<th>Nom</th>
									<th>Solde</th>
									<th>Delete</th>
									<th>delete-ajax</th>
									<th>Edit</th>

								</tr>
							</thead>
							<%
							for (Compte compte : comptes) {
							%>
							<tr id="<%=compte.getRib()%>">
								<td><%=compte.getRib()%></td>
								<td><%=compte.getClient().getNom() + "  " + compte.getClient().getPrenom()%></td>
								<td><%=compte.getSolde()%></td>
								<td><a
									href="CompteServlet?action=delete&rib=<%=compte.getRib()%>">Delete</a></td>
								<td><a href="javascript:deleteCompte(<%=compte.getRib()%>)">Delete-ajax</a></td>
								<td>
									<form action="CompteServlet" method="POST">
										<input type="hidden" name="rib" value="<%=compte.getRib()%>">
										<input type="submit" name="action" value="edit">
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

	<div id="addCompteModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="CompteServlet?action=add" method="POST">
					<div class="modal-header">
						<h4 class="modal-title">Ajouter Compte</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="form-group ui-widget ">
							<label for="tags">Tags: </label> <input type="text" id="tags"
								class="form-control" name="cin" required>
							<div id="autocomplete-suggestions"></div>
						</div>
						<div class="form-group">
							<label>Solde</label> <input type="number" name="solde"
								class="form-control" required>
						</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal"
							value="Cancel"> <input type="submit" class="btn btn-info"
							value="Ajouter">
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/sweetalert.min.js"></script>
	<script src="js/compte.js"></script>

	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap4.min.jss"></script>
	<script>
	$(document).ready(function () {
	    $('#example').DataTable();
	});
	$(function() {
		
		var accounts = [];
		<%if (clients != null) {
		for (Client client : clients) {%>
		  accounts.push({ label :`<%=client.getNom() + " " + client.getPrenom()%>`, value: `<%=client.getCin()%>`});
	<%}
}%>
		console.log(accounts);
			$("#tags").autocomplete({
				source : accounts,
				minLength : 0,
				appendTo : "#autocomplete-suggestions",
				select : function(event, ui) {
					console.log(ui.item.value);
				}
			});
		});
	</script>
</body>
</html>