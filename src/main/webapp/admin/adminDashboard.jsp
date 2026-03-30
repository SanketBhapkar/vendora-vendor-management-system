<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.vendora.model.Vendor" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/adminStyle.css">
</head>

<body>

<div id="wrapper">

    <%@ include file="components/Sidebar.jsp" %>

    <div id="page-content-wrapper">

        <!-- Navbar -->
        <nav class="navbar shadow-sm mb-4 px-3 custom-navbar">
            <span class="fw-bold h3">Admin Dashboard</span>

            <%
                com.vendora.model.User user =
                    (com.vendora.model.User) session.getAttribute("USER");
            %>

            <% if (user != null && "ADMIN".equals(user.getRole())) { %>
                <span class="fw-bold h5">
                    <i class="bi bi-person-circle me-1"></i> <%= user.getUsername() %>
                </span>
            <% } %>
        </nav>

        <!-- Cards -->
        <div class="row g-4 px-3">

            <div class="col-md-4">
                <a href="${pageContext.request.contextPath}/admin/adminDashboard?status=all" class="card-link">
                    <div class="stat-card stat-purple d-flex align-items-center">
                        <div class="icon-box">
                            <i class="bi bi-people"></i>
                        </div>
                        <div class="ms-3">
                            <p>Total Vendors</p>
                            <h3>${totalCount}</h3>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="${pageContext.request.contextPath}/admin/adminDashboard?status=active" class="card-link">
                    <div class="stat-card stat-green d-flex align-items-center">
                        <div class="icon-box">
                            <i class="bi bi-check-circle"></i>
                        </div>
                        <div class="ms-3">
                            <p>Active Vendors</p>
                            <h3>${activeCount}</h3>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-4">
                <a href="${pageContext.request.contextPath}/admin/adminDashboard?status=inactive" class="card-link">
                    <div class="stat-card stat-red d-flex align-items-center">
                        <div class="icon-box">
                            <i class="bi bi-x-circle"></i>
                        </div>
                        <div class="ms-3">
                            <p>Inactive Vendors</p>
                            <h3>${inactiveCount}</h3>
                        </div>
                    </div>
                </a>
            </div>

        </div>

        <!-- Search -->
        <div class="px-3 mt-4">
            <form action="${pageContext.request.contextPath}/admin/adminDashboard"
                  method="get"
                  class="row g-3 search-box">

                <div class="col-md-5">
                    <input type="text"
                           name="search"
                           class="form-control custom-input"
                           placeholder="Search vendor by name..."
                           value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
                </div>

                <div class="col-md-2">
                    <button type="submit" class="btn custom-btn w-100">
                        <i class="bi bi-search"></i> Search
                    </button>
                </div>

                <div class="col-md-2">
                    <a href="${pageContext.request.contextPath}/admin/adminDashboard"
                       class="btn reset-btn w-100">
                        Reset
                    </a>
                </div>

            </form>
        </div>

        <!-- Vendor Table -->
        <%
            List<Vendor> vendorList =
                    (List<Vendor>) request.getAttribute("vendorList");
        %>

        <div class="px-3 mt-4 table-container">
            <div class="table-responsive">
                <table class="custom-table align-middle">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Status</th>
                        <th width="200">Actions</th>
                    </tr>
                    </thead>

                    <tbody>

                    <%
                        if (vendorList != null && !vendorList.isEmpty()) {
                            for (Vendor v : vendorList) {
                    %>

                    <tr>
                        <td><%= v.getId() %></td>
                        <td><%= v.getName() %></td>
                        <td><%= v.getCategory() %></td>

                        <td>
                            <% if("ACTIVE".equals(v.getStatus())) { %>
                                <span class="badge bg-success">Active</span>
                            <% } else { %>
                                <span class="badge bg-danger">Inactive</span>
                            <% } %>
                        </td>

                        <td>
                            <a href="${pageContext.request.contextPath}/admin/editVendor?id=<%= v.getId() %>"
                               class="btn btn-sm btn-primary">
                                <i class="bi bi-pencil"></i>
                            </a>

                            <% if("ACTIVE".equals(v.getStatus())) { %>
                                <a href="${pageContext.request.contextPath}/admin/deleteVendor?id=<%= v.getId() %>"
                                   class="btn btn-sm btn-danger"
                                   onclick="return confirm('Are you sure you want to delete this vendor?');">
                                    <i class="bi bi-trash"></i>
                                </a>
                            <% } else { %>
                                <a href="${pageContext.request.contextPath}/admin/restoreVendor?id=<%= v.getId() %>"
                                   class="btn btn-sm btn-success">
                                    <i class="bi bi-arrow-counterclockwise"></i>
                                </a>
                            <% } %>
                        </td>
                    </tr>

                    <%
                            }
                        } else {
                    %>

                    <tr>
                        <td colspan="5" class="text-center text-muted">
                            No vendors found
                        </td>
                    </tr>

                    <%
                        }
                    %>

                    </tbody>
                </table>
            </div>
        </div>

        <%@ include file="components/Footer.jsp" %>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>