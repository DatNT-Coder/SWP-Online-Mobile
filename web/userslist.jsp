<%-- 
    Document   : userslist
    Created on : Mar 5, 2025, 1:39:36 PM
    Author     : vuduc
--%>

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
            <div class="container">
                <div class="row">
                    <div class="col-12 mb-3 mb-lg-5">
                        <div class="card table-nowrap table-card">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h5 class="mb-0">Users List</h5>
                                
                                <div>
                                    <form action="userlist" method="post">
                                        <button type="submit" class="btn btn-primary btn-sm">Add New</button>
                                    </form>
                                </div>
                                
                            </div>
                            <div class="card-body d-flex justify-content-between">
                                <div class="col-md-5">

                                    <div>
                                        <form class="d-flex" action="userlist" method="get">
                                        <input type="text" class="form-control" name="keyword" 
                                               placeholder="Search by name, email, mobile">
                                        <button type="submit" class="btn btn-secondary">Search</button>
                                        ${er}
                                        </form>
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
                                        <c:set var="kw_value" value="${not empty kw ? kw : ''}"/>
                                        <tr>
                                            <th>
                                                ID
                                                <a href="?sortField=id&sortOrder=asc${not empty kw ? '&keyword=' : ''}${kw_value}"><i class="fa fa-arrow-up"></i></a>
                                                <a href="?sortField=id&sortOrder=desc${not empty kw ? '&keyword=' : ''}${kw_value}"><i class="fa fa-arrow-down"></i></a>
                                            </th>
                                            <th>
                                                Full Name
                                                <a href="?sortField=full_name&sortOrder=asc${not empty kw ? '&keyword=' : ''}${kw_value}"><i class="fa fa-arrow-up"></i></a>
                                                <a href="?sortField=full_name&sortOrder=desc${not empty kw ? '&keyword=' : ''}${kw_value}"><i class="fa fa-arrow-down"></i></a>
                                            </th>
                                            <th>
                                                Gender
                                                <a href="?sortField=gender&sortOrder=asc${not empty kw ? '&keyword=' : ''}${kw_value}"><i class="fa fa-arrow-up"></i></a>
                                                <a href="?sortField=gender&sortOrder=desc${not empty kw ? '&keyword=' : ''}${kw_value}"><i class="fa fa-arrow-down"></i></a>
                                            </th>
                                            <th>
                                                Email
                                                <a href="?sortField=email&sortOrder=asc${not empty kw ? '&keyword=' : ''}${kw_value}"><i class="fa fa-arrow-up"></i></a>
                                                <a href="?sortField=email&sortOrder=desc${not empty kw ? '&keyword=' : ''}${kw_value}"><i class="fa fa-arrow-down"></i></a>
                                            </th>
                                            <th>
                                                Mobile
                                                <a href="?sortField=phone&sortOrder=asc${not empty kw ? '&keyword=' : ''}${kw_value}"><i class="fa fa-arrow-up"></i></a>
                                                <a href="?sortField=phone&sortOrder=desc${not empty kw ? '&keyword=' : ''}${kw_value}"><i class="fa fa-arrow-down"></i></a>
                                            </th>
                                            <th>
                                                Status
                                                <a href="?sortField=status&sortOrder=asc${not empty kw ? '&keyword=' : ''}${kw_value}"><i class="fa fa-arrow-up"></i></a>
                                                <a href="?sortField=status&sortOrder=desc${not empty kw ? '&keyword=' : ''}${kw_value}"><i class="fa fa-arrow-down"></i></a>
                                            </th>
                                            <th>
                                                Role
                                                <a href="?sortField=role_name&sortOrder=asc${not empty kw ? '&keyword=' : ''}${kw_value}"><i class="fa fa-arrow-up"></i></a>
                                                <a href="?sortField=role_name&sortOrder=desc${not empty kw ? '&keyword=' : ''}${kw_value}"><i class="fa fa-arrow-down"></i></a>
                                            </th>
                                            <th>
                                                Option
                                            </th>
                                        </tr>


                                    </thead>



                                    <tbody>
                                        <c:choose>
                                            <c:when test="${not empty listUserBySearch}">
                                                <c:set var="listUser" value="${listUserBySearch}" />
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="listUser" value="${listUserByPage}" />
                                            </c:otherwise>
                                        </c:choose>

                                        <c:forEach var="u" items="${listUser}">
                                            <tr>
                                                <td>${u.id}</td>
                                                <td>${u.full_name}</td>
                                                <td>${u.gender}</td>
                                                <td>${u.email}</td>
                                                <td>${u.phone}</td>
                                                <td>${u.status == 1 ? 'Active' : 'In Active'}</td>
                                                <td>${u.role_name}</td>
                                                <td>
                                                    <a href="customerDetail?id=${customer.id}" class="btn btn-info btn-sm">View Detail</a>
                                                    <a href="customerDetail?id=${customer.id}" class="btn btn-warning btn-sm">Edit</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                            </div>

                            <!-- Phân trang đang làm -->
                            <nav aria-label="Page navigation">
                                <ul class="pagination justify-content-center mt-3">
                                    
                                    <c:set var="kw_value" value="${not empty kw ? kw : ''}"/>
                                    
                                    <c:if test="${currentPage > 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="?page=${currentPage - 1}&sortField=${sortField}&sortOrder=${sortOrder}${not empty kw ? '&keyword=' : ''}${kw_value}">Previous</a>
                                        </li>
                                    </c:if>

                                    <c:forEach var="i" begin="1" end="${totalPage}">
                                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                                            <a class="page-link" href="?page=${i}&sortField=${sortField}&sortOrder=${sortOrder}${not empty kw ? '&keyword=' : ''}${kw_value}">${i}</a>
                                        </li>
                                    </c:forEach>

                                    <c:if test="${currentPage < totalPage}">
                                        <li class="page-item">
                                            <a class="page-link" href="?page=${currentPage + 1}&sortField=${sortField}&sortOrder=${sortOrder}${not empty kw ? '&keyword=' : ''}${kw_value}">Next</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>

                        </div>
                    </div>
                </div>
            </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

