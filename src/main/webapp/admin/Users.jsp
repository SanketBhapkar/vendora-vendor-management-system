<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, com.vendora.model.User" %>

<%
    List<User> userList = (List<User>) request.getAttribute("userList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Manage Users</title>

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
            <span class="fw-bold h3">Manage Users</span>
        </nav>

        <!-- Search / Filter -->
        <div class="px-3 mb-4">
            <form action="${pageContext.request.contextPath}/admin/viewUsers"
                  method="get"
                  class="row g-3 search-box">

                <div class="col-md-5">
                    <input type="text"
                           name="search"
                           class="form-control custom-input"
                           placeholder="Search user by username/email"
                           value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
                </div>

                <div class="col-md-2">
                    <button type="submit" class="btn custom-btn w-100">
                        <i class="bi bi-search"></i> Search
                    </button>
                </div>

                <div class="col-md-2">
                    <a href="${pageContext.request.contextPath}/admin/viewUsers"
                       class="btn reset-btn w-100">
                        Reset
                    </a>
                </div>

            </form>
        </div>

        <!-- Users Table -->
        <div class="px-3 table-container">
            <div class="table-responsive">
                <table class="custom-table align-middle">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>User Name</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Created At</th>
                            <th width="200">Actions</th>
                        </tr>
                    </thead>

                    <tbody>
                    <%
                        if (userList != null && !userList.isEmpty()) {
                            for (User u : userList) {
                    %>
                        <tr>
                            <td><%= u.getId() %></td>
                            <td><%= u.getUsername() %></td>
                            <td><%= u.getEmail() %></td>

                            <!-- Role Badge -->
                            <td>
                                <% if ("ADMIN".equals(u.getRole())) { %>
                                    <span class="badge bg-dark">Admin</span>
                                <% } else { %>
                                    <span class="badge bg-primary">User</span>
                                <% } %>
                            </td>

                            <td><%= u.getCreatedAt() %></td>

                            <!-- Actions -->
                            <td class="d-flex gap-2 align-items-center">
                                <% if ("ADMIN".equals(u.getRole())) { %>
                                    <span class="text-white">Protected</span>
                                <% } else { %>
                                    <a href="${pageContext.request.contextPath}/admin/deleteUser?id=<%= u.getId() %>"
                                       class="btn btn-sm btn-danger"
                                       onclick="return confirm('Are you sure you want to delete this user?');">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                <% } %>
                            </td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="6" class="text-center text-muted">
                                No users found
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