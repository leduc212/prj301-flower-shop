<%-- 
    Document   : header_loginedAdmin
    Created on : Mar 4, 2022, 6:51:56 PM
    Author     : leduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="mycss.css" rel="stylesheet" type="text/css"/>
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
                <a href="#"><img src="images/logo.jpg" id="logo" class="img-responsive" width="150"></a>
                <a href="mainController?action=manageAccounts" class="navbar-brand text-secondary" style="font-size: 125%">Manage Accounts</a>
                <a href="mainController?action=manageOrders" class="navbar-brand text-secondary" style="font-size: 125%">Manage Orders</a>
                <a href="mainController?action=managePlants" class="navbar-brand text-secondary" style="font-size: 125%">Manage Plants</a>
                <a href="mainController?action=manageCategories" class="navbar-brand text-secondary" style="font-size: 125%">Manage Categories</a>
                <ul class="navbar-nav mr-auto"></ul>
                <div class="navbar-brand text-dark" style="padding-top: 5px">Welcome ${sessionScope.loginedUser.getFullname()} | <a href="mainController?action=logout">Logout</a></div>
            </nav>
        </header>
    </body>
</html>
