<%-- 
    Document   : SliderList
    Created on : Feb 10, 2025, 10:02:20 PM
    Author     : naokh
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Slider" %>
<%@ page import="dao.SliderDAO" %>
<html>
          <head>
                    <title>Slider List</title>
                    <style>
                              table {
                                        width: 100%;
                                        border-collapse: collapse;
                              }
                              th, td {
                                        border: 1px solid black;
                                        padding: 8px;
                                        text-align: left;
                              }
                              th {
                                        background-color: #f2f2f2;
                              }
                    </style>
          </head>
          <body>

                    <h2>Slider List</h2>

                    <table>
                              <tr>
                                        <th>ID</th>
                                        <th>Title</th>
                                        <th>Image</th>
                                        <th>Backlink</th>
                                        <th>Status</th>
                                        <th>Notes</th>
                                        <th>Marketing ID</th>
                                        <th>Updated Date</th>
                              </tr>
                              <%
                                  List<Slider> sliders = (List<Slider>) request.getAttribute("sliders");
                                  if (sliders != null) {
                                      for (Slider slider : sliders) {
                              %>
                              <tr>
                                        <td><%= slider.getId() %></td>
                                        <td><%= slider.getTitle() %></td>
                                        <td><img src="<%= slider.getImage() %>" alt="Image" width="100"></td>
                                        <td><a href="<%= slider.getBacklink() %>">Link</a></td>
                                        <td><%= slider.getStatus() == 1 ? "Active" : "Inactive" %></td>
                                        <td><%= slider.getNotes() %></td>
                                        <td><%= slider.getMarketingId() %></td>
                                        <td><%= slider.getUpdatedDate() %></td>
                              </tr>
                              <%
                                      }
                                  }
                              %>
                    </table>

          </body>
</html>
