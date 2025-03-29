<%-- 
    Document   : Admin_editSetting
    Created on : Mar 19, 2025, 4:09:48 PM
    Author     : tiend
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Admin | Sửa cài đặt</title>

      <!-- Bootstrap & Icons -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
      <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

      <style>
         :root {
            --teal-primary: #26a69a;
            --teal-light: #80cbc4;
            --teal-dark: #00897b;
            --teal-bg: #e0f2f1;
            --teal-text: #004d40;
            --teal-card: #ffffff;
            --teal-accent: #b2dfdb;
         }

         body {
            background-color: var(--teal-bg);
            color: var(--teal-text);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
         }

         .dashboard-container {
            display: flex;
            min-height: 100vh;
         }

         .main-content {
            flex: 1;
            padding: 20px;
            background-color: var(--teal-bg);
         }

         .panel {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 20px;
            border: 1px solid var(--teal-accent);
            padding: 20px;
         }

         .panel-heading {
            background-color: var(--teal-primary);
            color: white;
            padding: 15px 20px;
            border-radius: 8px 8px 0 0;
            font-weight: 600;
         }

         .btn-primary {
            background-color: var(--teal-primary);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
         }

         .btn-primary:hover {
            background-color: var(--teal-dark);
         }

         .btn-secondary {
            background-color: #6c757d;
            color: white;
         }

         .btn-secondary:hover {
            background-color: #5a6268;
            color: white;
         }

         .form-control {
            border: 1px solid var(--teal-light);
            border-radius: 4px;
            padding: 8px 12px;
            margin-bottom: 15px;
         }

         .form-label {
            font-weight: 600;
            margin-bottom: 8px;
            display: block;
         }

         .breadcrumb {
            background-color: var(--teal-light);
            padding: 8px 15px;
            border-radius: 4px;
         }

         .breadcrumb-item.active {
            color: var(--teal-text);
            font-weight: 500;
         }

         @media (max-width: 768px) {
            .dashboard-container {
               flex-direction: column;
            }

            .form-row > div {
               margin-bottom: 15px;
            }
         }
      </style>
   </head>
   <body>
      <div class="dashboard-container">
         <!-- Sidebar -->
         <div style="min-width: 250px;">
            <jsp:include page="Admin_sidebar.jsp"></jsp:include>
            </div>

            <!-- Main Content -->
            <div class="main-content">
               <nav aria-label="breadcrumb" class="mb-4">
                  <ol class="breadcrumb">
                     <li class="breadcrumb-item"><a href="/ProjectSWP391/admin/listSettingAdmin">Danh sách cài đặt</a></li>
                     <li class="breadcrumb-item active" aria-current="page">Sửa cài đặt</li>
                  </ol>
               </nav>

               <div class="panel">
                  <header class="panel-heading">Sửa cài đặt</header>
                  <div class="panel-body">
                     <form id="myForm" action="/ProjectSWP391/admin/manageSettingAdmin" method="post">
                        <input type="hidden" name="msg" value="editSetting"/>
                        <input type="hidden" name="sid" value="${setting.id}"/>

                     <div class="row">
                        <div class="col-md-12">
                           <label class="form-label">Mã cài đặt:</label>
                           <input value="${setting.id}" readonly class="form-control">
                        </div>
                     </div>

                     <div class="row">
                        <div class="col-md-6">
                           <label class="form-label">Kiểu cài đặt:</label>
                           <select required class="form-control" name="type">
                              <c:forEach items="${requestScope.listType}" var="listType">
                                 <option value="${listType.type}" ${setting.type == listType.type ? 'selected' : ''}>
                                    ${listType.type}
                                 </option>
                              </c:forEach>
                           </select>
                        </div>

                        <div class="col-md-6">
                           <label class="form-label">Tên cài đặt:</label>
                           <input value="${setting.name}" required type="text" name="sName" class="form-control">
                        </div>
                     </div>

                     <div class="row">
                        <div class="col-md-4">
                           <label class="form-label">Giá trị:</label>
                           <input value="${setting.value}" required type="text" name="value" class="form-control">
                        </div>

                        <div class="col-md-4">
                           <label class="form-label">Thứ tự:</label>
                           <input value="${setting.order}" required type="text" name="order" class="form-control" 
                                  pattern="^\d+(\.\d+)?$" title="Vui lòng nhập số">
                        </div>

                        <div class="col-md-4">
                           <label class="form-label">Trạng thái hoạt động:</label>
                           <select required class="form-control" name="status">
                              <option value="1" ${setting.isActive == 1 ? 'selected' : ''}>Hoạt động</option>
                              <option value="0" ${setting.isActive == 0 ? 'selected' : ''}>Không hoạt động</option>
                           </select>
                        </div>
                     </div>

                     <div class="row">
                        <div class="col-12">
                           <label class="form-label">Mô tả cài đặt:</label>
                           <textarea required name="description" rows="5" class="form-control">${setting.description}</textarea>
                        </div>
                     </div>

                     <div class="row mt-4">
                        <div class="col-12 text-end">
                           <a class="btn btn-secondary me-2" href="/ProjectSWP391/admin/listSettingAdmin">Hủy bỏ</a>
                           <button id="confirmButton" class="btn btn-primary" type="submit">
                              <i class="bi bi-pencil-square"></i> Cập nhật cài đặt
                           </button>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>

      <script>
         document.getElementById("confirmButton").addEventListener("click", function (event) {
            event.preventDefault();
            const isConfirmed = confirm("Bạn có chắc muốn sửa cài đặt này?");
            if (isConfirmed) {
               document.getElementById("myForm").submit();
            }
         });
      </script>

      <!-- Bootstrap JS -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
   </body>
</html>