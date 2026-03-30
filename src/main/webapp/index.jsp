<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Vendora</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
  <link rel="icon" href="${pageContext.request.contextPath}/images/illustration/S image.jpeg" type="image/x-icon">
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>
  
  <%@ include file="/components/header.jsp" %>

  <main>
    <!-- Hero section -->
    <section class="container-fluid HeroSection">

      <h2 class="pb-2 text-center">Your Trusted Service Hub</h2>
      <p class="pb-3 col-lg-6 text-center">Book reliable plumbers, electricians, and service professionals in minutes.
      Fast, secure, and hassle-free.</p>
      <div class="col-12 text-center">
        <a href="${pageContext.request.contextPath}/services.jsp" class="buttons">Get Started</a>
      </div>
    </section>

    <!-- Second Section -->
    <section class="container-fluid second-sec">
      <div class="row py-5">
        <div class="col-lg-4">
          <img class="img1 mb-5 ms-auto" src="./assets/images/illustration/img1.jpg" alt="Tool1" />
          <img class="img2" src="./assets/images/illustration/img2.jpg" alt="Tool2" />
        </div>
        <div class="col-lg-4 my-auto py-5">
          <h2 class="headings">Need a Professional Fast?</h2>
          <p class="subheadings pb-3">From plumbing to electrical work, connect with verified experts
          and get your job done quickly and safely.</p>
          <a href="${pageContext.request.contextPath}/services.jsp" class="buttons">Find a Pro</a>
        </div>
        <div class="col-lg-4">
          <img class="img2" src="./assets/images/illustration/img3.jpg" alt="Tool3" />
          <img class="img1 mt-5" src="./assets/images/illustration/img4.jpg" alt="Tool4" />
        </div>
      </div>
    </section>

    <!-- Feature Section -->
   <section class="features-section">
  <div class="container">

    <div class="text-center mb-5">
      <h2 class="headings">Why Choose Vendora?</h2>
      <p class="subheadings mx-auto">
        We make hiring service professionals simple, fast, and reliable.
      </p>
    </div>

    <div class="row g-4">

      <div class="col-md-6 col-lg-3">
        <div class="feature-card">
          <div class="icon">
        <i class="bi bi-patch-check-fill"></i>
      </div>
          <h5>Verified Professionals</h5>
          <p>All service providers are checked for quality and reliability.</p>
        </div>
      </div>

      <div class="col-md-6 col-lg-3">
        <div class="feature-card">
          <div class="icon">
        <i class="bi bi-lightning-charge-fill"></i>
      </div>
          <h5>Fast Booking</h5>
          <p>Find and hire experts in just a few clicks.</p>
        </div>
      </div>

      <div class="col-md-6 col-lg-3">
        <div class="feature-card">
          <div class="icon">
        <i class="bi bi-shield-lock-fill"></i>
      </div>
          <h5>Secure Process</h5>
          <p>Your data and transactions are safe with us.</p>
        </div>
      </div>

      <div class="col-md-6 col-lg-3">
        <div class="feature-card">
          <div class="icon">
        <i class="bi bi-star-fill"></i>
      </div>
          <h5>Trusted by Users</h5>
          <p>Hundreds of satisfied customers trust our platform.</p>
        </div>
      </div>

    </div>

  </div>
</section>
    <section class="container-fluid  p-0">
      <img class="img-fluid" src="assets/images/illustration/ToolsImage.jpg" alt="Tools" />
    </section>



    <!-- Contact section -->
    <section class="container-fluid contact-section py-5">
      <section class="container py-5">
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