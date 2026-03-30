<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


  <!-- Footer section -->
  <footer class="container-fluid footer-section">
    <section class="container mb-0">
      <div class="row row-cols-md-2 row-cols-lg-4 g-4 py-5">
        <div>
          <h2>VENDORA</h2>
          <p class="f-content">Vendora connects you with trusted local service professionals
            for plumbing, electrical, network, and vehicle services —
            fast, reliable, and hassle-free.</p>
        </div>
        <div>
          <h2>CONTACT INFO</h2>
          <p class="f-content">
            <a href="https://maps.app.goo.gl/Vz2q4eeJprRgpzit6" target="_blank">
              <i class="bi bi-geo-alt pe-2"></i>
              Jijamata chowk, Pune, Maharashtra 411043
            </a>
          </p>

          <p class="f-content"><a href="tel:+919850268951"><i class="bi bi-telephone pe-2"></i>+91
              9850268951</a></p>
          <p class="f-content"><a href="mailto:ironride.contact@gmail.com"><i
                class="bi bi-envelope pe-2"></i>vendors.services.contact@gmail.com</a>
          </p>
        </div>
        <div>
          <h2>SERVICES</h2>
          <ul class="p-0">
            <li><a href="${pageContext.request.contextPath}/services.jsp#plumbing" class="f-content">Plumbing Services</a></li>
		    <li><a href="${pageContext.request.contextPath}/services.jsp#electrical" class="f-content">Electrical Services</a></li>
		    <li><a href="${pageContext.request.contextPath}/services.jsp#network" class="f-content">Network / IT Services</a></li>
		    <li><a href="${pageContext.request.contextPath}/services.jsp#vehicle" class="f-content">Vehicle Services</a></li>
          </ul>
        </div>
        <div>
          <h2 class="pb-3">SEND FEEDBACK</h2>
 
 <%
    Object user = session.getAttribute("USER");
%>

<% if (user != null) { %>

<form action="${pageContext.request.contextPath}/submitFeedback" method="post">
  <div class="input-group mb-3">
    <input type="text" name="message" class="form-control" placeholder="Your feedback..." required>
    <button class="input-group-text buttons" type="submit">Send Feedback</button>
  </div>
</form>

<% } else { %>

<div class="input-group mb-3">
  <input type="text" class="form-control" placeholder="Login to give feedback" disabled>
  <a href="${pageContext.request.contextPath}/Login.jsp" class="input-group-text buttons">
    Login
  </a>
</div>

<% } %>
        </div>
      </div>
      <div class="text-center pb-4">
        <p>Copyright &copy; 2026 Vendora | Connecting Services with Trust</p>
      </div>
    </section>
  </footer>