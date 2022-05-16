<%-- 
    Document   : ManageAccounts
    Created on : Mar 4, 2022, 6:57:37 PM
    Author     : leduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage accounts</title>
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
                <div style="margin: 10px" class="text-center">
                <form action="mainController" method="post"> 
                    <input type="text" name="txtSearch" value="${requestScope.txtSearch}" class="form-control" placeholder="Search Account by email"/>
                <input type="submit" value="Search account" name="action" class="btn btn-secondary mt-3"/>
            </form>
        </div>


        <c:set var="action" value="manageAccounts"></c:set>
        <c:if test="${requestScope.searched == true}">
            <c:set var="action" value="searchAccount"></c:set>
        </c:if>

        <c:set var="totalCount" scope="session" value="${requestScope.accountList.size()}"/>
        <c:set var="perPage" scope="session"  value="${10}"/>
        <c:set var="pageStart" value="${param.start}"/>
        <c:if test="${empty pageStart or pageStart < 0}">
            <c:set var="pageStart" value="0"/>
        </c:if>
        <c:if test="${totalCount < pageStart}">
            <c:set var="pageStart" value="${pageStart - perPage}"/>
        </c:if>

        <h1></h1>
        <table class="table mb-3 mt-3">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Email</th>
                    <th scope="col">Full name</th>
                    <th scope="col">Status</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Role</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <c:forEach var="acc" items="${requestScope.accountList}" begin="${pageStart}" end="${pageStart + perPage - 1}" >
                <tr>
                    <td><c:out value="${acc.getAccID()}"></c:out></td>
                    <td><c:out value="${acc.getEmail()}"></c:out></td>
                    <td><c:out value="${acc.getFullname()}"></c:out></td>
                        <td>
                        <c:choose>
                            <c:when test="${acc.getStatus() eq 1}">Active</c:when>
                            <c:otherwise>Inactive</c:otherwise>
                        </c:choose>
                    </td>
                    <td><c:out value="${acc.getPhone()}"></c:out></td>
                        <td>
                        <c:choose>
                            <c:when test="${acc.getRole() eq 1}">Admin</c:when>
                            <c:otherwise>User</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <c:if test="${acc.getRole() eq 0}"><!-- only block/unblock user accounts -->
                            <c:url var="mylink" value="mainController">
                                <c:param name="email" value="${acc.getEmail()}"></c:param>
                                <c:param name="status" value="${acc.getStatus()}"></c:param>
                                <c:param name="action" value="updateStatusAccount"></c:param>
                            </c:url>
                            <a class="btn btn-outline-secondary" href="${mylink}">Block/Unblock</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div class="d-flex justify-content-center mb-5">
            <a href="mainController?action=${action}&start=${pageStart - perPage}&txtSearch=${requestScope.txtSearch}" class="btn btn-outline-primary"><<</a>
            <h4 style="padding-left: 20px;padding-right: 20px">Page ${(pageStart/10 + 1).intValue()}</h4> 
            <a href="mainController?action=${action}&start=${pageStart + perPage}&txtSearch=${requestScope.txtSearch}" class="btn btn-outline-primary">>></a>  
        </div>
            </c:when>
            <c:otherwise>
                <c:redirect url="login.jsp"></c:redirect>
            </c:otherwise>
        </c:choose>
    </body>
</html>
