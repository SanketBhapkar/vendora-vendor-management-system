<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vendor Details</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
  <link rel="icon" href="${pageContext.request.contextPath}/images/illustration/S image.jpeg" type="image/x-icon">
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

</head>
<body>

<%@ page import="com.vendora.model.Vendor" %>
<%
Vendor vendor = (Vendor) request.getAttribute("vendor");
%>



<%@ include file="components/header.jsp" %>
<section class="container py-5">
    <div class="vendor-card-modern">

        <div class="row g-0 align-items-center">

            <!-- Image -->
            <div class="col-md-4">
                <div class="image-wrapper">
                    <img src="<%= vendor.getImageUrl() %>" 
                         class="vendorimage" 
                         alt="Vendor Image">
                </div>
            </div>

            <!-- Details -->
            <div class="col-md-8 p-4">

                <div class="d-flex justify-content-between align-items-start">
                    <div>
                        <h3 class="vendor-name mb-3"><%= vendor.getName() %></h3>
                        <span class="category rounded-pill px-3 py-1 mb-2">
                            <%= vendor.getCategory() %>
                        </span>
                    </div>
                </div>

                <div class="vendor-info mt-3">
                    <p><i class="bi bi-telephone-fill"></i> <%= vendor.getPhone() %></p>
                    <p><i class="bi bi-envelope-fill"></i> <%= vendor.getEmail() %></p>
                    <p><i class="bi bi-geo-alt-fill"></i> <%= vendor.getAddress() %></p>
                </div>

                <p class="vendor-desc mt-3">
                    <%= vendor.getDescription() %>
                </p>

                <a href="${pageContext.request.contextPath}/hireVendor?id=<%= vendor.getId() %>"
                   class="buttons d-block text-center mt-3">
                   Hire Now
                </a>

            </div>

        </div>

    </div>
</section>

<%@ include file="components/footer.jsp" %>



  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/script.js"></script>
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <script>
    AOS.init();
  </script>
  
  <script>
    const status = "<%= request.getParameter("hire") %>";

    if (status === "success") {
        alert("Hire request sent successfully!");
    } else if (status === "exists") {
        alert("You have already sent a request for this vendor.");
    } else if (status === "error") {
        alert("Something went wrong. Please try again.");
    }
</script>
</body>
</html>