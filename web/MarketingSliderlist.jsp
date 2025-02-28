<%-- 
    Document   : Marketing_productList
    Created on : Feb 7, 2024, 8:24:37 PM
    Author     : alexf
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
        <title>Marketing | Quản lý Slider</title>
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
                    <jsp:include page="sidebar.jsp"></jsp:include>

                    </div>
                    <div class="col-md-9">
                        <div class="col-md-12">
                            <div class="header">
                                <h1>Danh sách slider</h1>
                            </div>
                            <div class="product-list-content text-center">
                                <a class="add-product-btn btn btn-primary" href="/mobileshop/marketing/manageSliderMarketing?msg=loadAddSlider"><i class="fa-solid fa-plus fa-xl" style="color: black;"></i> Thêm mới slider</a>
                            </div>
                            <div class="search-filter-section">
                                <div class="row">
                                    <div class="col-md-7">
                                        <div class="form-group select-filter">
                                            <label for="filter">
                                                <h3>Lọc slider:</h3>
                                            </label>
                                            <select class="form-control" id="listFilter">
                                                <option selected="" disabled="">Chọn theo...</option>
                                                <option value="status">Trạng thái slider</option>
                                            </select>
                                            <select class="form-control" id="filterDetail" style="margin-top: 10px;">
                                                <option selected="" disabled="">Lựa chọn</option>
                                                <!-- lựa chọn ở đây. -->
                                            </select>
                                        </div>
                                    </div>
                                    <form action="listSliderMarketing">
                                        <input type="hidden" name="msg" value="searchSlider"/>
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label for="pSearch">
                                                    <h3>Tìm kiếm:</h3>

                                                </label>
                                                <input type="text" name="pSearch" class="form-control" placeholder="Tựa đề..."/>
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
                                        <th><a href="/mobileshop/marketing/listSliderMarketing?msg=sortSlider&sortBy=id">ID</a></th>
                                        <th><a href="/mobileshop/marketing/listSliderMarketing?msg=sortSlider&sortBy=title">Tựa đề</a></th>
                                        <th><a href="/mobileshop/marketing/listSliderMarketing?msg=sortSlider&sortBy=backlink">Back Link</a></th>
                                        <th><a href="/mobileshop/marketing/listSliderMarketing?msg=sortSlider&sortBy=notes">Chi tiết </a></th>

                                        <th>Ảnh</th>


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
            var productDetails = JSON.parse('${listProduct}');

            var currentPage = 1; // Current page
            var itemsPerPage = 8; // Number of items per page

            // Display products for the current page
            function displayProducts() {
                var start = (currentPage - 1) * itemsPerPage;
                var end = start + itemsPerPage;
                // Tạo một mảng để lưu trữ các key
                var keys = [];
                for (var key in productDetails) {
                    if (productDetails.hasOwnProperty(key)) {
                        keys.push(key);
                    }
                }
                var productsToDisplay = keys.slice(start, end);

                // Clear the current products
                $('tbody').empty();

                // Add each product
                productsToDisplay.forEach(function (productId) {
                    var product = productDetails[productId].product;
                    // Kiểm tra product.status và chọn icon tương ứng
                    var statusIcon = product.status === 0 ? 'fa-eye-slash' : 'fa-eye';
                    var productHtml = '<tr>' +
                            '<td>' + product.id + '</td>' +
                            '<td>' + product.title + '</td>' +
                            ' <td>' + product.backlink + '</td>' +
                            ' <td>' + product.notes + '</td>' +
                            '<td><img width="100px" src="../assets/img/slider/' + product.image + '" class="img-thumbnail" alt="Ảnh sản phẩm"></td>' +
                            ' <td>' +
                            '  <a href="/mobileshop/marketing/listSliderMarketing?pid=' + product.id + '&msg=toggleStatus&status=' + product.status + '"><i class="fa-solid ' + statusIcon + ' fa-lg"></i></a>' +
                            ' <a href="/mobileshop/marketing/manageSliderMarketing?msg=loadEditSlider&pid=' + product.id + '"><i class="fa-solid fa-pen-to-square fa-lg status-icon"></i></a>' +
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
                var prevHtml = '<li class="' + prevClass + '"><a href="#">Trước</a></li>';
                $('.pagination').append(prevHtml);

                // Add each pagination link
                for (var i = 1; i <= totalPages; i++) {
                    var liClass = i === currentPage ? 'active' : '';
                    var liHtml = '<li class="' + liClass + '"><a href="#">' + i + '</a></li>';
                    $('.pagination').append(liHtml);
                }

                // Add "Next" button
                var nextClass = currentPage === totalPages ? 'disabled' : '';
                var nextHtml = '<li class="' + nextClass + '"><a href="#">Sau</a></li>';
                $('.pagination').append(nextHtml);

                // Add event handlers to the pagination links
                $('.pagination a').click(function (e) {
                    e.preventDefault();

                    var pageText = $(this).text();

                    if (pageText === 'Trước' && currentPage !== 1) {
                        currentPage--;
                    } else if (pageText === 'Sau' && currentPage !== totalPages) {
                        currentPage++;
                    } else if (pageText !== 'Sau' && pageText !== 'Trước') {
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

                if (selectedOption === 'status') {
                    var filterDetail = $('#filterDetail');
                    filterDetail.empty();
                    filterDetail.append('<option selected disabled>Lựa chọn</option>');
                    filterDetail.append('<option value="1">Khả dụng</option>');
                    filterDetail.append('<option value="0">Không khả dụng</option>');
                }

            });
            $('#filterDetail').change(function () {
                var filterDetail = $(this).val();
                window.location.href = '/mobileshop/marketing/listSliderMarketing?msg=sliderFilter&selected=' + selectedOption + '&value=' + filterDetail;
            });
            // Display the initial products and pagination
            displayProducts();
            updatePagination();


        </script>
 <script>

            var sortState = JSON.parse(sessionStorage.getItem('sortState')) || {
                id: false,
                title: false,
                backlink: false,
                notes: false,
               
            };


            document.querySelectorAll('th a').forEach(function (link) {
                var column = link.getAttribute('href').split('=')[2];
                link.addEventListener('click', function (e) {
                    e.preventDefault();

                    // Đảo ngược trạng thái sắp xếp
                    sortState[column] = !sortState[column];
                    sessionStorage.setItem('sortState', JSON.stringify(sortState));
                    // Xác định thứ tự sắp xếp dựa trên trạng thái
                    var order = sortState[column] ? 'ASC' : 'DESC';

                    // Cập nhật href của liên kết với thứ tự sắp xếp mới
                    link.setAttribute('href', 'listSliderMarketing?msg=sortSlider&sortBy=' + column + '&order=' + order);

                    // Kích hoạt liên kết
                    window.location.href = link.getAttribute('href');
                });
            });

        </script>
    </body>
</html>
