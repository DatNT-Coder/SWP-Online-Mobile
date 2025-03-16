<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Marketing Dashboard | E-Shopper</title>
      <link rel="stylesheet" href="css/main.css"/>
      <link rel="stylesheet" href="css/styles.css">
      <link rel="stylesheet" href="css/datatable.css">
   </head>
   <body>
      <div class="container-fluid">
         <div class="row">
            <!-- Sidebar -->
            <div class="col-md-2">
               <jsp:include page="sidebar.jsp"></jsp:include>
            </div>
            <!-- Dashboard MainContent -->
            <div class="card mb-4">
               <div class="card-body">
                  <form class="p d-flex col-md-4" style="width: 100%; float: right !important" action="MarketingDashboard?page=${requestScope.page}" method="get">
                  
                     
                  </form>
               </div>
            </div>
         </div>
      </div>
      <!-- Sidebar -->

   <!-- Dashboard Content -->

</body>
</html>