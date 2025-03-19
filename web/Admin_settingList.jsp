<%-- 
    Document   : Admin_settingList
    Created on : Mar 18, 2025, 4:10:05 PM
    Author     : tiend
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Admin | Quản lý cài đặt</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/sider.css" rel="stylesheet">
        <style>
            *{
                box-sizing: border-box;
                margin:0;
                padding:0;
            }
            .header{
                padding: 0.4rem .2rem;
                margin-bottom: 1rem;
            }
            .add-product-btn{
                text-align: center;
                display: block;
                border:none;
                color: black;
                text-decoration: none;
                padding:.7rem .2rem;
                margin-top: 10px;
                width: 100%;
            }
            .add-product-btn:hover{
                color: black;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Side Bar -->
                <!-- CSS ném ở style -->
                <div class="col-md-3">
                    <jsp:include page="Admin_sidebar.jsp"></jsp:include>
                </div>
                <div class="col-md-9">
                    <div class="col-md-12">
                        <div class="header">
                            <h1>Danh sách cài đặt</h1>
                        </div>
                        <div class="product-list-content text-center">
                            <a class="add-product-btn btn btn-primary" href="/ProjectSWP391/admin/manageSettingAdmin?msg=loadAddSetting"><i class="fa-solid fa-plus fa-xl" style="color: black;"></i> Cài đặt mới</a>
                        </div>
                        <div class="search-filter-section">
                            <div class="row">
                                <div class="col-md-7">
                                    <div class="form-group select-filter">
                                        <label for="filter">
                                            <h3>Lọc cài đặt:</h3>
                                        </label>
                                        <select class="form-control" id="listFilter">
                                            <option selected="" disabled="">Chọn theo...</option>
                                            <option value="type">Kiểu cài đặt</option>
                                            <option value="status">Trạng thái cài đặt</option>
                                        </select>
                                        <select class="form-control" id="filterDetail" style="margin-top: 10px;">
                                            <option selected="" disabled="">Lựa chọn</option>
                                            <!-- lựa chọn ở đây. -->
                                        </select>
                                    </div>
                                </div>
                                <form action="/ProjectSWP391/admin/listSettingAdmin">
                                    <input type="hidden" name="msg" value="searchSetting"/>
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <label for="pSearch">
                                                <h3>Tìm kiếm:</h3>

                                            </label>
                                            <input type="text" name="pSearch" class="form-control" placeholder="Tên cài đặt,giá trị..."/>
                                            <button class="add-product-btn btn btn-primary" type="submit">Tìm kiếm</button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                        <div>
                            <h4>${requestScope.message}</h4>
                        </div>
                        <div class="product-table">
                            <table class="table table-striped" style="width: 100%;border: 1px solid #DDDDDD;border-radius: 6px;">
                                <thead>
                                    <tr>
                                        <th><a href="/ProjectSWP391/admin/listSettingAdmin?msg=sortSetting&sortBy=id">ID</a></th>
                                        <th><a href="/ProjectSWP391/admin/listSettingAdmin?msg=sortSetting&sortBy=type">Kiểu cài đặt</a></th>
                                        <th><a href="/ProjectSWP391/admin/listSettingAdmin?msg=sortSetting&sortBy=name">Tên</a></th>
                                        <th><a href="/ProjectSWP391/admin/listSettingAdmin?msg=sortSetting&sortBy=value">Giá trị</a></th>
                                        <th><a href="/ProjectSWP391/admin/listSettingAdmin?msg=sortSetting&sortBy='order'">Thứ tự</a></th>
                                        <th><a href="/ProjectSWP391/admin/listSettingAdmin?msg=sortSetting&sortBy=isActive">Trạng thái</a></th>
                                        <th>Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Sản phẩm sẽ được chèn vào đây -->
                                </tbody>
                            </table>
                            <ul class="pagination">
                                <li class="active"><a href="">1</a></li>
                                <li><a href="">2</a></li>
                                <li><a href="">3</a></li>
                                <li><a href="">&raquo;</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- icon -->
        <script src="https://kit.fontawesome.com/8922b65fb8.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
        <script src="${pageContext.request.contextPath}/js/price-range.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.scrollUp.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.prettyPhoto.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
        <script>
            // Convert the product details from Java to JavaScript
            var productDetails = JSON.parse('${listSetting}');

            var currentPage = 1; // Current page
            var itemsPerPage = 8; // Number of items per page

            // Display products for the current page
            function displayProducts() {
                var start = (currentPage - 1) * itemsPerPage;
                var end = start + itemsPerPage;
                var productsToDisplay = productDetails.slice(start, end);

                // Clear the current products
                $('tbody').empty();

                // Add each product
                productsToDisplay.forEach(function (product) {
                    // Kiểm tra product.status và chọn icon tương ứng
                    var statusIcon = product.isActive === 0 ? 'fa-toggle-off fa-lg" style="color: #ff0000;"></i>' : 'fa-toggle-on fa-lg" style="color: #63E6BE;"></i>';
                    var isActivate = product.isActive === 1 ? 'Hoạt động' : 'Không hoạt động';
                    var productHtml = '<tr>' +
                            '<td>' + product.id + '</td>' +
                            '<td>' + product.type+ '</td>' +
                            '<td><a href="viewSettingAdmin?sid=' + product.id + '" style="color: black; text-decoration: none;">' + product.name + '</a></td>' +
                            '<td>' + product.value + '</td>' +
                            ' <td>' + product.order + '</td>' +
                            ' <td>' + isActivate + '</td>' +
                            ' <td>'+
                            '  <a href="/ProjectSWP391/admin/listSettingAdmin?sid=' + product.id + '&msg=toggleStatus&status=' + product.isActive + '"><i class="fa-solid ' + statusIcon + '</a>' +
                            ' <a href="/ProjectSWP391/admin/manageSettingAdmin?msg=loadEditSetting&sid=' + product.id + '"><i class="fa-solid fa-pen-to-square fa-lg status-icon"></i></a>' +
                            ' </td>' +
                            ' </tr>';
                    $('tbody').append(productHtml);
                });
            }

            // Update the pagination links
            function updatePagination() {
                var totalPages = Math.ceil(Object.keys(productDetails).length / itemsPerPage);

                // Clear the current pagination links
                $('.pagination').empty();

                // Add "Previous" button
                var prevClass = currentPage === 1 ? 'disabled' : '';
                var prevHtml = '<li class="' + prevClass + '"><a href="#">Previous</a></li>';
                $('.pagination').append(prevHtml);

                // Add each pagination link
                for (var i = 1; i <= totalPages; i++) {
                    var liClass = i === currentPage ? 'active' : '';
                    var liHtml = '<li class="' + liClass + '"><a href="#">' + i + '</a></li>';
                    $('.pagination').append(liHtml);
                }

                // Add "Next" button
                var nextClass = currentPage === totalPages ? 'disabled' : '';
                var nextHtml = '<li class="' + nextClass + '"><a href="#">Next</a></li>';
                $('.pagination').append(nextHtml);

                // Add event handlers to the pagination links
                $('.pagination a').click(function (e) {
                    e.preventDefault();

                    var pageText = $(this).text();

                    if (pageText === 'Previous' && currentPage !== 1) {
                        currentPage--;
                    } else if (pageText === 'Next' && currentPage !== totalPages) {
                        currentPage++;
                    } else if (pageText !== 'Previous' && pageText !== 'Next') {
                        currentPage = parseInt(pageText);
                    }

                    displayProducts();
                    updatePagination();
                });
            }
            //Xử lý với filter.
            let selectedOption;
            $('#listFilter').change(function () {
                selectedOption = $(this).val();
                if (selectedOption === 'type') {
                    $.ajax({
                        url: "/ProjectSWP391/admin/listSettingAdmin",
                        type: 'GET',
                        data: {
                            msg: 'selectFilter',
                            selected: selectedOption
                        },
                        success: function (data) {
                            var filterDetail = $('#filterDetail');
                            filterDetail.empty();
                            filterDetail.append('<option selected="" disabled="">Lựa chọn</option>');
                            $.each(data, function (index, value) {
                                filterDetail.append('<option value="' + value.type + '">' + value.type + '</option>');
                            });
                        }
                    });
                }
                
                if (selectedOption === 'status') {
                    var filterDetail = $('#filterDetail');
                    filterDetail.empty();
                    filterDetail.append('<option selected disabled>Lựa chọn</option>');
                    filterDetail.append('<option value="1">Hoạt động</option>');
                    filterDetail.append('<option value="0">Không hoạt động</option>');
                }

            });
            $('#filterDetail').change(function () {
                var filterDetail = $(this).val();
                window.location.href = '/ProjectSWP391/admin/listSettingAdmin?msg=settingFilter&selected=' + selectedOption + '&value=' + filterDetail;
            });
            // Display the initial products and pagination
            displayProducts();
            updatePagination();


        </script>

    </body>
</html>

