<%-- 
    Document   : PostList
    Created on : Feb 18, 2025, 11:01:01 PM
    Author     : naokh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.BlogPostDAO"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List, model.BlogPost" %>
<%
    List<BlogPost> posts = (List<BlogPost>) request.getAttribute("posts");
%>

<!DOCTYPE html>
<html>
   <head>
      <title>Post List</title>
      <link href="css/PostListStyle.css" rel="stylesheet">
   </head>
   <body>
      <h2>Blog Posts</h2>
      <button onclick="$('#addPostModal').show()">Add New Post</button>

      <label for="searchField">Search By:</label>
      <select id="searchField">
         <option value="1">Title</option>   <!-- Column index in the table (0-based) -->
         <option value="2">Brief Info</option>
         <option value="0">ID</option>
      </select>
      <input type="text" id="searchQuery" placeholder="Enter search text">
      <button onclick="filterTable()">Search</button>
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


      <div id="addPostModal" style="display:none;">
         <h3>Add New Post</h3>
         <form action="PostList" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="add">
            <label>Title:</label> <input type="text" name="title" required><br>
            <label>Brief Info:</label> <input type="text" name="briefInfo"><br>
            <label>Thumbnail:</label> <input type="file" name="thumbnail"><br>
            <label>Details:</label> <textarea name="details"></textarea><br>
            <button type="submit">Add Post</button>
         </form>
      </div>

      <div id="postDetails">
         <h3>Post Details</h3>
         <p id="detailTitle"></p>
         <p id="detailBrief"></p>
         <img id="detailThumbnail" src="" width="100">
         <p id="detailContent"></p>
         <button id="saveChanges" style="display:none;">Save Changes</button>
      </div>

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
   </body>
</html>
