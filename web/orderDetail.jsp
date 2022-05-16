<%-- 
    Document   : orderDetail
    Created on : Feb 4, 2022, 7:11:10 PM
    Author     : leduc
--%>

<%@page import="duclm.dto.OrderDetail"%>
<%@page import="duclm.dto.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="duclm.dao.OrderDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order detail</title>
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
                <section class=" mt-5 mb-5">
                    <c:set var="orderid" value="${requestScope.orderid}"></c:set>
                    <c:choose>
                        <c:when test="${requestScope.list != null && !requestScope.list.isEmpty()}">
                            <c:set var="money" value="0"></c:set>
                                <table class="table">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">Order ID</th>
                                            <th scope="col">Plant ID</th>
                                            <th scope="col">Plant name</th>
                                            <th scope="col">Image</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Quantity</th>
                                        </tr>
                                    </thead>
                                <c:forEach var="detail" items="${requestScope.list}">
                                    <tr>
                                        <td>${detail.getOrderID()}</td>
                                        <td>${detail.getPlantID()}</td>
                                        <td>${detail.getPlantName()}</td>
                                        <td><img src="${detail.getImgPath()}" class="img-responsive" width="100" height="100"/><br/></td>
                                        <td>${detail.getPrice()}</td>
                                        <td>${detail.getQuantity()}</td>
                                        <c:set var="money" value="${money + detail.getPrice() * detail.getQuantity()}"></c:set>
                                        </tr>           
                                </c:forEach>
                            </table>
                            <h4 class="text-dark pl-5">Total money: ${money}</h4>
                        </c:when>
                        <c:otherwise>
                            <h5 class="pt-5 pb-5 pl-3 text-dark">You don't have any order!</h5> 
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
