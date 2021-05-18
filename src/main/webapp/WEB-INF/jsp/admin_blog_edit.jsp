<%--
  Created by IntelliJ IDEA.
  User: fengpeng
  Date: 4/18/21
  Time: 11:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="/lib/editmd/css/style.css" />
    <link rel="stylesheet" href="/lib/editmd/css/editormd.css" />

    <link rel="stylesheet" href="/editormd/css/editormd.css" />

    <title>Edit Blog</title>

    <!-- Bootstrap core CSS -->
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
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="admin-index.html">--%>
<%--                            <span data-feather="home"></span>--%>
<%--                            Home <span class="sr-only">(current)</span>--%>
<%--                        </a>--%>
<%--                    </li>--%>
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
                <h1 class="h2">Blog Edit</h1>
            </div>
            <form action="${contextPath}/admin/${selectedArticle.id}/articleEdit.htm" method="post">
                <p>&nbsp<button class="btn btn-lg btn-dark" type="submit">Submit the blog</button></p>
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="exampleFormControlInput1">Title</label>
                        <input type="text" class="form-control" id="exampleFormControlInput1" required name="blogtitle" value="${selectedArticle.title}">
                    </div>

                    <div class="form-group">
                        <div id="test-editormd">
                            <textarea style="display:none;" class="form-control" id="editormd" name="editormd">${selectedArticle.content}</textarea>
                        </div>
                    </div>

                </div>
            </form>
        </main>
    </div>
</div>
            <script src="/editormd/js/jquery.min.js"></script>
            <script src="/editormd/js/editormd.js"></script>
            <script type="text/javascript">
                var testEditor;
                $(function() {
                    testEditor = editormd("test-editormd", {
                        width   : "90%",
                        height  : 640,
                        syncScrolling : "single",
                        path    : "${pageContext.request.contextPath}/editormd/lib/",
                        saveHTMLToTextarea : true
                    });
                });
            </script>

</body>
</html>
