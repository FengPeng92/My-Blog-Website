<%--
  Created by IntelliJ IDEA.
  User: fengpeng
  Date: 4/17/21
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--     <link rel="icon" href="../../../../favicon.ico"> -->

    <title>Dashboard Template for Bootstrap</title>

    <!-- Bootstrap core CS
      S -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/dashboard.css" rel="stylesheet">
</head>

<body>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">${admin.getUsername()}</a>
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <a class="nav-link" href="${contextPath}/admin/logout.htm">Sign out</a>
        </li>
    </ul>
</nav>

<div class="container-fluid">
    <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="admin-index.html">
                            <span data-feather="home"></span>
                            Home <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${contextPath}/admin/userManagement.htm">
                            <span data-feather="file"></span>
                            User Management
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="${contextPath}/admin/blogManagement.htm">
                            <span data-feather="file"></span>
                            Blog Management
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${contextPath}/admin/commentManagement.htm">
                            <span data-feather="file"></span>
                            Comment Management
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2">主页</h1>
            </div>

            <h2>Section title</h2>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Header</th>
                        <th>Header</th>
                        <th>Header</th>
                        <th>Header</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1,001</td>
                        <td>Lorem</td>
                        <td>ipsum</td>
                        <td>dolor</td>
                        <td>sit</td>
                    </tr>
                    <tr>
                        <td>1,002</td>
                        <td>amet</td>
                        <td>consectetur</td>
                        <td>adipiscing</td>
                        <td>elit</td>
                    </tr>
                    <tr>
                        <td>1,003</td>
                        <td>Integer</td>
                        <td>nec</td>
                        <td>odio</td>
                        <td>Praesent</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>


<script src="js/jquery-3.3.1.slim.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery-slim.min.js"><\/script>')</script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/feather.min.js"></script>
<script>
    feather.replace()
</script>
</body>
</html>

