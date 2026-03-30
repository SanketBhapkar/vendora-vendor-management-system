<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.vendora.model.HireRequest" %>

<%
    List<HireRequest> hireList =
        (List<HireRequest>) request.getAttribute("hireList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hire Requests</title>

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
            <span class="fw-bold h3">Hire Requests</span>
        </nav>

        <!-- Search / Filter (Optional) -->
        <div class="px-3 mb-4">
            <form action="${pageContext.request.contextPath}/admin/hireRequests" method="get" class="row g-3 search-box">

                <div class="col-md-5">
                    <input type="text"
                           name="search"
                           class="form-control custom-input"
                           placeholder="Search hire request by user or vendor..."
                           value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
                </div>

                <div class="col-md-2">
                    <button type="submit" class="btn custom-btn w-100">
                        <i class="bi bi-search"></i> Search
                    </button>
                </div>

                <div class="col-md-2">
                    <a href="${pageContext.request.contextPath}/admin/hireRequests"
                       class="btn reset-btn w-100">
                        Reset
                    </a>
                </div>

            </form>
        </div>

        <!-- Hire Requests Table -->
        <div class="px-3 table-container">
            <div class="table-responsive">
                <table class="custom-table align-middle">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>User</th>
                            <th>Email</th>
                            <th>Vendor</th>
                            <th>Category</th>
                            <th>Status</th>
                            <th width="180">Action</th>
                        </tr>
                    </thead>

                    <tbody>
                    <%
                        if (hireList != null && !hireList.isEmpty()) {
                            for (HireRequest hr : hireList) {
                    %>
                        <tr>
                            <td><%= hr.getId() %></td>
                            <td><%= hr.getUsername() %></td>
                            <td><%= hr.getEmail() %></td>
                            <td><%= hr.getVendorName() %></td>
                            <td><%= hr.getCategory() %></td>

                            <!-- Status Badge -->
                            <td>
                                <% if("PENDING".equals(hr.getStatus())) { %>
                                    <span class="badge bg-warning text-dark">Pending</span>
                                <% } else if("APPROVED".equals(hr.getStatus())) { %>
                                    <span class="badge bg-success">Approved</span>
                                <% } else { %>
                                    <span class="badge bg-danger">Rejected</span>
                                <% } %>
                            </td>

                            <!-- Actions -->
                            <td class="d-flex gap-2 align-items-center">
                                <% if("PENDING".equals(hr.getStatus())) { %>

                                    <a href="${pageContext.request.contextPath}/admin/updateHireStatus?id=<%= hr.getId() %>&status=APPROVED"
                                       class="btn btn-sm custom-btn">
                                        <i class="bi bi-check-circle"></i>
                                    </a>

                                    <a href="${pageContext.request.contextPath}/admin/updateHireStatus?id=<%= hr.getId() %>&status=REJECTED"
                                       class="btn btn-sm btn-danger">
                                        <i class="bi bi-x-circle"></i>
                                    </a>

                                <% } else { %>
                                    <span class="text-muted">No Action</span>
                                <% } %>
                            </td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="7" class="text-center text-muted">
                                No hire requests found
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