<%-- 
    Document   : header
    Created on : Jan 21, 2022, 7:08:57 AM
    Author     : leduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <style>
            .navbar-brand{
                padding-right: 20px;
                padding-left: 20px;
            }
        </style>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a href="indexServlet"><img src="images/logo.jpg" id="logo" class="img-responsive" width="150"></a>
                
                <a href="indexServlet" class="navbar-brand text-secondary" style="font-size: 175%">Home</a>
                <a href="registration.jsp" class="navbar-brand text-secondary" style="font-size: 175%">Register</a>
                <a href="login.jsp" class="navbar-brand text-secondary" style="font-size: 175%">Login</a>
                <a href="mainController?action=viewcart" class="navbar-brand text-secondary" style="font-size: 175%">View cart</a>

                <ul class="navbar-nav mr-auto">
                </ul>

                <form action="mainController" method="post" class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" placeholder="Search" type="text" name="txtsearch" value='${requestScope.txtsearch}'>
                    <select class="form-control mr-sm-2" name="searchby">
                        <option value="byname">by name</option>
                        <option value="bycate">by category</option>
                    </select>
                    <input class="btn btn-outline-success my-2 my-sm-0" type="submit" value="Search" name="action">
                </form>
            </nav>
        </header>
    </body>
</html>
