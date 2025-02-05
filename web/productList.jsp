<%-- 
    Document   : productList.jsp
    Created on : Jan 19, 2025
    Author     : tiend
--%>

<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
</head>
<body>
    <h1>Product List</h1>
    
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Original Price</th>
                <th>Sale Price</th>
                <th>Image</th>
                <th>Updated Date</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td>${product.originalPrice}</td>
                    <td>${product.salePrice}</td>
                    <td><img src="${product.image}" alt="Product Image" width="100" height="100" /></td>
                    <td>${product.updatedDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Phân trang -->
    <div>
        <c:if test="${currentPage > 1}">
            <a href="product?page=${currentPage - 1}">Previous</a>
        </c:if>

        <span>Page ${currentPage} of ${totalPages}</span>

        <c:if test="${currentPage < totalPages}">
            <a href="product?page=${currentPage + 1}">Next</a>
        </c:if>
    </div>
</body>
</html>
