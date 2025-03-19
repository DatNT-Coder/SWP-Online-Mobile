<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Marketing Dashboard</title>
</head>
<body>
    <h1>Marketing Dashboard</h1>
    <p>Total Posts: ${totalPosts}</p>
    <p>Total Products: ${totalProducts}</p>
    <p>Total Customers: ${totalCustomers}</p>
    <p>Total Feedbacks: ${totalFeedbacks}</p>

    <h2>Customer Trend (Last 7 Days)</h2>
    <form action="/marketing/MarketingDashboard" method="get">
        <label for="startDate">Start Date:</label>
        <input type="date" id="startDate" name="startDate" value="${param.startDate}">
        <label for="endDate">End Date:</label>
        <input type="date" id="endDate" name="endDate" value="${param.endDate}">
        <button type="submit">Update</button>
    </form>

    <table border="1">
        <tr>
            <th>Date</th>
            <th>New Customers</th>
        </tr>
        <c:forEach items="${customerTrend}" var="trend">
            <tr>
                <td>${trend.date}</td>
                <td>${trend.new_customers}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>