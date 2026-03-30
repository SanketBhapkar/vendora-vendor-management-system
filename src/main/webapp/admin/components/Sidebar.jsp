<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Set currentPage attribute from each JSP before including sidebar
    // Example: request.setAttribute("currentPage", "dashboard");
    String currentPage = (String) request.getAttribute("currentPage");
%>

<div id="sidebar-wrapper">
    <div class="sidebar-header text-center py-4">
        <h4>Vendora</h4>
        <small>Admin Panel</small>
    </div>

    <div class="list-group">

        <a href="${pageContext.request.contextPath}/admin/adminDashboard"
           class="list-group-item list-group-item-action <%= "dashboard".equals(currentPage) ? "active" : "" %>">
            <i class="bi bi-speedometer2 me-2"></i> Dashboard
        </a>

        <a href="${pageContext.request.contextPath}/admin/addVendor"
           class="list-group-item list-group-item-action <%= "addVendor".equals(currentPage) ? "active" : "" %>">
            <i class="bi bi-plus-circle me-2"></i> Add Vendor
        </a>

        <a href="${pageContext.request.contextPath}/admin/viewUsers"
           class="list-group-item list-group-item-action <%= "users".equals(currentPage) ? "active" : "" %>">
            <i class="bi bi-people me-2"></i> Manage Users
        </a>

        <a href="${pageContext.request.contextPath}/admin/hireRequests"
           class="list-group-item list-group-item-action <%= "hireRequests".equals(currentPage) ? "active" : "" %>">
            <i class="bi bi-person-check me-2"></i> Hire Requests
        </a>

        <a href="${pageContext.request.contextPath}/admin/viewMessages"
           class="list-group-item list-group-item-action <%= "messages".equals(currentPage) ? "active" : "" %>">
            <i class="bi bi-envelope me-2"></i> Contact Messages
        </a>

        <a href="${pageContext.request.contextPath}/admin/viewFeedback"
           class="list-group-item list-group-item-action <%= "feedback".equals(currentPage) ? "active" : "" %>">
            <i class="bi bi-chat-dots me-2"></i> Feedback
        </a>

        <a href="${pageContext.request.contextPath}/logout"
           class="list-group-item list-group-item-action text-danger">
            <i class="bi bi-box-arrow-right me-2"></i> Logout
        </a>

    </div>
</div>