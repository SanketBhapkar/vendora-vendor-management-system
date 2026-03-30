<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.vendora.model.Contact" %>

<%
    List<Contact> messageList = (List<Contact>) request.getAttribute("messageList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Messages</title>

    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css" rel="stylesheet">

    <!-- Custom Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/adminStyle.css">
</head>

<body>

<div id="wrapper">

   <%@ include file="components/Sidebar.jsp" %>
   
   <!-- Page Content -->
   <div id="page-content-wrapper">

       <!-- Navbar -->
       <nav class="navbar shadow-sm mb-4 px-3 custom-navbar">
           <span class="fw-bold h3">Contact Messages</span>
       </nav>

       <!-- Table -->
       <div class="px-3 table-container">
           <div class="table-responsive">
               <table class="custom-table align-middle">
                   <thead>
                       <tr>
                           <th>ID</th>
                           <th>Name</th>
                           <th>Phone</th>
                           <th>Email</th>
                           <th>Message</th>
                           <th>Date</th>
                           <th width="120">Action</th>
                       </tr>
                   </thead>

                   <tbody>
                   <%
                       if (messageList != null && !messageList.isEmpty()) {
                           for (Contact c : messageList) {
                   %>
                       <tr>
                           <td><%= c.getId() %></td>
                           <td><%= c.getName() %></td>
                           <td><%= c.getPhone() %></td>
                           <td><%= c.getEmail() %></td>
                           <td><%= c.getMessage() %></td>
                           <td><%= c.getCreatedAt() %></td>

                           <td class="d-flex gap-2 align-items-center">
                               <a href="${pageContext.request.contextPath}/deleteMessage?id=<%= c.getId() %>"
                                  class="btn btn-sm btn-danger"
                                  onclick="return confirm('Delete this message?');">
                                   <i class="bi bi-trash"></i>
                               </a>
                           </td>
                       </tr>
                   <%
                           }
                       } else {
                   %>
                       <tr>
                           <td colspan="7" class="text-center text-muted">
                               No messages found
                           </td>
                       </tr>
                   <%
                       }
                   %>
                   </tbody>
               </table>
           </div>
       </div>

       <!-- Footer -->
       <%@ include file="components/Footer.jsp" %>

   </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>