<%-- 
    Document   : ManageOrders
    Created on : Mar 5, 2022, 10:10:41 AM
    Author     : leduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage order</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="mycss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!-- HEADER -->
        <c:set var="loginedUser" value="${sessionScope.loginedUser}"></c:set>
            <header>
            <c:choose>
                <c:when test="${loginedUser != null && loginedUser.getRole()==1}"><c:import url="header_loginedAdmin.jsp"></c:import></c:when>
                <c:otherwise><c:import url="header.jsp"></c:import></c:otherwise>
            </c:choose>
        </header>

        <!-- BODY -->
        <c:choose>
            <c:when test="${loginedUser != null && loginedUser.getRole()==1}">
                <c:set var="action" value="manageOrders"></c:set>
                <c:if test="${requestScope.searched == true}"><c:set var="action" value="Search By Date"></c:set></c:if>
                        <form action="mainController" method="post">
                            <div class="row ml-5 mt-3 mb-3"><span class="text-secondary">From </span> <input type="date" name="from" value="" required class="form-control mr-sm-2 col-md-3 ml-3"><span class="text-secondary"> to </span> <input type="date" name="to" value="" required class="form-control mr-sm-2 col-md-3 ml-3"></div>
                            <input type="submit" value="Search By Date" name="action" class="btn btn-outline-success my-2 my-sm-0" style="margin-left: 400px;">
                        </form>
                <c:set var="totalCount" scope="session" value="${requestScope.orderList.size()}"/>
                <c:set var="perPage" scope="session"  value="${10}"/>
                <c:set var="pageStart" value="${param.start}"/>
                <c:if test="${empty pageStart or pageStart < 0}">
                    <c:set var="pageStart" value="0"/>
                </c:if>
                <c:if test="${totalCount < pageStart}">
                    <c:set var="pageStart" value="${pageStart - perPage}"/>
                </c:if>
                <c:set var="stt" value="${['', 'processing', 'completed', 'canceled']}" scope="application" ></c:set>
                    <h1></h1>
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Order ID</th>
                                <th scope="col">Order date</th>
                                <th scope="col">Ship date</th>
                                <th scope="col">Status</th>
                                <th scope="col">Account ID</th>
                            </tr>
                        </thead>
                    <c:forEach var="ord" items="${requestScope.orderList}" begin="${pageStart}" end="${pageStart + perPage - 1}">
                        <tr>
                            <td><c:out value="${ord.getOrderID()}"></c:out></td>
                            <td><c:out value="${ord.getOrderDate()}"></c:out></td>
                            <td><c:out value="${ord.getShipDate()}"></c:out></td>
                            <td><c:out value="${stt[ord.getStatus()]}"></c:out></td>
                            <td><c:out value="${ord.getAccID()}"></c:out></td>
                            </tr>
                    </c:forEach>
                </table>

                <div class="d-flex justify-content-center mb-5">
                    <a href="mainController?action=${action}&start=${pageStart - perPage}&from=${requestScope.from}&to=${requestScope.to}" class="btn btn-outline-primary"><<</a>
                    <h4 style="padding-left: 20px;padding-right: 20px">Page ${(pageStart/10 + 1).intValue()}</h4> 
                    <a href="mainController?action=${action}&start=${pageStart + perPage}&from=${requestScope.from}&to=${requestScope.to}" class="btn btn-outline-primary">>></a>  
                </div>
            </c:when>
            <c:otherwise>
                <c:redirect url="login.jsp"></c:redirect>
            </c:otherwise>
        </c:choose>
    </body>
</html>
