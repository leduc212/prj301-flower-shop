<%-- 
    Document   : login
    Created on : Jan 21, 2022, 7:28:16 AM
    Author     : leduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
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
                    <h4 class="mb-3">Logout first to login to another account!</h4>
                    <a href="mainController?action=logout" class="btn btn-secondary">Logout</a></div>
            </div>
        </c:when>
        <c:otherwise>
            <section class="h-100 h-custom" style="background-color: #eee;">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-lg-8 col-xl-6">
                            <div class="card rounded-3">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/img3.webp" class="w-100" style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;" alt="Sample photo">
                                <div class="card-body p-4 p-md-5">
                                    <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2">Login</h3>

                                    <form class="px-md-2" action="mainController" method="post">

                                        <div><p class="text-warning">${requestScope.WARNING}</p></div>
                                        <div class="form-outline mb-4">
                                            <input type="text" id="form3Example1q" class="form-control" name="txtemail" />
                                            <label class="form-label" for="form3Example1q">Email</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input id="form3Example2q" class="form-control" type="password" name="txtpassword" />
                                            <label class="form-label" for="form3Example2q">Password</label>
                                        </div>

                                        <input type="submit" value="Login" name="action" class="btn btn-success btn-lg mb-1">
                                        <div><p class="text-warning">${requestScope.ERROR}</p></div>
                                        <div style="padding-top: 10px">
                                            <input type="checkbox" value="savelogin" name="savelogin" style="margin-right: 5px">Stay signed in? 
                                        </div>
                                    </form>

                                    <div class="row mt-5 border rounded">
                                        <div class="col-md-12"> <a class="btn btn-lg btn-google btn-block text-uppercase btn-outline" href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/FlowerManagementSystem_1/LoginGoogleHandler&response_type=code
                                       &client_id=1077092424528-hj6ds20rh56buppm0mcu1l48se6iiom8.apps.googleusercontent.com&approval_prompt=force"><img src="https://img.icons8.com/color/16/000000/google-logo.png"> Sign in Using Google</a> </div>
                                    </div> <br>
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
</body>
</html>
