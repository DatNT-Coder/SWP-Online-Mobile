<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Customer</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h2>Add New Customer</h2>
        <form action="customerList" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="id">Customer ID</label>
                <input type="text" class="form-control" id="id" name="id" readonly>
            </div>
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" class="form-control" id="fullName" name="fullName" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="text" class="form-control" id="phone" name="phone" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender</label>
                <select class="form-control" id="gender" name="gender">
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            <div class="form-group">
                <label for="registrationDate">Registration Date</label>
                <input type="date" class="form-control" id="registrationDate" name="registrationDate" required>
            </div>
            <div class="form-group">
                <label for="status">Status</label>
                <select class="form-control" id="status" name="status">
                    <option value="Active">Active</option>
                    <option value="Inactive">Inactive</option>
                </select>
            </div>
            <div class="form-group">
                <label for="updatedBy">Updated By</label>
                <input type="text" class="form-control" id="updatedBy" name="updatedBy">
            </div>
            <div class="form-group">
                <label for="updatedDate">Updated Date</label>
                <input type="date" class="form-control" id="updatedDate" name="updatedDate">
            </div>
            <div class="form-group">
                <label for="image">Profile Image</label>
                <input type="file" class="form-control-file" id="image" name="image">
            </div>
            <div class="form-group">
                <label for="settingsId">Settings ID</label>
                <input type="text" class="form-control" id="settingsId" name="settingsId">
            </div>
            <button type="submit" name="add" class="btn btn-primary">Submit</button>
        </form>
    </div>
</body>
</html>
