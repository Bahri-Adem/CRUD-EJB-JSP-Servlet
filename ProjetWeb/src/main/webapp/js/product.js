function deleteProduct(index) {


	swal({
		title: "Are you sure?",
		text: "Once deleted, you will not be able to recover this product!",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
		.then((willDelete) => {
			if (willDelete) {
				$.ajax({
					type: 'GET',
					data: { 'action': 'delete-ajax', 'index': index },
					url: "ShopServlet",
					success: function(data) {
						swal("Poof! Your product has been deleted!", {
							icon: "success",
						});
						$('#' + index).remove();
						$('#total').text(data);
					},
					error: function() {
						alert("failure");
					}
				});
			} else {
				swal("Your product is safe!");
			}
		});



}
