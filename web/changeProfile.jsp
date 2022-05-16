<%-- 
    Document   : changeProfile
    Created on : Feb 5, 2022, 7:30:58 PM
    Author     : leduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change profile</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <!-- HEADER -->
        <c:set var="loginedUser" value="${sessionScope.loginedUser}"></c:set>
        <header>
            <c:choose>
                <c:when test="${loginedUser != null && loginedUser.getRole()==0}"><c:import url="header_loginedUser.jsp"></c:import></c:when>
                <c:otherwise><c:import url="header.jsp"></c:import></c:otherwise>
            </c:choose>
        </header>

        <!-- BODY -->    
        <c:choose>
            <c:when test="${loginedUser != null && loginedUser.getRole()==0}">
                <section class="pt-5 pb-5" style="background-color: #eee;">
                    <div class="container h-100">
                        <div class="row d-flex justify-content-center align-items-center h-100">
                            <div class="col-xl-9">
                                <h1 class="text-dark mb-4">Change profile</h1>
                                <form action="mainController" method="post">
                                    <div class="card" style="border-radius: 15px;">
                                        <div class="card-body">
                                            <div class="row align-items-center pt-4 pb-3">
                                                <div class="col-md-3 ps-5">
                                                    <h4 class="mb-0">Full name</h4>
                                                </div>
                                                <div class="col-md-9 pe-5">
                                                    <input type="text" class="form-control form-control-lg" name="txtfullname"/>
                                                </div>
                                            </div>
                                            <div class="row align-items-center pt-4 pb-3">
                                                <div class="col-md-3 ps-5">
                                                    <h4 class="mb-0">Phone number</h4>
                                                </div>
                                                <div class="col-md-9 pe-5">
                                                    <input type="text" class="form-control form-control-lg" name="txtphone" pattern="[0-9\-\+]{9,15}"/>
                                                </div>
                                            </div>
                                            <div>
                                                <input type="submit" value="Change profile" name="action" class="btn btn-lg btn-secondary">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
            </c:when>
            <c:otherwise>
                <c:redirect url="login.jsp"></c:redirect>
            </c:otherwise>
        </c:choose>

        <!-- FOOTER -->   
        <footer>
            <c:import url="footer.jsp"></c:import>
        </footer>
    </body>
</html>
