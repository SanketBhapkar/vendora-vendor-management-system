<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Vendora</title>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
  <link rel="icon" href="./images/illustration/S image.jpeg" type="image/x-icon">
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagesStyle.css">
</head>

<body>
     <%@ include file="/components/header.jsp" %>
  <main>
    <!-- Hero Section -->
     <section class="container-fluid mb-0 commonhero py-5">
        <div class="container py-5">
            <h1>About Us</h1>
            <p>Learn more about Vendora and our mission to connect you with trusted local service professionals.</p>
        </div>
    </section>

    <!-- Features -->
    <section class="container-fluid p-0 py-md-5 about-highlights">
  <div class="container">
    <div class="row g-4">

     <div class="col-md-6 col-lg-4">
  <div class="about-card">
    <div class="icon-box">
      <i class="bi bi-eye"></i>
    </div>
    <h3>Our Vision</h3>
    <p>
      To be the most trusted digital bridge between customers
      and skilled local professionals.
    </p>
  </div>
</div>

<div class="col-md-6 col-lg-4">
  <div class="about-card">
    <div class="icon-box">
      <i class="bi bi-bullseye"></i>
    </div>
    <h3>Our Mission</h3>
    <p>
      To simplify service discovery through a secure,
      transparent, and easy-to-use platform.
    </p>
  </div>
</div>

<div class="col-md-6 col-lg-4">
  <div class="about-card">
    <div class="icon-box">
      <i class="bi bi-headset"></i>
    </div>
    <h3>Our Support</h3>
    <p>
      We provide reliable assistance to ensure a smooth
      and hassle-free user experience.
    </p>
  </div>
</div>
    </div>
  </div>
</section>


   <section class="container-fluid p-0 py-md-5 vision-mission-section">
  <div class="container">
    <div class="row align-items-center g-5">

      <div class="col-lg-6">
        <div class="vision-img">
          <img src="./assets/images/illustration/vision_mission_img.webp" 
               alt="Vision and Mission Illustration">
        </div>
      </div>

      <div class="col-lg-6">
        <div class="vision-content">
          <h3 class="headings">Who We Are</h3>
          <p class="subheadings">
            Vendora is a modern service marketplace designed to connect customers
            with verified professionals for everyday services such as plumbing,
            electrical work, networking, and vehicle assistance.
          </p>
          <p class="subheadings">
            We simplify the process of finding reliable experts by bringing
            everything into one easy-to-use platform.
          </p>
        </div>
      </div>

    </div>
  </div>
</section>


    <section class="container-fluid p-0 py-md-5 vision-mission-section">
  <div class="container">
    <div class="row align-items-center g-5">

      <div class="col-lg-6">
        <div class="vision-content">
          <h3 class="headings">What We Do</h3>
          <p class="subheadings">
            Vendora simplifies the process of finding and connecting
            with trusted local service professionals.
          </p>
          <p class="subheadings">
            We provide a seamless experience for customers seeking
            reliable plumbing, electrical, networking, and vehicle
            maintenance services.
          </p>
        </div>
      </div>

      <div class="col-lg-6">
        <div class="vision-img">
          <img src="./assets/images/illustration/What_we_do.png"
               alt="What We Do Illustration">
        </div>
      </div>

    </div>
  </div>
</section>


    <!-- Contact section -->
    <section class="container-fluid contact-section p-0 py-md-5 mb-0">
      <section class="container py-5 mb-0">
        <h2 class="headings py-3">Need Help Now?</h2>
        <p class="subheadings pb-4 col-md-8">
          Drop us a line. We'll get the right expert on your case faster than a speeding bullet.
        </p>
         <a href="${pageContext.request.contextPath}/contact.jsp" class="buttons">Let's Talk</a>

      </section>
    </section>

  </main>


<%@ include file="components/footer.jsp" %>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/script.js"></script>
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <script>
    AOS.init();
  </script>
   
</body>

</html>