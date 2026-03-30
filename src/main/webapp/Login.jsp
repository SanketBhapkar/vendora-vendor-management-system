<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Vendora - Login</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css" rel="stylesheet">
<link rel="icon" href="./images/illustration/S image.jpeg" type="image/x-icon">

<!-- Custom CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/LoginRegisterStyle.css">

</head>
<body>

<div class="login-card text-center">

<h2 class="login-heading">Welcome to Vendora</h2>
<p class="login-subtitle">Vendor Management System</p>

<form action="${pageContext.request.contextPath}/login" method="post" class="mt-3">

    <div class="mb-3 text-start">
        <label class="form-label">Username</label>
        <div class="input-group">
            <span class="input-group-text"><i class="bi bi-person"></i></span>
            <input type="text" name="username" class="form-control" placeholder="Enter your username" required>
        </div>
    </div>

    <div class="mb-3 text-start">
        <label class="form-label">Password</label>
        <div class="input-group">
            <span class="input-group-text"><i class="bi bi-lock"></i></span>
            <input type="password" name="password" class="form-control" id="password" placeholder="Enter your password" required>
            <span class="input-group-text toggle-pass" onclick="togglePassword()">
                <i class="bi bi-eye" id="eyeIcon"></i>
            </span>
        </div>
    </div>

    <button type="submit" class="btn btn-primary w-100 mb-2">
        <i class="bi bi-box-arrow-in-right"></i> Login
    </button>

</form>

<p class="mt-2">
Don't have an account? <a href="/Vendora/Register.jsp" class="signup-link">Sign up</a>
</p>

<%
String error = request.getParameter("error");
if (error != null) {
%>
<p class="text-danger mt-2">Invalid Username or Password!</p>
<%
}
%>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<script>
function togglePassword(){
    let password = document.getElementById("password");
    let icon = document.getElementById("eyeIcon");

    if(password.type === "password"){
        password.type = "text";
        icon.classList.replace("bi-eye", "bi-eye-slash");
    }else{
        password.type = "password";
        icon.classList.replace("bi-eye-slash", "bi-eye");
    }
}
</script>

</body>
</html>