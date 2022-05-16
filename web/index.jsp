<%-- 
    Document   : index
    Created on : Jan 21, 2022, 7:26:21 AM
    Author     : leduc
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="duclm.dao.PlantDAO"%>
<%@page import="duclm.dto.Plant"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tlds/mytag.tld" prefix="m" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NICHE</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <c:out value="${'2'+'2'}" ></c:out>
        <!-- HEADER -->
        <header>
            <c:set var="loginedUser" value="${sessionScope.loginedUser}"></c:set>
            <c:choose>
                <c:when test="${loginedUser != null && loginedUser.getRole()==0}"><c:import url="header_loginedUser.jsp"></c:import></c:when>
                <c:otherwise><c:import url="header.jsp"></c:import></c:otherwise>
            </c:choose>   
        </header>
            
        <!-- BODY -->              
        <div class="container" style="margin-bottom: 20px">
            <section>
                <c:set var="servlet" value="indexServlet"></c:set>
                <c:if test="${requestScope.searched == true }">
                    <c:set var="servlet" value="searchServlet"></c:set>
                </c:if>

                <c:set var="txtsearch" value="${requestScope.txtsearch}"></c:set>
                <c:set var="searchby" value="${requestScope.searchby}"></c:set>
                <c:set var="tmp" value="${['Out of stock','Available']}"></c:set>

                <c:set var="totalCount" scope="session" value="${requestScope.plantlist.size()}"/>
                <c:set var="perPage" scope="session"  value="${6}"/>
                <c:set var="pageStart" value="${param.start}"/>
                <c:if test="${empty pageStart or pageStart < 0}">
                    <c:set var="pageStart" value="0"/>
                </c:if>
                <c:if test="${totalCount < pageStart}">
                    <c:set var="pageStart" value="${pageStart - perPage}"/>
                </c:if>

                <h1 style="padding: 30px">Our current products:</h1>
                <div class="d-flex justify-content-center row">
                    <c:forEach var="p" items="${requestScope.plantlist}" begin="${pageStart}" end="${pageStart + perPage - 1}">
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

                <div class="d-flex justify-content-center" style="margin-top: 10px">
                    <a href="${servlet}?start=${pageStart - perPage}&txtsearch=${txtsearch}&searchby=${searchby}" class="btn btn-outline-primary"><<</a>
                    <h4 style="padding-left: 20px;padding-right: 20px">Page ${(pageStart/6 + 1).intValue()}</h4> 
                    <a href="${servlet}?start=${pageStart + perPage}&txtsearch=${txtsearch}&searchby=${searchby}" class="btn btn-outline-primary">>></a>  
                </div>
            </section>
        </div>
                
        <!-- FOOTER -->        
        <footer>
            <c:import url="footer.jsp"></c:import>
        </footer>
    </body>
</html>
