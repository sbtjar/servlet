<%@page import="com.vit.JavaEE.model.User"%>
<%@page import="com.vit.JavaEE.model.Product"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%
    HttpSession sson = request.getSession();
    User user = (User) sson.getAttribute("user");
    boolean isAdmin = user != null && "ADMIN".equals(user.getRole());
%>
<html>
<head>
<title>Product List</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
}

h1 {
    color: #333;
}

a {
    text-decoration: none;
    color: #007BFF;
}

a:hover {
    text-decoration: underline;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    padding: 12px;
    text-align: left;
    border: 1px solid #ddd;
}

th {
    background-color: #007BFF;
    color: white;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #ddd;
}

.header-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
}

.welcome-message {
    margin: 0;
}

.logout-button, .add-product-button {
    background-color: #007BFF;
    color: white;
    border: none;
    padding: 10px 15px;
    border-radius: 4px;
    cursor: pointer;
}

.logout-button:hover, .add-product-button:hover {
    background-color: #0056b3;
}

.center-link {
    text-align: center;
    margin: 10px 0; /* Reduced margin */
}

form {
    display: inline; /* Keep forms inline */
}
.delete{
	margin-left: 20px;
}
</style>
</head>
<body>
    <div class="header-container">
        <h3 class="welcome-message">
            Welcome,
            <%= user != null ? user.getFullName() : "Guest" %>!
        </h3>
        <form action="LogoutServlet" method="get">
            <button type="submit" class="logout-button">Logout</button>
        </form>
    </div>

    <h2>Product List</h2>
    <div class="center-link">
        <% if (isAdmin) { %>
        <form action="addProduct.jsp" method="get">
            <button type="submit" class="add-product-button">Add New Product</button>
        </form>
        <% } %>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Brand</th>
            <th>Description</th>
            <th>Price</th>
            <th>Actions</th>
        </tr>
        <%
            List<Product> productList = (List<Product>) request.getAttribute("productList");
            for (Product product : productList) {
        %>
        <tr>
            <td><%= product.getId() %></td>
            <td><%= product.getBrand() %></td>
            <td><%= product.getDescription() %></td>
            <td><%= product.getPrice() %></td>
            <td>
                <% if (isAdmin) { %>
                <a href="ProductServlet?action=edit&id=<%= product.getId() %>">Edit</a>
                <a href="ProductServlet?action=delete&id=<%= product.getId() %>"
                   onclick="return confirm('Are you sure you want to delete this product?');" class="delete">Delete</a>
                <% } %>
            </td>
        </tr>
        <%
            }
        %>
    </table>

</body>
</html>
