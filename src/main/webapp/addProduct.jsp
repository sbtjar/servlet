

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Add Product</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	body {
		background-color: #f8f9fa;
		padding: 20px;
	}
	
	h1 {
		color: #343a40;
		margin-bottom: 20px;
	}
	
	.container {
		background-color: white;
		border-radius: 8px;
		box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
		padding: 30px;
	}
	
	.btn-primary {
		background-color: #007bff;
		border-color: #007bff;
	}
	
	.btn-primary:hover {
		background-color: #0056b3;
		border-color: #0056b3;
	}
	
	a {
		display: inline-block;
		margin-top: 20px;
		color: #007bff;
	}
	
	a:hover {
		text-decoration: underline;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>Add New Product</h1>
		<form action="ProductServlet" method="post">
			<input type="hidden" name="action" value="add">
			<div class="form-group">
				<label for="brand">Brand:</label> <input type="text"
					class="form-control" id="brand" name="brand" required>
			</div>
			<div class="form-group">
				<label for="description">Description:</label> <input type="text"
					class="form-control" id="description" name="description" required>
			</div>
			<div class="form-group">
				<label for="price">Price:</label> <input type="number"
					class='form-control' id="price" name="price"
					onkeypress="return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))"
					required><br>
			</div>
			<input type="submit" class="btn btn-primary" value="Add Product">
		</form>
		<a href="ProductServlet?action=list">Back to Product List</a>
	</div>
</body>
</html>
