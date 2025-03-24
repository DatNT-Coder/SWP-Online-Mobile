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
                margin-top: 20px;
                background: #eee;
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
            .input-group {
                display: flex;
                align-items: center;
                gap: 10px;
            }
            .input-group select {
                flex: 1;
                min-width: 150px;
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
                            <ul class="nav navbar-nav">
                                <li><i class="fa fa-user"></i><button class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#addUserModal"> Add </button></li>
                            </ul>

                            <!-- Add User Modal -->
                            <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="editProfileModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title" id="editProfileModalLabel">Add User</h4>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form class="edit-form" action="userlist?action=add" method="post">
                                                <div class="form-group">
                                                    <label for="edit-full-name">Full Name</label>
                                                    <input type="text" name="full_name" class="form-control" id="edit-full-name" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="gender">Gender</label>
                                                    <select id="gender" name="gender" class="form-control" required>
                                                        <option value="" disabled selected>Select gender</option>
                                                        <option value="Male">Male</option>
                                                        <option value="Female">Female</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="edit-email">Email</label>
                                                    <input type="email" name="email" class="form-control" id="edit-email" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="edit-phone">Phone Number:</label>
                                                    <input name="mobile" type="text" class="form-control" id="edit-phone" placeholder="Enter phone number"
                                                           pattern="[0-9]{10}" title="Please enter a 10-digit phone number" required/>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                    <button type="submit" class="btn btn-primary">Add</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card-body d-flex justify-content-between">
                            <div class="col-md-5">
                                <form class="d-flex" action="userlist" method="get">
                                    <input type="text" class="form-control" name="keyword" 
                                           placeholder="Search by name, email, mobile" value="${sessionScope.kw}">
                                    <button type="submit" class="btn btn-secondary">Search</button>
                                    ${sessionScope.er}
                                </form>
                            </div>

                            <div class="col-md-4">
                                <div class="input-group">
                                    <form action="userlist" method="get" style="display: flex; gap: 10px;">
                                        <input type="hidden" name="isFiltering" value="true">
                                        <select class="form-control" name="filterType" id="filterType" onchange="updateFilterOptions()">
                                            <option value="all" ${sessionScope.filterType == 'all' ? 'selected' : ''}>All</option>
                                            <option value="gender" ${sessionScope.filterType == 'gender' ? 'selected' : ''}>Gender</option>
                                            <option value="role" ${sessionScope.filterType == 'role' ? 'selected' : ''}>Role</option>
                                            <option value="status" ${sessionScope.filterType == 'status' ? 'selected' : ''}>Status</option>
                                        </select>
                                        <select class="form-control" name="filterValue" id="filterValue">
                                            <option value="all">All</option>
                                        </select>
                                        <button type="submit" class="btn btn-secondary">Filter</button>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead class="small text-uppercase bg-body text-muted">
                                    <tr>
                                        <th>ID <a href="?sortField=id&sortOrder=asc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}"><i class="fa fa-arrow-up"></i></a>
                                            <a href="?sortField=id&sortOrder=desc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}"><i class="fa fa-arrow-down"></i></a></th>
                                        <th>Full Name <a href="?sortField=full_name&sortOrder=asc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}"><i class="fa fa-arrow-up"></i></a>
                                            <a href="?sortField=full_name&sortOrder=desc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}"><i class="fa fa-arrow-down"></i></a></th>
                                        <th>Gender <a href="?sortField=gender&sortOrder=asc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}"><i class="fa fa-arrow-up"></i></a>
                                            <a href="?sortField=gender&sortOrder=desc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}"><i class="fa fa-arrow-down"></i></a></th>
                                        <th>Email <a href="?sortField=email&sortOrder=asc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}"><i class="fa fa-arrow-up"></i></a>
                                            <a href="?sortField=email&sortOrder=desc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}"><i class="fa fa-arrow-down"></i></a></th>
                                        <th>Mobile <a href="?sortField=phone&sortOrder=asc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}"><i class="fa fa-arrow-up"></i></a>
                                            <a href="?sortField=phone&sortOrder=desc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}"><i class="fa fa-arrow-down"></i></a></th>
                                        <th>Status <a href="?sortField=status&sortOrder=asc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}"><i class="fa fa-arrow-up"></i></a>
                                            <a href="?sortField=status&sortOrder=desc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}"><i class="fa fa-arrow-down"></i></a></th>
                                        <th>Role <a href="?sortField=role_name&sortOrder=asc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}"><i class="fa fa-arrow-up"></i></a>
                                            <a href="?sortField=role_name&sortOrder=desc&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}"><i class="fa fa-arrow-down"></i></a></th>
                                        <th>Option</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty sessionScope.listUserBySearch}">
                                            <c:set var="listUser" value="${sessionScope.listUserBySearch}" />
                                        </c:when>
                                        <c:when test="${not empty sessionScope.listUserByFilter}">
                                            <c:set var="listUser" value="${sessionScope.listUserByFilter}" />
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var="listUser" value="${sessionScope.listUserByPage}" />
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
                                                <a href="${pageContext.request.contextPath}/admin/userdetail?id=${u.id}" class="btn btn-warning btn-sm">View</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <!-- Pagination -->

                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center mt-3">
                                <c:if test="${sessionScope.currentPage > 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${sessionScope.currentPage - 1}&sortField=${sessionScope.sortField}&sortOrder=${sessionScope.sortOrder}&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}">Previous</a>
                                    </li>
                                </c:if>
                                <c:forEach var="i" begin="1" end="${sessionScope.totalPage}">
                                    <li class="page-item ${i == sessionScope.currentPage ? 'active' : ''}">
                                        <a class="page-link" href="?page=${i}&sortField=${sessionScope.sortField}&sortOrder=${sessionScope.sortOrder}&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}">${i}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${sessionScope.currentPage < sessionScope.totalPage}">
                                    <li class="page-item">
                                        <a class="page-link" href="?page=${sessionScope.currentPage + 1}&sortField=${sessionScope.sortField}&sortOrder=${sessionScope.sortOrder}&keyword=${sessionScope.kw}&isFiltering=${sessionScope.isFiltering}&filterType=${sessionScope.filterType}&filterValue=${sessionScope.filterValue}">Next</a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                            function updateFilterOptions() {
                                                let filterType = document.getElementById("filterType").value;
                                                let filterValue = document.getElementById("filterValue");
                                                filterValue.innerHTML = "";

                                                let defaultOption = document.createElement("option");
                                                defaultOption.value = "all";
                                                defaultOption.text = "All";
                                                filterValue.appendChild(defaultOption);

                                                let options = [];
                                                if (filterType === "gender") {
                                                    options = [
                                                        {value: "Male", text: "Male"},
                                                        {value: "Female", text: "Female"}
                                                    ];
                                                } else if (filterType === "role") {
                                                    options = [
                                                        {value: "user", text: "User"},
                                                        {value: "sale", text: "Sale"},
                                                        {value: "sale manager", text: "Sale Manager"},
                                                        {value: "admin", text: "Admin"},
                                                        {value: "marketing", text: "Marketing"},
                                                        {value: "shipper", text: "Shipper"}
                                                    ];
                                                } else if (filterType === "status") {
                                                    options = [
                                                        {value: "1", text: "Active"},
                                                        {value: "0", text: "Inactive"}
                                                    ];
                                                }

                                                options.forEach(optionData => {
                                                    let option = document.createElement("option");
                                                    option.value = optionData.value;
                                                    option.text = optionData.text;
                                                    filterValue.appendChild(option);
                                                });

                                                // Set selected value from session if available
                                                let sessionFilterValue = "${sessionScope.filterValue}";
                                                if (sessionFilterValue) {
                                                    filterValue.value = sessionFilterValue;
                                                }
                                            }

                                            // Call updateFilterOptions on page load to set initial filter values
                                            window.onload = function () {
                                                updateFilterOptions();
                                            };
        </script>
    </body>
</html>