<%-- 
    Document   : senndOTP
    Created on : Mar 7, 2022, 7:21:38 PM
    Author     : leduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Send OTP page</title>
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <!-- HEADER -->
        <header>
            <c:import url="header.jsp"></c:import>
            </header>

            <!-- BODY -->
        <c:set var="email" value="${requestScope.email_newAccount}"></c:set>
        <c:choose>
            <c:when test="${email!=null}">
                <div class="ml-5 mb-3" style="height: 300px;margin-top: 50px">
                    <h2>Please check your email: ${email}, a confirm email is sent to you!</h2>
                </div>
            </c:when>
            <c:otherwise>
                <c:redirect url="registration.jsp"></c:redirect>
            </c:otherwise>
        </c:choose>

        <!-- FOOTER -->
        <footer>
            <c:import url="footer.jsp"></c:import>
        </footer>
    </body>
</html>
