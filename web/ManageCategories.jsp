<%-- 
    Document   : ManageCategories
    Created on : Mar 5, 2022, 7:36:24 PM
    Author     : leduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage categories</title>
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
                <c:set var="totalCount" scope="session" value="${requestScope.cateList.size()}"/>
                <c:set var="perPage" scope="session"  value="${10}"/>
                <c:set var="pageStart" value="${param.start}"/>
                <c:if test="${empty pageStart or pageStart < 0}">
                    <c:set var="pageStart" value="0"/>
                </c:if>
                <c:if test="${totalCount < pageStart}">
                    <c:set var="pageStart" value="${pageStart - perPage}"/>
                </c:if>
                <h1></h1>
                <table class="table table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Category ID</th>
                            <th scope="col">Category name</th>
                        </tr>
                    </thead>
                    <c:forEach var="cate" items="${requestScope.cateList.keySet()}" begin="${pageStart}" end="${pageStart + perPage - 1}">
                        <tr>
                            <td><c:out value="${cate}"></c:out></td>
                            <td><c:out value="${requestScope.cateList.get(cate)}"></c:out></td>
                            </tr>
                    </c:forEach>
                </table>
                <div class="d-flex justify-content-center">
                    <a href="mainController?action=manageCategories&start=${pageStart - perPage}" class="btn btn-outline-primary"><<</a>
                    <h4 style="padding-left: 20px;padding-right: 20px">Page ${(pageStart/10 + 1).intValue()}</h4> 
                    <a href="mainController?action=manageCategories&start=${pageStart + perPage}" class="btn btn-outline-primary">>></a>  
                </div>
            </c:when>
            <c:otherwise>
                <c:redirect url="login.jsp"></c:redirect>
            </c:otherwise>
        </c:choose>
    </body>
</html>
