<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String success = request.getParameter("success");
String error = request.getParameter("error");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Vendora</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <link rel="icon" href="./images/illustration/S image.jpeg" type="image/x-icon">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagesStyle.css">
</head>

<body>

    <%@ include file="components/header.jsp" %>
    <main>
        <section class="container-fluid mb-0 commonhero py-5">
            <div class="container py-5">
                <h1>Contact Us</h1>
                <div class="underline"></div>
                <p>Get in touch with us for any inquiries or support you may need.</p>
            </div>
        </section>
        <!-- Contact options -->
        <section class="container-fluid mb-0 contact-info pb-5">
            <div class="container">
                <h2 class="text-center py-5 pb-3 headings">Contact Information</h2>

                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">


                   <div>
                     <div class="contact-card text-center py-5 h-100">
                        <a href="https://maps.app.goo.gl/Vz2q4eeJprRgpzit6" target="_blank">
                         <h3>Address</h3>
                        <p>Jijamata chowk, Pune, Maharashtra 411043</p>
                        <div class="icon-box"><i class="bi bi-geo-alt"></i></div>
                        </a>
                    </div>
                   </div>
                    <div>
                        <div class="contact-card text-center py-5 h-100">
                        <a href="tel:+919850268951">
                            <h3>Phone</h3>
                        <p>+91 9850268951</p>
                        <div class="icon-box"><i class="bi bi-telephone"></i></div>
                        </a>
                    </div>
                    </div>
                    <div>
                        <div class="contact-card text-center py-5 h-100">
                        <a href="mailto:vendors.services.contact@gmail.com">
                            <h3>Email</h3>
                        <p>vendors.services.contact@gmail.com</p>
                        <div class="icon-box"><i class="bi bi-envelope"></i></div>
                        </a>

                    </div>
                    </div>
                </div>
           </div>
        </section>

        <!-- Contact form -->
        <section class="container-fluid mb-0 contact-form py-5">
            <div class="container">
                <h2 class="text-center headings">Send Us a Message</h2>
                <p class="text-center mx-auto subheadings">We usually respond within 24 hours.</p>
                <div class="row">
                    <form action="${pageContext.request.contextPath}/ContactServlet" method="post" class="col-md-10 col-lg-8 mx-auto">
                        <input type="text" name="name" class="form-control my-3" placeholder="Your Name" required/>
                        <input type="tel" name="phone" class="form-control my-3" placeholder="Your Phone Number" required/>
                        <input type="email" name="email" class="form-control my-3" placeholder="Your Email Address" required/>
                        <textarea class="form-control my-3" name="message" placeholder="Your Message" rows="3" required></textarea>

                        <div class="text-center">
                            <button type="submit" class="buttons">Send Message</button>
                        </div>
                    </form>
                </div>
            </div>
        </section>

    </main>

  <%@ include file="components/footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
   <script src="${pageContext.request.contextPath}/js/script.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>
    <script>
    <% if ("1".equals(success)) { %>
        alert("Message sent successfully!");
    <% } else if ("1".equals(error)) { %>
        alert("Something went wrong!");
    <% } %>
</script>

</body>

</html>