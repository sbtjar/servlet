<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.vit.JavaEE.model.Product" %>
<html>
<head>
    <title>Edit Product</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
        <h1>Edit Product</h1>
        <%
            Product product = (Product) request.getAttribute("product");
            if (product == null) {
                out.println("<p>Product not found!</p>");
                return;
            }
        %>
        <form action="ProductServlet" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= product.getId() %>">
            
            <div class="form-group">
                <label for="brand">Brand:</label>
                <input type="text" class="form-control" id="brand" name="brand" value="<%= product.getBrand() %>" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <input type="text" class="form-control" id="description" name="description" value="<%= product.getDescription() %>" required>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" class="form-control" id="price" name="price" value="<%= product.getPrice() %>" step="0.01" required>
            </div>
            <input type="submit" class="btn btn-primary" value="Update Product">
        </form>
        <a href="ProductServlet?action=list">Back to Product List</a>
    </div>
</body>
</html>
