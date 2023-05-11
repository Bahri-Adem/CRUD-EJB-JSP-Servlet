<%@page import="tn.enis.entity.Compte"%>
<%@page import="tn.enis.entity.Client"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Compte</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<%
	Compte compte = (Compte) request.getAttribute("compte");
	%>
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="CompteServlet" method="POST">
				<input type="hidden" name="rib" value="<%=compte.getRib()%>">
				<input type="hidden" class="form-control" name="cin"
					value="<%=compte.getClient().getCin()%>">
				<div class="modal-header">
					<h4 class="modal-title">edit Compte</h4>

				</div>
				<div class="modal-body">




					<div class="form-group">
						<label>Solde</label> <input type="number" name="solde"
							class="form-control" value="<%=compte.getSolde()%>">
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