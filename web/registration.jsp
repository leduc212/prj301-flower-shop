<%-- 
    Document   : registration
    Created on : Jan 21, 2022, 7:33:16 AM
    Author     : leduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <!-- HEADER -->
        <c:set var="loginedUser" value="${sessionScope.loginedUser}"></c:set>
            <header>
            <c:choose>
                <c:when test="${loginedUser != null && loginedUser.getRole()==0}"><c:import url="header_loginedUser.jsp"></c:import></c:when>
                <c:when test="${loginedUser != null && loginedUser.getRole()==1}"><c:import url="header_loginedAdmin.jsp"></c:import></c:when>
                <c:otherwise><c:import url="header.jsp"></c:import></c:otherwise>
            </c:choose>
        </header>


        <!-- BODY -->  
        <c:choose>
            <c:when test="${loginedUser != null}">
                <div class="ml-5 mb-3" style="height: 300px;margin-top: 50px">
                    <h4 class="mb-3">Logout first to register a new account!</h4>
                    <a href="mainController?action=logout" class="btn btn-secondary">Logout</a></div>
            </div>
        </c:when>
        <c:otherwise>
            <section class="min-vh-100" style="background-color: #eee; padding-top: 10px;">
                <div class="container" style="background-color: #eee">
                    <div class="row d-flex justify-content-center align-items-center h-100" style="background-color: #eee">
                        <div class="col-lg-12 col-xl-11">
                            <div class="card text-black" style="border-radius: 25px;">
                                <div class="card-body p-md-5">
                                    <div class="row justify-content-center">
                                        <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                                            <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Registration</p>
                                            
                                            <form class="mx-1 mx-md-4" action="mainController" method="post" id="form">
                                                <div class="d-flex flex-row align-items-center mb-4">
                                                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                                                    <div class="form-outline flex-fill mb-0">
                                                        <input type="text" id="form3Example1c" class="form-control" name="txtfullname" value="${requestScope.txtfullname}" required />
                                                        <label class="form-label" for="form3Example1c">Your Name</label>
                                                    </div>
                                                </div>

                                                <div class="d-flex flex-row align-items-center mb-4">
                                                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                                    <div class="form-outline flex-fill mb-0">
                                                        <input type="email" id="form3Example3c" class="form-control" name="txtemail" required value="${requestScope.txtemail}"  />
                                                        <label class="form-label" for="form3Example3c">Your Email</label><p class="text-danger">${requestScope.ERRORmail}</p>
                                                    </div>
                                                </div>

                                                <div class="d-flex flex-row align-items-center mb-4">
                                                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                                                    <div class="form-outline flex-fill mb-0">
                                                        <input type="password" id="form3Example4c" class="form-control" name="txtpassword" required />
                                                        <label class="form-label" for="form3Example4c">Password</label>
                                                    </div>
                                                </div>

                                                <div class="d-flex flex-row align-items-center mb-4">
                                                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                                                    <div class="form-outline flex-fill mb-0">
                                                        <input id="form3Example4c" class="form-control" type="text" name="txtphone" value="${requestScope.txtphone}" required pattern="[0-9\-\+]{9,15}" />
                                                        <label class="form-label" for="form3Example4c">Phone number</label>
                                                    </div>
                                                </div>

                                                <!-- RECAPTCHA -->
                                                <div class="g-recaptcha" data-sitekey="6LciOfUeAAAAAAY6wzf4h5Kyda0-aXXR5G9CSTfg"></div></br>
                                                <div id="error" class="text-danger"></div>   
                                                
                                                <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4 mt-3">
                                                    <input type="hidden" value="Register" name="action">
                                                    <input type="submit" value="Register" class="btn btn-primary btn-lg">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp" class="img-fluid" alt="Sample image">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </c:otherwise>
    </c:choose>

    <!-- FOOTER -->                                            
    <footer>
        <c:import url="footer.jsp"></c:import>
    </footer>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script>
        window.onload = function(){
            let isValid = false;
            const form = document.getElementById("form");
            const error = document.getElementById("error");
            
            form.addEventListener("submit",function(event){
                event.preventDefault();
                const response = grecaptcha.getResponse();
                if(response){
                    form.submit();
                } else {
                    error.innerHTML = "Please fill in the ReCAPTCHA!";
                }
            });
        };
    </script>
</body>
</html>
