<%-- 
    Document   : personalPage
    Created on : Feb 4, 2022, 3:34:19 PM
    Author     : leduc
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="duclm.dto.Account"%>
<%@page import="duclm.dao.AccountDAO"%>
<%@page import="duclm.dao.AccountDAO"%>
<%@page import="duclm.dto.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="duclm.dao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your personal page</title>
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
        
        <!-- FOOTER -->
        <c:choose>
            <c:when test="${loginedUser != null && loginedUser.getRole()==0}">
                <section>
                    <c:set var="list" value="${requestScope.orderList}"></c:set>
                    <c:set var="status" value="${['', 'Processing', 'Completed', 'Canceled']}"></c:set>
                    <h3 class="text-dark" style="padding: 10px;padding-left: 30px;">${requestScope.statusHeader}</h3>
                    <c:choose>
                        <c:when test="${list != null && !list.isEmpty()}">
                            <table class="table">
                                <thead class="thead-dark"><tr><th>Order ID</th><th>Order Date</th><th>Ship Date</th><th>Order's status</th><th>Action</th></tr></thead>
                                <tbody>
                                    <c:forEach var="ord" items="${list}">    
                                        <tr>
                                            <td>${ord.getOrderID()}</td>
                                            <td>${ord.getOrderDate()}</td>
                                            <td>${ord.getShipDate()}</td>
                                            <td>${status[ord.getStatus()]}
                                                <br/><c:if test="${ord.getStatus() == 1}"><a href="cancelOrder?orderID=${ord.getOrderID()}" class="btn btn-outline-secondary btn-sm">Cancel order</a></c:if>
                                                <c:if test="${ord.getStatus() == 3}"><a href="orderAgain?orderID=${ord.getOrderID()}" class="btn btn-outline-secondary btn-sm">Order again</a></c:if>
                                                </td>
                                                <td><a href="mainController?action=orderDetail&orderid=${ord.getOrderID()}" class="btn btn-outline-info">Detail</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <p>You don't have any order!</p>
                        </c:otherwise>
                    </c:choose>
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
