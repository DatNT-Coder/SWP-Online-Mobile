<%-- 
    Document   : Admin_viewSetting
    Created on : Mar 19, 2025, 4:05:40 PM
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
        <title>Admin | Chi tiết cài đặt</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/sider.css" rel="stylesheet">
        <style>
            .w-100{
                width: 100%;
            }
            .mt-4{
                margin-top: 16px;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3"><jsp:include page="Admin_sidebar.jsp"></jsp:include></div>
                <div class="col-md-9">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/ProjectSWP391/admin/listSettingAdmin">Danh sách cài đặt</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Chi tiết cài đặt</li>
                        </ol>
                    </nav>
                    <div class="header col-md-12">
                        <h1>Chi tiết cài đặt</h1>
                    </div>
                    <div>
                        <h4 style="margin-left: 14px;">${requestScope.message}</h4>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label>
                            <h4>ID/ Mã cài đặt</h4>
                            
                        </label>
                        <input readonly="" type="text" name="pid" class="form-control w-100" value="${settingDetails.id}" />
                    </div>
                    <div class="col-md-5 mb-3">
                        <label>
                            <h4>Tên cài đặt</h4>
                            
                        </label>
                        <input readonly="" type="text" name="pid" class="form-control w-100" value="${settingDetails.name}"/>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>
                            <h4>Thứ tự</h4>
                            
                        </label>
                        <input readonly="" type="text" name="pid" class="form-control w-100" value="${settingDetails.order}"/>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>
                            <h4>Kiểu cài đặt</h4>
                            
                        </label>
                        <input readonly="" type="text" name="pid" class="form-control w-100" value="${settingDetails.type}"/>
                    </div>
                    <div class="col-md-8 mb-3">
                        <label>
                            <h4>Giá trị</h4>
                            
                        </label>
                        <input readonly="" type="text" name="pid" class="form-control w-100" value="${settingDetails.value}" />
                    </div>
                    <div class="col-md-12 mb-3">
                        <label>
                            <h4>Mô tả cài đặt</h4>
                            
                        </label>
                        <textarea readonly="" id="id" name="name" rows="5" cols="10" class="form-control w-100">${settingDetails.description}</textarea>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>
                            <h4>Trạng thái hoạt động:</h4>
                            
                        </label>
                        <input readonly="" type="text" name="pid" class="form-control w-100" value="${settingDetails.isActive == 1 ? "Hoạt động": "Không hoạt động"}"/>
                    </div>
                    <div class="mt-4"></div>
                    <div class="text-left col-md-12 mt-4">
                        <a class="btn btn-primary" href="/ProjectSWP391/admin/manageSettingAdmin?msg=loadEditSetting&sid=${settingDetails.id}">Chỉnh sửa cài đặt</a>
                    </div>
                    


                </div>

            </div>
        </div>
    </body>
</html>
