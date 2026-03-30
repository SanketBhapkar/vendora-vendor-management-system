<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Vendora - Register Page</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<link rel="icon" href="./images/illustration/S image.jpeg" type="image/x-icon">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/LoginRegisterStyle.css">

</head>

<body>

<main class="login-page py-5">

<div class="bg-shape shape1"></div>
<div class="bg-shape shape2"></div>

<div class="container d-flex justify-content-center align-items-center h-100">

<div class="card login-card p-4" data-aos="zoom-in">

<div class="text-center mb-3">

<h2 class="login-heading">Create Vendora Account</h2>
<p class="login-subtitle">Vendor Management System</p>

</div>

<form action="${pageContext.request.contextPath}/register" method="post">

<div class="mb-3">

<label class="form-label">Enter Name</label>

<div class="input-group">
<span class="input-group-text"><i class="bi bi-person"></i></span>
<input type="text" name="username" class="form-control" placeholder="Enter your name">
</div>

</div>

<div class="mb-3">

<label class="form-label">Email address</label>

<div class="input-group">
<span class="input-group-text"><i class="bi bi-envelope"></i></span>
<input type="email" name="email" class="form-control" placeholder="Enter your email">
</div>

</div>

<div class="mb-3">

<label class="form-label">Password</label>

<div class="input-group">
<span class="input-group-text"><i class="bi bi-lock"></i></span>
<input type="password" name="password" class="form-control" placeholder="Enter your password">
</div>

</div>

<div class="mb-3">

<label class="form-label">Confirm Password</label>

<div class="input-group">
<span class="input-group-text"><i class="bi bi-shield-lock"></i></span>
<input type="password" name="confirmPassword" class="form-control" placeholder="Confirm your password">
</div>

</div>

<button type="submit" class="btn btn-primary w-100">
<i class="bi bi-person-plus"></i> Register
</button>

<p class="text-center text-white mt-3">
Already have an account? <a href="/Vendora/Login.jsp" class="signup-link">Sign In</a>
</p>

<%
String error = request.getParameter("error");

if ("password".equals(error)) {
%>

<p class="text-danger text-center mt-2">
Passwords do not match!
</p>

<%
} else if (error != null) {
%>

<p class="text-danger text-center mt-2">
Registration Failed!
</p>

<%
}
%>

</form>

</div>
</div>

</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/script.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script>
AOS.init();
</script>

</body>
</html>