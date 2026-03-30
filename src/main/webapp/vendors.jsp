
    <%@ page import="java.util.List" %>
<%@ page import="com.vendora.model.Vendor" %>

<%
List<Vendor> vendorList = (List<Vendor>) request.getAttribute("vendorList");
%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Vendors</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
  <link rel="icon" href="${pageContext.request.contextPath}/images/illustration/S image.jpeg" type="image/x-icon">
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagesStyle.css">
  </head>
  <body class="vendor-page">

<main>
<%@ include file="/components/header.jsp" %>


<div class="container py-5">
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4">

<%
if (vendorList != null && !vendorList.isEmpty()) {
    for (Vendor v : vendorList) {
%>

        <div class="col">
            <div class="card h-100 shadow-sm pb-3">
                <img src="<%= request.getContextPath() + "/" + v.getImageUrl() %>" 
                     class="card-img-top" style="height:200px; object-fit:cover;" />

                <div class="card-body">
                    <h5 class="card-title"><%= v.getName() %></h5>
                    <p class="card-text">
                        <b>Category:</b> <%= v.getCategory() %><br>
                        <b>Phone:</b> <%= v.getPhone() %>
                    </p>

                   <a href="${pageContext.request.contextPath}/vendorDetails?id=<%= v.getId() %>" 
                   class="buttons">View Details</a>
                </div>
            </div>
        </div>

<%
    }
} else {
%>
        <p>No vendors available</p>
<%
}
%>

    </div>
</div>
</main>

  <%@ include file="/components/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/script.js"></script>
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <script>
    AOS.init();
  </script>
  </body>
</html>
