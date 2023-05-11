<%@page import="tn.enis.entity.Client"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Client</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<body>
	<%
	Client client = (Client) request.getAttribute("client");
	%>

	<div class="modal-dialog">
		<div class="modal-content">
			<form action="ClientServlet" method="POST">
				<div class="modal-header">
					<input type="hidden" name="cin" class="form-control"
						value="<%=client.getCin()%>">
					<h4 class="modal-title">Edit Client</h4>

				</div>
				<div class="modal-body">
					<div class="form-group"></div>
					<div class="form-group">
						<label>Nom</label> <input type="text" name="nom"
							class="form-control" value="<%=client.getNom()%>">
					</div>
					<div class="form-group">
						<label>Prenom</label> <input type="text" name="prenom"
							class="form-control" value="<%=client.getPrenom()%>">
					</div>
					<div class="form-group">
						<label>Adresse</label> <input type="text" name="adresse"
							class="form-control" value="<%=client.getAdresse()%>">
					</div>
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-info" name="action"
						value="update">
				</div>
			</form>
		</div>
	</div>
</body>
</html>