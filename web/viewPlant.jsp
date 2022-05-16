<%-- 
    Document   : viewPlant
    Created on : Feb 23, 2022, 6:58:49 AM
    Author     : leduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="plantObj" class="duclm.dto.Plant" scope="request"/>
        <table>
            <tr><td rowspan="8"><img src="<jsp:getProperty name="plantObj" property="imgpath"></jsp:getProperty>" width="100" height="100"></td></tr>
            <tr><td>id:<jsp:getProperty name="plantObj" property="id"></jsp:getProperty></td></tr>
            <tr><td>product name:<jsp:getProperty name="plantObj" property="name"></jsp:getProperty></td></tr>
            <tr><td>price:<jsp:getProperty name="plantObj" property="price"></jsp:getProperty></td></tr>
            <tr><td>description:<jsp:getProperty name="plantObj" property="description"></jsp:getProperty></td></tr>
            <tr><td>status:<jsp:getProperty name="plantObj" property="status"></jsp:getProperty></td></tr>
            <tr><td>cate id:<jsp:getProperty name="plantObj" property="cateid"></jsp:getProperty></td></tr>
            <tr><td>category:<jsp:getProperty name="plantObj" property="catename"></jsp:getProperty></td></tr>
        </table>
        </br>
        <!-- Su dung EL -->
        <table>
            <tr><td rowspan="8"><img src="${plantObj.imgpath}" width="100" height="100"></td></tr>
        <tr><td>id:${plantObj.id}</td></tr>
        <tr><td>product name:${plantObj.name}</td></tr>
        <tr><td>price:${plantObj.price}</td></tr>
        <tr><td>description:${plantObj.description}</td></tr>
        <tr><td>status:${plantObj.status}</td></tr>
        <tr><td>cate id:${plantObj.cateid}</td></tr>
        <tr><td>category:${plantObj.catename}</td></tr>
        </table>
    </body>
</html>
