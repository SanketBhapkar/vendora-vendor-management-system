<%@ page import="com.vendora.model.Vendor" %>
<%
    Vendor v = (Vendor) request.getAttribute("vendor");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Edit Vendor</title>

<!-- Bootstrap & Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css" rel="stylesheet">

<!-- Custom Styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/adminStyle.css">

<style>
/* Form container to match dashboard cards */
.form-container {
    background: rgba(255,255,255,0.05);
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.3);
}

/* Inputs same as custom-input */
.form-container .custom-input {
    background: rgba(255,255,255,0.1);
    color: white;
    border: none;
}

.form-container .custom-input::placeholder {
    color: #94a3b8;
}

/* Button consistent with dashboard */
.custom-btn {
    background: #3b82f6;
    border: none;
    transition: 0.3s;
}

.custom-btn:hover {
    background: #2563eb;
    opacity: 1;
}
</style>

</head>
<body>

<div id="wrapper">

    <%@ include file="components/Sidebar.jsp" %>

    <!-- Page Content -->
    <div id="page-content-wrapper">

        <!-- Navbar -->
        <nav class="navbar shadow-sm mb-4 px-3 custom-navbar">
            <span class="fw-bold h3">Edit Vendor</span>
        </nav>

        <!-- Form -->
        <div class="px-3 mt-4">
            <div class="form-container mx-auto" style="max-width: 600px;">
                <h4 class="mb-4 text-center">Update Vendor Details</h4>

                <form action="${pageContext.request.contextPath}/admin/updateVendor" method="post">

                    <!-- Hidden ID -->
                    <input type="hidden" name="id" value="<%= v.getId() %>">

                    <input type="text" name="name" class="custom-input mb-3 form-control"
                           placeholder="Vendor Name" value="<%= v.getName() %>" required>

                    <input type="text" name="category" class="custom-input mb-3 form-control"
                           placeholder="Category" value="<%= v.getCategory() %>" required>

                    <input type="text" name="phone" class="custom-input mb-3 form-control"
                           placeholder="Phone" value="<%= v.getPhone() %>">

                    <input type="email" name="email" class="custom-input mb-3 form-control"
                           placeholder="Email" value="<%= v.getEmail() %>">

                    <input type="text" name="address" class="custom-input mb-3 form-control"
                           placeholder="Address" value="<%= v.getAddress() %>">

                    <textarea name="description" class="custom-input mb-3 form-control"
                              placeholder="Description"><%= v.getDescription() %></textarea>

                    <button type="submit" class="custom-btn w-100">Update Vendor</button>

                </form>
            </div>
        </div>

        <!-- Footer -->
        <%@ include file="components/Footer.jsp" %>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>