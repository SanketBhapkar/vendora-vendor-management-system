<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header class="navigationbar">
    <nav class="navbar navbar-expand-md">
      <div class="container p-0">
        <a href="${pageContext.request.contextPath}/index.jsp" class="navbar-brand">
          <img src="${pageContext.request.contextPath}/assets/images/illustration/Vendora_logo.png" alt="Vendora">
        </a>

        <button class="navbar-toggler border-0 text-light" type="button" data-bs-toggle="collapse"
          data-bs-target="#navigationList">
          <i class="bi bi-list" style="font-size: 1.8rem;"></i>
        </button>

        <div class="collapse navbar-collapse pb-3" id="navigationList">
          <ul class="navbar-nav mx-auto">
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/about.jsp">About Us</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/services.jsp">Services</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/contact.jsp">Contact</a></li>
          </ul>

  <%
    Object userObj = session.getAttribute("USER");
%>

<% if (userObj == null) { %>

    <a href="${pageContext.request.contextPath}/Login.jsp" 
       class="btn btn-sm login-btn d-flex align-items-center gap-2">
       <i class="bi bi-person"></i>
       <span>Login</span>
    </a>

<% } else { 
    com.vendora.model.User user = (com.vendora.model.User) userObj;
%>


    <span class="me-3 fw-semibold text-white h5 mb-0">
        <i class="bi bi-person-circle me-1"></i> <%= user.getUsername() %>
    </span>

    
   <a href="${pageContext.request.contextPath}/logout" 
   class="btn btn-sm btn-outline-danger"
   title="Logout">
   <i class="bi bi-box-arrow-right"></i>
</a>

<% } %>
        </div>
      </div>
    </nav>
  </header>
