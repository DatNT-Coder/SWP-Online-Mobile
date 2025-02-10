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
                                    <a href="AddCustomer.jsp" class="btn btn-primary btn-sm">Add New</a>
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
                                        ${err}
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
                                <table class="table table-bordered">
                                    <thead class="small text-uppercase bg-body text-muted">
                                        <tr>
                                            <th>
                                                ID
                                                <a href="?sortField=id&sortOrder=asc"><i class="fa fa-arrow-up"></i></a>
                                                <a href="?sortField=id&sortOrder=desc"><i class="fa fa-arrow-down"></i></a>
                                            </th>
                                            <th>
                                                Full Name
                                                <a href="?sortField=full_name&sortOrder=asc"><i class="fa fa-arrow-up"></i></a>
                                                <a href="?sortField=full_name&sortOrder=desc"><i class="fa fa-arrow-down"></i></a>
                                            </th>
                                            <th>Gender</th>
                                            <th>
                                                Email
                                                <a href="?sortField=email&sortOrder=asc"><i class="fa fa-arrow-up"></i></a>
                                                <a href="?sortField=email&sortOrder=desc"><i class="fa fa-arrow-down"></i></a>
                                            </th>
                                            <th>
                                                Mobile
                                                <a href="?sortField=phone&sortOrder=asc"><i class="fa fa-arrow-up"></i></a>
                                                <a href="?sortField=phone&sortOrder=desc"><i class="fa fa-arrow-down"></i></a>
                                            </th>
                                            <th>
                                                Status
                                                <a href="?sortField=status&sortOrder=asc"><i class="fa fa-arrow-up"></i></a>
                                                <a href="?sortField=status&sortOrder=desc"><i class="fa fa-arrow-down"></i></a>
                                            </th>
                                            <th></th>
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
                                                <td>${Detail}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                            </div>

                            <!-- Phân trang --><nav aria-label="Page navigation">
                                <ul class="pagination justify-content-center mt-3">
                                    <c:if test="${currentPage > 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="?page=${currentPage - 1}&sortField=${sortField}&sortOrder=${sortOrder}">Previous</a>
                                        </li>
                                    </c:if>

                                    <c:forEach var="i" begin="1" end="${totalPages}">
                                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                                            <a class="page-link" href="?page=${i}&sortField=${sortField}&sortOrder=${sortOrder}">${i}</a>
                                        </li>
                                    </c:forEach>

                                    <c:if test="${currentPage < totalPages}">
                                        <li class="page-item">
                                            <a class="page-link" href="?page=${currentPage + 1}&sortField=${sortField}&sortOrder=${sortOrder}">Next</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>




                        </div>
                    </div>
                </div>
            </div>

        </form>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
