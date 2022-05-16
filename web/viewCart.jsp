<%-- 
    Document   : viewCart
    Created on : Feb 9, 2022, 3:01:02 PM
    Author     : leduc
--%>

<%@page import="duclm.dao.PlantDAO"%>
<%@page import="duclm.dto.Plant"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <header>
            <c:set var="loginedUser" value="${sessionScope.loginedUser}"></c:set>
            <c:choose>
                <c:when test="${loginedUser != null && loginedUser.getRole()==0}"><c:import url="header_loginedUser.jsp"></c:import></c:when>
                <c:otherwise><c:import url="header.jsp"></c:import></c:otherwise>
            </c:choose>
        </header>
        <section>
            <c:set var="tmp" value="${['Out of stock','Available']}"></c:set>
            <c:set var="name" value="${sessionScope.name}"></c:set>
            <c:set var="money" value="0"></c:set>
            <c:set var="cart" value="${sessionScope.cart}"></c:set>  
            <jsp:useBean id="plantObj" class="duclm.dto.Plant" scope="request"/>

            <!-- CART -->
            <h3 style="margin-top: 20px;margin-left: 50px">Your shopping cart: </h3>
            <c:choose>
                <c:when test="${cart!=null}">
                    <table width="100%" class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Product ID</th>
                                <th scope="col">Image</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <c:forEach var="plant" items="${requestScope.cartPlantList}" >
                            <c:set var="pid" value="${plant.getId()}"></c:set>
                            <c:set var="quantity" value="${sessionScope.cart[plant.getId()]}"></c:set>
                                <form action="mainController" method="post">
                                    <tr><th scope="row"><input type="hidden" value="${plant.getId()}" name="pid"><a href="getPlantServlet?pid=${plant.getId()}">${plant.getId()}</a></th>
                                    <td><img src="${plant.getImgpath()}" height="150" width="150" class="img-responsive"></td>
                                    <td>${plant.getPrice()}</td>
                                    <td><input type="number" value="${sessionScope.cart[pid.toString()]}" name="quantity" min="1"></td>
                                    <td class="d-flex flex-column"><input type="submit" value="update" name="action" class="btn btn-info"><input type="submit" value="delete" name="action" class="btn btn-danger"></td>
                                </tr>
                            </form>

                            <c:if test="${plantObj.id==plant.getId()}">
                                <tr class="table-info">
                                    <td class="thead-light">Product name: ${plantObj.name}</td>
                                    <td>Description: ${plantObj.description}</td>
                                    <td>Status: ${tmp[plantObj.getStatus()]}</td>
                                    <td>Category: ${plantObj.catename}</td>
                                    <td></td>
                                </tr>

                            </c:if>
                            <c:set var="money" value="${money = money + plant.getPrice() * sessionScope.cart[pid.toString()]}"></c:set>       
                        </c:forEach>
                        <tr><td>Total money: ${money}</td><td></td><td></td><td></td><td></td></tr>
                        <tr><td>Order Date: ${requestScope.date.toString()}</td></td><td></td><td></td><td></td><td></td></tr>
                        <tr><td>Ship Date: N/A </td></td><td></td><td></td><td></td><td></td></tr>
                    </table>
                    <form action="mainController" method="post" class="text-center">
                        <input class="btn btn-success btn-lg" type="submit" value="saveOrder" name="action" style="margin: 10px">
                    </form>
                    <div class="text-center">
                        <h5 class="text-warning" style="padding-left: 30px">${requestScope.WARNING}</h5>
                    </div>
                    </c:when>
                    <c:otherwise>
                    <div class="text-center">
                        <h5 class="text-warning" style="padding-left: 30px">${requestScope.WARNING}</h5>
                    </div>
                    <h5 class="text-center mb-5 mt-5" style="margin-top: 20px">Your cart is empty!</h5>
                </c:otherwise>
            </c:choose> 
                    
            <!-- BEST SELLER -->
            <c:set var="top3list" value="${requestScope.top3list}"></c:set>

            <h3 style="margin-top: 20px;margin-left: 50px">People also buy these products:</h3>
                <div class="d-flex justify-content-center row">
                <c:forEach var="p" items="${top3list}">
                    <div class="card col-md-3" style="width: 10rem; margin: 10px; padding: 15px">
                        <img class="card-img-top" style="height: 250px;" src="${p.getImgpath()}">
                        <div class="card-body">
                            <h4 class="card-title">${p.getName()}</h5>
                                <h6 class="card-title">Product ID: ${p.getId()}</h6>
                                <h6 class="card-title">Price: ${p.getPrice()}</h6>
                                <h6 class="card-title">Status: ${tmp[p.getStatus()]}</h6>
                                <h6 class="card-title">Category: ${p.getCatename()}</h6>
                                <p class="card-text">${p.getDescription()}</p>
                                <c:choose>
                                    <c:when test="${p.getStatus()==1}"><a href="mainController?action=addtocart&pid=${p.getId()}" class="btn btn-primary">Add to cart</a></c:when>
                                    <c:otherwise><a href="mainController?action=addtocart&pid=${p.getId()}" class="btn btn-primary disabled">Add to cart</a></c:otherwise>
                                </c:choose>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
        <footer>
            <c:import url="footer.jsp"></c:import>
        </footer>
    </body>
</html>
