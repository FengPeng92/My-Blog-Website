<%--
  Created by IntelliJ IDEA.
  User: fengpeng
  Date: 4/21/21
  Time: 5:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <head>
        <title>Code &amp; Blogs</title>

        <!-- meta -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- css -->
        <link rel="stylesheet" href="/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="/css/pace.css">
        <link rel="stylesheet" href="/css/custom.css">

        <!-- js -->
        <script src="/js/jquery-2.1.3.min.js"></script>
        <script src="/js/bootstrap.min.js"></script>
        <script src="/js/pace.min.js"></script>
        <script src="/js/modernizr.custom.js"></script>
        <link href="/css/dashboard.css" rel="stylesheet">
    </head>
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
                <h1 class="h2">Comment Management</h1>
            </div>

            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th style="width: 10%">#</th>
                        <th style="width: 20%">Article</th>
                        <th style="width: 20%">Date</th>
                        <th style="width: 30%">Content</th>
                        <th style="width: 20%">Operation</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="comment" items="${allComments}">
                        <tr>
                            <td>${comment.id}</td>
                            <td><a href="${contextPath}/admin/${comment.article.id}/viewArticle.htm">${comment.article.title}</a></td>
                            <td>${comment.time}</td>
                            <form action="${contextPath}/admin/${comment.id}/commentSave.htm" method="post">
                                <c:choose>
                                    <c:when test="${comment.id == editId}">
                                        <td><input type="text" class="form-control" name="editComment${comment.id}" required value="${comment.content}"></td>
                                    </c:when>

                                    <c:when test="${comment.id != editId}">
                                        <td><input type="text" class="form-control" name="editComment${comment.id}" required value="${comment.content}" readonly></td>
                                    </c:when>
                                </c:choose>

                                <th>
                                    <a href="${contextPath}/admin/${comment.id}/commentEdit.htm"><button type="button" class="btn btn-sm btn-default">Edit</button></a>
                                    <button type="submit" class="btn btn-sm btn-default">Save</button>
                                    <a href="${contextPath}/admin/${comment.id}/commentDelete.htm"><button type="button" class="btn btn-sm btn-dark">Delete</button></a>
                                </th>
                            </form>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>

</body>
</html>
