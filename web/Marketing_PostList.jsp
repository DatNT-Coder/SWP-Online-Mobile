<%-- 
    Document   : PostList
    Created on : Feb 18, 2025, 11:01:01 PM
    Author     : naokh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.BlogPostDAO"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List, model.BlogPost" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- DataTables CSS -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
<!-- jQuery (Required for DataTables) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>



<%
    List<BlogPost> posts = (List<BlogPost>) request.getAttribute("posts");
%>
<link href="https://cdn.datatables.net/2.2.2/css/dataTables.dataTables.css" rel="stylesheet">

<!DOCTYPE html>
<html>
   <head>
      <title>Post List</title>
      <link href="css/PostListStyle.css" rel="stylesheet">
      <link href="css/main.css" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/lelinh014756/fui-toast-js@master/assets/css/toast@1.0.1/fuiToast.min.css">
   </head>
   <body>
      <h2>Blog Posts</h2>
      <table id="postTable">
         <thead>
            <tr>
               <th>ID</th>
               <th>CatID</th>
               <th>Title</th>
               <th>Brief Info</th>
               <th>Thumbnail</th>
               <th>Updated Date</th>
               <th>Actions</th>
            </tr>
         </thead>
         <tbody>
            <% for (BlogPost post : posts) { %>
            <tr id="post.<%= post.getId() %>">
               <td><%= post.getId() %></td>
               <td><%= post.getPostCategories_id() %></td>
               <td><%= post.getTitle() %></td>
               <td><%= post.getBrief_info() %></td>
               <td><img src="<%= post.getThumbnail() %>" width="50"></td>
               <td><%= post.getUpdatedDate() %></td>
               <td>
                  <button onclick="viewPost(<%= post.getId() %>)">View</button>
                  <button onclick="editPost(<%= post.getId() %>)">Edit</button>
                  <button onclick="toggleStatus(<%= post.getId() %>, <%= post.getStatus() %>)">
                     <%= post.getStatus() == 1 ? "Hide" : "Show" %>
                  </button>
               </td>
            </tr>
            <% } %>
         </tbody>
      </table>
      <section>
         <div class="container">
            <div class="row">
               <div class="col-sm-4">
                  <h2>Add New Post</h2>

                  <form action="PostList?action=add" method="post" enctype="multipart/form-data">
                     <input type="hidden" name="action" value="add">

                     <label>Title:</label>
                     <input type="text" name="title" required>

                     <label>Brief Info:</label>
                     <textarea name="brief_info" required></textarea>

                     <label>Details:</label>
                     <textarea name="details" required></textarea> 

                     <label>Thumbnail:</label>
                     <input type="file" name="thumbnail">

                     <label>Category:</label>
                     <select name="PostCategories_id">
                        <c:forEach var="category" items="${categories}">
                           <option value="${category.id}">${category.name}</option>
                        </c:forEach>
                     </select>

                     <label>User ID:</label>
                     <input type="number" name="User_id" required>

                     <label>Feature:</label>
                     <input type="checkbox" name="Flag_feature" value="true">

                     <label>Status:</label>
                     <select name="status">
                        <option value="1">Active</option>
                        <option value="0">Inactive</option>
                     </select>
                     <button type="submit">Add Post</button>
                  </form>
               </div>
               <div class="col-sm-8">
                  <h2>Add New Post</h2>
               </div 
            </div>
         </div>
      </section>
      <script>
         $(document).ready(function () {
            $('#postTable').DataTable({
               "pageLength": 5,
               "order": [[4, "asc"]]
            });
         });

         function viewPost(postId) {
            fetch("PostList?action=view&id=" + postId)
                    .then(response => response.json())
                    .then(post => {
                       document.getElementById("detailTitle").innerText = post.title;
                       document.getElementById("detailBrief").innerText = post.brief_info;
                       document.getElementById("detailThumbnail").src = post.thumbnail;
                       document.getElementById("detailContent").innerText = post.details;
                       document.getElementById("saveChanges").style.display = "none";
                    });
         }

         function editPost(postId) {
            fetch("PostList?action=view&id=" + postId)
                    .then(response => response.json())
                    .then(post => {
                       document.getElementById("detailTitle").innerHTML = `<input type='text' id='editTitle' value='${post.title}'>`;
                       document.getElementById("detailBrief").innerHTML = `<input type='text' id='editBrief' value='${post.brief_info}'>`;
                       document.getElementById("detailThumbnail").src = post.thumbnail;
                       document.getElementById("detailContent").innerHTML = `<textarea id='editDetails'>${post.details}</textarea>`;
                       document.getElementById("saveChanges").style.display = "block";
                       document.getElementById("saveChanges").onclick = function () {
                          savePost(postId);
                       };
                    });
         }

         function savePost(postId) {
            let title = document.getElementById("editTitle").value;
            let briefInfo = document.getElementById("editBrief").value;
            let details = document.getElementById("editDetails").value;

            fetch("PostList?action=update", {
               method: "POST",
               headers: {"Content-Type": "application/x-www-form-urlencoded"},
               body: `id=${postId}&title=${title}&briefInfo=${briefInfo}&details=${details}`
            })
                    .then(response => response.json())
                    .then(data => {
                       if (data.success) {
                          location.reload();
                       } else {
                          alert("Failed to update post.");
                       }
                    }).catch(error => console.error("Error:", error));

         }

         function toggleStatus(postId, status) {
            fetch("PostList?action=hide&id=" + postId, {method: "POST"})
                    .then(() => document.getElementById("post_" + postId).remove());
         }

      </script>
      <script>
         $(document).ready(function () {
            var table = $('#postTable').DataTable(); // Initialize DataTable

            window.filterTable = function () {
               var columnIndex = $('#searchField').val(); // Get selected column index
               var query = $('#searchQuery').val(); // Get search query

               table.columns().search(''); // Clear all previous filters
               table.column(columnIndex).search(query).draw(); // Apply new search
            };
         });
      </script>
      <script>
         // Toggle between file input and URL input
         document.getElementById("thumbnailUrlInput").addEventListener("input", function () {
            if (this.value) {
               document.getElementById("thumbnailFileInput").disabled = true; // Disable file upload if URL is provided
            } else {
               document.getElementById("thumbnailFileInput").disabled = false; // Enable file upload if URL is cleared
            }
         });
      </script>
   </body>
</html>
