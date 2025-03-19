<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
</head>
<body>
    <h1>Dashboard</h1>
    
    <p><strong>Total Users:</strong> ${totalUsers}</p>
    <p><strong>Total Posts:</strong> ${totalPosts}</p>
    <p><strong>Total Revenue:</strong> ${totalRevenue}</p>
    <p><strong>Total New Customers Registered:</strong> ${totalNewCustomers}</p>
    <p><strong>Total Products:</strong> ${totalProducts}</p>

    <h3>Most Ordered Product</h3>
    <p>${mostOrderedProduct.name} - ${mostOrderedProduct.orderCount}</p>

    <h3>Most Feedbacked Product</h3>
    <p>${mostFeedbackProduct.name} - ${mostFeedbackProduct.feedbackCount}</p>

</body>
</html>
