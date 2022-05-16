<%-- 
    Document   : ManagePlants
    Created on : Mar 5, 2022, 10:22:26 AM
    Author     : leduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage plants</title>
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
                <c:set var="stt" value="${['Out of stock', 'Available']}" scope="application" ></c:set>
                <c:set var="totalCount" scope="session" value="${requestScope.plantList.size()}"/>
                <c:set var="perPage" scope="session"  value="${6}"/>
                <c:set var="pageStart" value="${param.start}"/>
                <c:if test="${empty pageStart or pageStart < 0}">
                    <c:set var="pageStart" value="0"/>
                </c:if>
                <c:if test="${totalCount < pageStart}">
                    <c:set var="pageStart" value="${pageStart - perPage}"/>
                </c:if>
                <h1></h1>
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Plant ID</th>
                            <th scope="col">Plant name</th>
                            <th scope="col">Plant price</th>
                            <th scope="col">Image</th>
                            <th scope="col">Description</th>
                            <th scope="col">Status</th>
                            <th scope="col">Category ID</th>
                            <th scope="col">Category name</th>
                        </tr>
                    </thead>
                    <c:forEach var="plant" items="${requestScope.plantList}" begin="${pageStart}" end="${pageStart + perPage - 1}">
                        <tr>
                            <td><c:out value="${plant.getId()}"></c:out></td>
                            <td><c:out value="${plant.getName()}"></c:out></td>
                            <td><c:out value="${plant.getPrice()}"></c:out></td>
                            <td><img src="${plant.getImgpath()}" width="100" height="100" /></td>
                            <td><c:out value="${plant.getDescription()}"></c:out></td>
                            <td>${stt[plant.getStatus()]}</br><a href="mainController?action=changePlantStatus&pid=${plant.getId()}&status=${plant.getStatus()}" class="btn btn-outline-info mt-2">Change status</a></td>
                            <td><c:out value="${plant.getCateid()}"></c:out></td>
                            <td><c:out value="${plant.getCatename()}"></c:out></td>
                            </tr>
                    </c:forEach>
                </table>
                <div class="d-flex justify-content-center mb-5">
                    <a href="mainController?action=managePlants&start=${pageStart - perPage}" class="btn btn-outline-primary"><<</a>
                    <h4 style="padding-left: 20px;padding-right: 20px">Page ${(pageStart/6 + 1).intValue()}</h4> 
                    <a href="mainController?action=managePlants&start=${pageStart + perPage}" class="btn btn-outline-primary">>></a>  
                </div>
            </c:when>
            <c:otherwise>
                <c:redirect url="login.jsp"></c:redirect>
            </c:otherwise>
        </c:choose>
    </body>
</html>
