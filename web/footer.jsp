<%-- 
    Document   : footer
    Created on : Jan 21, 2022, 7:09:06 AM
    Author     : leduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <footer class="text-center text-lg-start bg-light text-muted" style="padding-top: 5px">
            <!-- Section: Links  -->
            <section class="">
                <div class="container text-center text-md-start mt-5">
                    <!-- Grid row -->
                    <div class="row mt-3">
                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                            <!-- Content -->
                            <h6 class="text-uppercase fw-bold mb-4">
                                <i class="fas fa-gem me-3"></i>Niche
                            </h6>
                            <p>
                                Interested in finding the location of plants in our Garden? Our Plant Records database provides comprehensive information about our living collection.
                            </p>
                        </div>
                        <!-- Grid column -->
                        
                        <c:set var="searchby" value="by category"></c:set>
                        <!-- Grid column -->
                        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">
                                Products
                            </h6>
                            <p>
                                <a href="mainController?action=Search&txtsearch=Orchid&searchby=${searchby}" class="text-reset">Orchid</a>
                            </p>
                            <p>
                                <a href="mainController?action=Search&txtsearch=Roses&searchby=${searchby}y" class="text-reset">Roses</a>
                            </p>
                            <p>
                                <a href="mainController?action=Search&txtsearch=Others&searchby=${searchby}" class="text-reset">Others</a>
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">
                                Useful links
                            </h6>
                            <p>
                                <a href="registration.jsp" class="text-reset">Register</a>
                            </p>
                            <p>
                                <a href="login.jsp" class="text-reset">Login</a>
                            </p>
                            <p>
                                <a href="mainController?action=viewcart" class="text-reset">View Cart</a>
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">
                                Contact
                            </h6>
                            <p><i class="fas fa-home me-3"></i> Bitexco Tower, District 1, Ho Chi Minh city</p>
                            <p>
                                <i class="fas fa-envelope me-3"></i>
                                admin@gmail.com
                            </p>
                            <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                </div>
            </section>
            <!-- Section: Links  -->

            <!-- Copyright -->
            <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
                © 2021 Copyright:
                <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
            </div>
            <!-- Copyright -->
        </footer>
    </body>
</html>
