<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Customer List</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                margin-top:20px;
                background:#eee;
            }
            .card {
                box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
            }
            .table-nowrap .table td, .table-nowrap .table th {
                white-space: nowrap;
            }
            .table>:not(caption)>*>* {
                padding: 0.75rem 1.25rem;
                border-bottom-width: 1px;
            }
            table th {
                font-weight: 600;
                background-color: #eeecfd !important;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <form action="customerList" method="post">
            <div class="container">
                <div class="row">
                    <div class="col-12 mb-3 mb-lg-5">
                        <div class="card table-nowrap table-card">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h5 class="mb-0">Customer List</h5>
                                <div>
                                    <a href="#" class="btn btn-primary btn-sm">Add New</a>
                                    <a href="#" class="btn btn-info btn-sm">View</a>
                                    <a href="#" class="btn btn-warning btn-sm">Edit</a>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="col-md-5">
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="searchKeyword" 
                                               placeholder="Search by name, email, mobile" value="${searchKeyword}">
                                        <button type="submit" class="btn btn-secondary">Search</button>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="input-group">
                                        <select class="form-control" name="statusFilter">
                                            <option value="">All</option>
                                            <option value="1" ${statusFilter == '1' ? 'selected' : ''}>Active</option>
                                            <option value="0" ${statusFilter == '0' ? 'selected' : ''}>Inactive</option>
                                        </select>
                                        <button type="submit" class="btn btn-secondary">Filter by Status</button>
                                    </div>
                                </div>

                            </div>
                            <div class="table-responsive">
                                <table class="table mb-0">
                                    <thead class="small text-uppercase bg-body text-muted">
                                        <tr>
                                            <th>ID</th>
                                            <th>Full Name</th>
                                            <th>Gender</th>
                                            <th>Email</th>
                                            <th>Mobile</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <c:forEach var="customer" items="${customers}">
                                            <tr>
                                                <td>${customer.id}</td>
                                                <td>${customer.full_name}</td>
                                                <td>${customer.gender}</td>
                                                <td>${customer.email}</td>
                                                <td>${customer.phone}</td>
                                                <td>${customer.status}</td>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                            <!--                            <nav aria-label="Page navigation">
                                                            <ul class="pagination justify-content-center mt-3">
                                                                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                                                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                                            </ul>
                                                        </nav>-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
