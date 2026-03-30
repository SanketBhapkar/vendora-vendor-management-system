<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Services - Vendora</title>

    <!-- Bootstrap & Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">

    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/images/illustration/S image.jpeg" type="image/x-icon">

    <!-- AOS Animation -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagesStyle.css">
</head>

<body>

    <!-- Header -->
    <%@ include file="/components/header.jsp" %>

    <main>

        <!-- Hero Section -->
        <section class="container-fluid commonhero mb-0 py-5">
            <div class="container py-5 text-center">
                <h1>Our Services</h1>
                <p>Explore the range of services we offer to meet your needs.</p>
            </div>
        </section>

        <!-- Services Section -->
       <section class="services-section p-0 py-md-5" id="vendors">
  <div class="container">
    <div class="row g-4">

      <div class="col-md-6 col-lg-3">
        <div class="about-card">
          <div class="icon-box">
            <i class="bi bi-droplet-half"></i>
          </div>
          <h3>Plumbing Services</h3>
          <p>Leaks, fittings, pipelines & water systems</p>
          <a href="${pageContext.request.contextPath}/vendors?category=Plumber"
             class="buttons">View Vendors</a>
        </div>
      </div>

      <div class="col-md-6 col-lg-3">
        <div class="about-card">
          <div class="icon-box">
            <i class="bi bi-lightning-charge"></i>
          </div>
          <h3>Electrical Services</h3>
          <p>Wiring, appliances & power solutions</p>
          <a href="${pageContext.request.contextPath}/vendors?category=Electrician"
             class="buttons">View Vendors</a>
        </div>
      </div>

      <div class="col-md-6 col-lg-3">
        <div class="about-card">
          <div class="icon-box">
            <i class="bi bi-wifi"></i>
          </div>
          <h3>Network / IT Services</h3>
          <p>WiFi, LAN, routers & setup support</p>
          <a href="${pageContext.request.contextPath}/vendors?category=Technician"
             class="buttons">View Vendors</a>
        </div>
      </div>

      <div class="col-md-6 col-lg-3">
        <div class="about-card">
          <div class="icon-box">
            <i class="bi bi-car-front"></i>
          </div>
          <h3 class="px-2">Vehicle Services</h3>
          <p>Repair, maintenance & roadside help</p>
          <a href="${pageContext.request.contextPath}/vendors?category=Mechanic"
             class="buttons">View Vendors</a>
        </div>
      </div>

    </div>
  </div>
</section>




<section id="plumbing" class="p-0 py-md-5">
  <div class="container d-flex flex-column flex-md-row align-items-center">
    
 
    <div class="flex-fill me-md-4">
      <h2 class="headings">Plumbing Services</h2>
      <p class="subheadings">Professional plumbing solutions for residential and commercial needs.</p>

      <ul class="mt-3 ps-0">
        <li class="subheadings"><i class="bi bi-check-circle text-success me-2"></i> Leak detection and repair</li>
        <li class="subheadings"><i class="bi bi-check-circle text-success me-2"></i> Pipe installation and maintenance</li>
        <li class="subheadings"><i class="bi bi-check-circle text-success me-2"></i> Bathroom and kitchen fittings</li>
        <li class="subheadings"><i class="bi bi-check-circle text-success me-2"></i> 24/7 emergency plumbing support</li>
        <li class="subheadings"><i class="bi bi-check-circle text-success me-2"></i> Affordable and verified professionals</li>
      </ul>

      <a href="#vendors" class="buttons">Find Vendors</a>
    </div>

   
    <div class="flex-fill mt-4 mt-md-0">
      <img src="${pageContext.request.contextPath}/assets/images/illustration/PlumbigService.avif" 
           alt="Plumbing service image" class="img-fluid service-img">
    </div>
    
  </div>
</section>


<section id="electrical" class="p-0 py-md-5">
  <div class="container d-flex flex-column flex-md-row align-items-center">
   <div class="flex-fill mt-4 mt-md-0">
  <img src="${pageContext.request.contextPath}/assets/images/illustration/Electricity.avif" 
     alt="Electric	 service image" class="img-fluid service-img">
  </div>
   <div class="flex-fill ps-md-5">
    <h2 class="headings">Electrical Services</h2>
    <p class="subheadings">Professional plumbing solutions for residential and commercial needs.</p>

    <ul class="mt-3 ps-0">
      <li class="subheadings"><i class="bi bi-check-circle text-success me-2"></i> Wiring and rewiring services</li>
      <li class="subheadings"><i class="bi bi-check-circle text-success me-2"></i> Appliance installation</li>
      <li class="subheadings"><i class="bi bi-check-circle text-success me-2"></i> Power backup solutions</li>
      <li class="subheadings"><i class="bi bi-check-circle text-success me-2"></i> Fault detection & repair</li>
      <li class="subheadings"><i class="bi bi-check-circle text-success me-2"></i> Certified electricians</li>
    </ul>

     <a href="#vendors" class="buttons">Find Vendors</a>
   </div>
   
  </div>
</section>

<section id="network" class="p-0 py-md-5">
  <div class="container d-flex flex-column flex-md-row align-items-center">
    <div class="flex-fill me-md-4">
    <h2 class="headings">Network / IT Services</h2>
    <p class="subheadings">Professional plumbing solutions for residential and commercial needs.</p>

    <ul class="mt-3 ps-0">
      <li class="subheadings"><i class="bi bi-check-circle text-success me-2"></i> WiFi setup & configuration</li>
      <li class="subheadings"><i class="bi bi-check-circle text-success me-2"></i> Router installation</li>
      <li class="subheadings"><i class="bi bi-check-circle text-success me-2"></i> Network troubleshooting</li>
      <li class="subheadings"><i class="bi bi-check-circle text-success me-2"></i> CCTV installation</li>
      <li class="subheadings"><i class="bi bi-check-circle text-success me-2"></i> IT support services</li>
    </ul>

     <a href="#vendors" class="buttons">Find Vendors</a>
    </div>
     <div class="flex-fill mt-4 mt-md-0">
  <img src="${pageContext.request.contextPath}/assets/images/illustration/NetworkService.avif" 
     alt="Network service image" class="img-fluid service-img">
  </div>
  </div>
  
</section>

<section id="vehicle" class="p-0 py-md-5">
  <div class="container d-flex flex-column flex-md-row align-items-center">
   <div class="flex-fill mt-4 mt-md-0">
  <img src="${pageContext.request.contextPath}/assets/images/illustration/MechanicService.avif" 
     alt="Vehicle service image" class="img-fluid service-img">
  </div>
   <div class="flex-fill ps-md-5">
    <h2 class="headings">Vehicle Services</h2>
    <p class="subheadings">Professional plumbing solutions for residential and commercial needs.</p>

    <ul class="mt-3 ps-0">
      <li class="subheadings"><i class="bi bi-check-circle text-success me-2"></i> Bike & car servicing</li>
      <li class="subheadings"><i class="bi bi-check-circle text-success me-2"></i> Engine diagnostics</li>
      <li class="subheadings"><i class="bi bi-check-circle text-success me-2"></i> Oil change & maintenance</li>
      <li class="subheadings"><i class="bi bi-check-circle text-success me-2"></i> Emergency roadside assistance</li>
      <li class="subheadings"><i class="bi bi-check-circle text-success me-2"></i> Spare parts replacement</li>
    </ul>

     <a href="#vendors" class="buttons">Find Vendors</a>
   </div>
  </div>
</section>

    </main>

    <!-- Footer -->
    <%@ include file="components/footer.jsp" %>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <script>
        AOS.init();
    </script>

</body>
</html>