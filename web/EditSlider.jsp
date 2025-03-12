<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Edit Slider | EShopee</title>

      <link rel="apple-touch-icon" sizes="180x180"
            href="assets/img/favicon_io/apple-touch-icon.png">
      <link rel="icon" type="image/png" sizes="32x32"
            href="assets/img/favicon_io/favicon-32x32.png">
      <link rel="icon" type="image/png" sizes="16x16"
            href="assets/img/favicon_io/favicon-16x16.png">
      <link rel="manifest" href="/site.webmanifest">
      <!-- Bootstrap icons-->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
      <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
      <link href="css/nucleo-icons.css" rel="stylesheet" />
      <link href="css/nucleo-svg.css" rel="stylesheet" />
      <link id="pagestyle" href="css/material-kit.css?v=3.0.0"
            rel="stylesheet" />


      <!-- Font Awesome -->
      <link
         rel="stylesheet"
         href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
         />
      <!-- Google Fonts Roboto -->
      <link
         rel="stylesheet"
         href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"
         />
      <%@include file="base-view/baseTag.jsp" %>
   </head>

   <style>
      .img-fluid {
         max-width: 500px;
         height: auto;
      }
   </style>

   <body>

      <main class="container pt-8">
         <h1>Edit Slider</h1>
         <div class ="row mt-5">
            <div class="mb-3 mx-auto d-block shadow p-3 mb-5 bg-white rounded" style="padding: 10px 0px 10px 10px; border-radius: 8px; width: 32%; margin-left: 10px; width: 100% !important">

               <form action="edit-slider" enctype="multipart/form-data" method="post" class="container row mx-auto" >
                  <img src="images/slider/${requestScope.slider.image}" alt="alt" width="200px" height="200px"/>
                  <div class="my-3 col-1">
                     <b>Slider ID: <input type="text" class="form-control" id="id" name="sliderId" placehutolder="Slider ID"
                                          value="${requestScope.slider.id}" readonly></b>
                  </div>
                  <div class="my-3 col-1">
                     <b>Owner: <input type="text" class="form-control" id="subId" name="subId" placehutolder="Sub ID"
                                      value="${requestScope.slider.marketingId}"></b>
                  </div>
                  <div class="my-3 col-7">
                     <b>Title: <input type="text" class="form-control" id="title" name="title" placeholder="Slider Title"
                                      value="${requestScope.slider.title}"></b>
                  </div>
                  <div class="mb-3 col-3 ps-5">                                
                     <br><br>
                     <b>Status: <input type="radio" name="status" value="1" class="mx-2 my-1" ${requestScope.slider.status == 1?"checked":""}/>Active
                        <input type="radio" name="status" value="0" class="mx-2 my-1" ${requestScope.slider.status == 0?"checked":""}/>Inactive</b>
                  </div>

                  <div class="mb-3">
                     <b>Slider Image: 
                        <input type="file" class="form-control" name="image" placeholder="Slider Image" accept="image/*" ></b>
                  </div>
                  <div class="mb-3 col-6">
                     <b>Backlink: <br><textarea name="backlink" rows="3" style="width: 100%" placeholder="Slider Content">${requestScope.slider.backlink}</textarea></b>
                  </div>

                  <div class="mb-3 col-6">                                
                     <b>Notes: <br><textarea name="notes" rows="3" style="width: 100%" placeholder="Slider Notes">${requestScope.slider.notes}</textarea></b>
                  </div>
                  <div class="text-center mt-5">
                     <input type="submit" name="Edit" class="btn btn-success">
                  </div>
               </form>
            </div><br>

         </div>
         <div class="form-row">
            <div class="form-group col-md-12">
               <a href="${sessionScope.backlink}" class="btn btn-danger" style="float: right !important">Back</a>
            </div>
         </div>
      </main>




      <%@include file="base-view/footer.jsp" %>
   </body>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>


</html>
