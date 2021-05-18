<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fengpeng
  Date: 4/19/21
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <link rel="stylesheet" href="/editormd/css/editormd.css" />
<%--        <link rel="stylesheet" href="/lib/editmd/css/style.css" />--%>
<%--        <link rel="stylesheet" href="/lib/editmd/css/editormd.css" />--%>

        <!-- js -->
        <script src="/js/jquery-2.1.3.min.js"></script>
        <script src="/js/bootstrap.min.js"></script>
        <script src="/js/pace.min.js"></script>
        <script src="/js/modernizr.custom.js"></script>
    </head>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<div class="container">
    <header id="site-header">
        <div class="row">
            <div class="col-md-4 col-sm-5 col-xs-8">
                <div class="logo">
                    <h1><a href="${contextPath}/"><b>Code</b> &amp; Blogs</a></h1>
                </div>
            </div><!-- col-md-4 -->
            <div class="col-md-8 col-sm-7 col-xs-4">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <form class="form-inline my-2 my-lg-0" action="/user/search.htm" method="post">
                            <input class="form-control mr-sm-2" type="text" placeholder="Search" name="searchContent">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                        </form>
                        <c:choose>
                            <c:when test="${sessionScope.user == null}">
                                <ul class="navbar-nav ml-auto">
                                    <li class="nav-item">
                                        <a class="nav-link" href="${contextPath}/user/register.htm">Register</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="${contextPath}/user/login.htm">Login</a>
                                    </li>
                                </ul>
                            </c:when>


                            <c:when test="${sessionScope.user != null}">
                                <ul class="navbar-nav ml-auto">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="${contextPath}/user/${sessionScope.user.id}/blogManagement.htm">${sessionScope.user.username} <span class="sr-only">(current)</span></a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="${contextPath}/user/${sessionScope.user.id}/newBlog.htm">Write a Blog</a>
                                    </li>
                                    <c:choose>

                                        <c:when test="${sessionScope.user.UnreadComments().size() > 0}">
                                            <li class="nav-item">
                                                <a class="nav-link" style="color: red" href="${contextPath}/user/${sessionScope.user.id}/unreadComments.htm">Notification
                                                    <span class="counter counter-lg">${sessionScope.user.UnreadComments().size()}</span>
                                                </a>
                                            </li>
                                        </c:when>

                                        <c:when test="${sessionScope.user.UnreadComments().size() == 0}">
                                            <li class="nav-item">
                                                <a class="nav-link" href="${contextPath}/user/${sessionScope.user.id}/unreadComments.htm">Notification</a>
                                            </li>
                                        </c:when>
                                    </c:choose>

                                    <li class="nav-item">
                                        <a class="nav-link" href="${contextPath}/user/logout.htm">Sign Out</a>
                                    </li>
                                </ul>
                            </c:when>
                        </c:choose>

                    </div>
                </nav>
            </div><!-- col-md-8 -->
        </div>
    </header>
</div>


<div class="container-fluid">
    <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="${contextPath}/user/${sessionScope.user.id}/blogManagement.htm">
                            <span data-feather="file"></span>
                            My Blogs
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="${contextPath}/user/${sessionScope.user.id}/userManagement.htm">
                            <span data-feather="file"></span>
                            My Profile
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${contextPath}/user/${sessionScope.user.id}/commentManagement.htm">
                            <span data-feather="file"></span>
                            Comments
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
            <form action="${contextPath}/user/${sessionScope.user.id}/${editArticle.id}/updateArticle.htm" method="post">
                <button type="submit" class="btn btn-secondary">Submit</button>
                <br>
                <div class="form-group">
                    <label>Title</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1" required name="blogtitle" value="${editArticle.title}">
                </div>
                <div class="form-group">
                    <label>Content</label>
                    <div id="test-editormd">
                        <textarea style="display:none;" class="form-control" id="editormd" name="editormd">${editArticle.content}</textarea>
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
