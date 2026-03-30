<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.vendora.model.Feedback" %>

<%
    List<Feedback> feedbackList = (List<Feedback>) request.getAttribute("feedbackList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Users Feedback</title>

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
            <span class="fw-bold h3">Users Feedback</span>
        </nav>

        <!-- Feedback Table -->
        <div class="px-3 table-container">
            <div class="table-responsive">
                <table class="custom-table align-middle">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>User ID</th>
                            <th>Message</th>
                            <th>Date</th>
                        </tr>
                    </thead>

                    <tbody>
                    <%
                        if (feedbackList != null && !feedbackList.isEmpty()) {
                            for (Feedback f : feedbackList) {
                    %>
                        <tr>
                            <td><%= f.getId() %></td>
                            <td><%= f.getUserId() %></td>
                            <td><%= f.getMessage() %></td>
                            <td><%= f.getCreatedAt() %></td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="4" class="text-center text-muted">
                                No feedback found
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