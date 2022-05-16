<%-- 
    Document   : header_loginedUser
    Created on : Feb 4, 2022, 3:34:07 PM
    Author     : leduc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tlds/mytag.tld" prefix="m" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="mycss.css" type="text/css" />
    </head>
    <body>
        <style>
            .navbar-brand{
                padding-right: 5px;
                padding-left: 5px;
            }
        </style>
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a href="indexServlet"><img src="images/logo.jpg" id="logo" class="img-responsive" width="150"></a>

                <a href="indexServlet" class="navbar-brand text-secondary" style="font-size: 170%">Home</a>
                <a href="changeProfile.jsp" class="navbar-brand text-secondary" style="font-size: 170%">Change profile</a>
                <div class="dropdown show">
                    <a class="navbar-brand text-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 170%">
                        Your orders
                    </a>

                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <a href="mainController?action=allOrder" class="navbar-brand text-secondary dropdown-item">All orders</a>
                        <a href="mainController?action=completedOrder" class="navbar-brand text-secondary dropdown-item">Completed orders</a>
                        <a href="mainController?action=canceledOrder" class="navbar-brand text-secondary dropdown-item">Canceled orders</a>
                        <a href="mainController?action=processingOrder" class="navbar-brand text-secondary dropdown-item">Processing orders</a>
                    </div>
                </div>

                <a href="mainController?action=viewcart" class="navbar-brand text-secondary" style="font-size: 170%">View cart</a>

                <ul class="navbar-nav mr-auto">
                </ul>

                <div  style="padding-right: 50px" class="text-center ">
                    <m:welcome name="${sessionScope.loginedUser.getFullname()}"/>
                </div>

                <form action="mainController" method="post">
                    <span class="text-secondary">From</span> <input type="date" name="from" value="" required class="form-control mr-sm-2"><span class="text-secondary"> to</span> <input type="date" name="to" value="" required class="form-control mr-sm-2">
                    <input type="submit" value="Search Date" name="action" class="btn btn-outline-success my-2 my-sm-0">
                </form>
            </nav>
        </header>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>            
    </body>
</html>
