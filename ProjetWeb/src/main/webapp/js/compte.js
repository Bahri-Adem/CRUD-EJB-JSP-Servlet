function deleteCompte(rib) {


	swal({
		title: "Are you sure?",
		text: "Once deleted, you will not be able to recover this account!",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
		.then((willDelete) => {
			if (willDelete) {
				$.ajax({
					type: 'GET',
					data: { 'action': 'delete-ajax', 'rib': rib },
					url: "CompteServlet",
					success: function() {
						swal("Poof! Your account has been deleted!", {
							icon: "success",
						});
						$('#' + rib).remove();
					//$('#total').text(data);
					},
					error: function() {
						alert("failure");
					}
				});
			} else {
				swal("Your account is safe!");
			}
		});



}