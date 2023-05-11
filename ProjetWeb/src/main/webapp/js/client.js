function deleteClient(cin) {


	swal({
		title: "Are you sure?",
		text: "Once deleted, you will not be able to recover this client!",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
		.then((willDelete) => {
			if (willDelete) {
				$.ajax({
					type: 'GET',
					data: { 'action': 'delete-ajax', 'cin': cin },
					url: "ShopServlet",
					success: function(data) {
						swal("Poof! Your client has been deleted!", {
							icon: "success",
						});
						$('#' + cin).remove();
						$('#total').text(data);
					},
					error: function() {
						alert("failure");
					}
				});
			} else {
				swal("Your client is safe!");
			}
		});



}
