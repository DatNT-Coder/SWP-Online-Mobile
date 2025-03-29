<%-- 
    Document   : Admin_viewSetting
    Created on : Mar 19, 2025, 4:05:40 PM
    Author     : tiend
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Admin | Chi tiết cài đặt</title>

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

         .form-control {
            border: 1px solid var(--teal-light);
            border-radius: 4px;
            padding: 8px 12px;
            margin-bottom: 15px;
            background-color: #f8f9fa;
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

         .status-active {
            color: #28a745;
            font-weight: 500;
         }

         .status-inactive {
            color: #dc3545;
            font-weight: 500;
         }

         @media (max-width: 768px) {
            .dashboard-container {
               flex-direction: column;
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
                     <li class="breadcrumb-item active" aria-current="page">Chi tiết cài đặt</li>
                  </ol>
               </nav>

               <div class="panel">
                  <header class="panel-heading">Chi tiết cài đặt</header>
                  <div class="panel-body">
                     <c:if test="${not empty requestScope.message}">
                     <div class="alert alert-info mb-4">
                        ${requestScope.message}
                     </div>
                  </c:if>

                  <div class="row">
                     <div class="col-md-3">
                        <label class="form-label">ID/Mã cài đặt</label>
                        <input readonly type="text" class="form-control" value="${settingDetails.id}"/>
                     </div>

                     <div class="col-md-5">
                        <label class="form-label">Tên cài đặt</label>
                        <input readonly type="text" class="form-control" value="${settingDetails.name}"/>
                     </div>

                     <div class="col-md-4">
                        <label class="form-label">Thứ tự</label>
                        <input readonly type="text" class="form-control" value="${settingDetails.order}"/>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-md-4">
                        <label class="form-label">Kiểu cài đặt</label>
                        <input readonly type="text" class="form-control" value="${settingDetails.type}"/>
                     </div>

                     <div class="col-md-8">
                        <label class="form-label">Giá trị</label>
                        <input readonly type="text" class="form-control" value="${settingDetails.value}"/>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-12">
                        <label class="form-label">Mô tả cài đặt</label>
                        <textarea readonly rows="5" class="form-control">${settingDetails.description}</textarea>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-md-4">
                        <label class="form-label">Trạng thái hoạt động</label>
                        <input readonly type="text" class="form-control ${settingDetails.isActive == 1 ? 'status-active' : 'status-inactive'}" 
                               value="${settingDetails.isActive == 1 ? 'Hoạt động' : 'Không hoạt động'}"/>
                     </div>
                  </div>

                  <div class="row mt-4">
                     <div class="col-12 text-end">
                        <a class="btn btn-primary" href="/ProjectSWP391/admin/manageSettingAdmin?msg=loadEditSetting&sid=${settingDetails.id}">
                           <i class="bi bi-pencil-square"></i> Chỉnh sửa cài đặt
                        </a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>

      <!-- Bootstrap JS -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
   </body>
</html>