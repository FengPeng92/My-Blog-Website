<%--
  Created by IntelliJ IDEA.
  User: fengpeng
  Date: 4/19/21
  Time: 3:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Code &amp; Blogs</title>

    <!-- meta -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- css -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="/css/pace.css">
    <link rel="stylesheet" href="/css/custom.css">
    <link rel="stylesheet" href="/editormd/css/editormd.css" />
    <link rel="stylesheet" href="/editormd/css/editormd.preview.min.css" />

    <!-- js -->
    <script src="/editormd/js/jquery.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/pace.min.js"></script>
    <script src="/js/modernizr.custom.js"></script>
    <script src="/editormd/lib/prettify.min.js"></script>
    <script src="/editormd/js/editormd.js"></script>
    <script src="/editormd/lib/marked.min.js"></script>
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

            <main class="col-md-8">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <a href="${contextPath}/user/${selectedArticle.id}/articleEdit.htm"><button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">Edit</button></a>
                    <a href="${contextPath}/user/${sessionScope.user.id}/${selectedArticle.id}/articleDelete.htm"><button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">Delete</button></a>
                </div>
                <article class="post post-1">
                    <header class="entry-header">
                        <h1 class="entry-title">${selectedArticle.title}</h1>
                        <div class="entry-meta">
                            <%--                            <span class="post-category"><a href="#">Django ????????????</a></span>--%>
                            <span class="post-date"><a href="#"><time class="entry-date"
                                                                      datetime="2012-11-09T23:15:57+00:00">${selectedArticle.time}</time></a></span>
                            <span class="post-author"><a href="#">${selectedArticle.user.username}</a></span>
                            <span class="comments-link"><a href="#">${selectedArticle.comments.size()} comments</a></span>
                            <span class="views-count"><a href="#">${selectedArticle.praises.size()} likes</a></span>
                        </div>

                        <div class="entry-content" id = "test-editormd">
                            <textarea style="display:none;">${selectedArticle.content}</textarea>
                        </div>
                    </header>

                </article>

                <section class="comment-area" id="comment-area">
                    <hr>
<%--                    <h3>????????????</h3>--%>
<%--                    <form action="#" method="post" class="comment-form">--%>
<%--                        <div class="row">--%>
<%--                            <div class="col-md-12">--%>
<%--                                <label for="id_comment">?????????</label>--%>
<%--                                <textarea name="comment" id="id_comment" required></textarea>--%>
<%--                                <button type="submit" class="comment-btn">??????</button>--%>
<%--                            </div>--%>
<%--                        </div>    <!-- row -->--%>
<%--                    </form>--%>
                    <div class="comment-list-panel">
                        <h3>Comments</h3>
                        <ul class="comment-list list-unstyled">
                            <c:forEach var="comment" items="${selectedArticle.comments}">
                                <li class="comment-item" id="${comment.id}">
                                    <span class="nickname">${comment.user.username}</span>
                                    <time class="submit-date" datetime="2012-11-09T23:15:57+00:00">${comment.time}</time>
                                    <div class="text">
                                            ${comment.content}
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                </section>
            </main>
        </div>
</div>
<footer id="site-footer">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <p class="copyright">&copy 2021 - Modified by Feng Peng</p>
            </div>
        </div>
    </div>
</footer>


<!-- Mobile Menu -->
<div class="overlay overlay-hugeinc">
    <button type="button" class="overlay-close"><span class="ion-ios-close-empty"></span></button>
    <nav>
        <ul>
            <li><a href="index.html">??????</a></li>
            <li><a href="full-width.html">??????</a></li>
            <li><a href="about.html">??????</a></li>
            <li><a href="contact.html">??????</a></li>
        </ul>
    </nav>
</div>

<script src="/js/script.js"></script>

<script type="text/javascript">
    editormd.markdownToHTML("test-editormd",{emoji:true});
</script>

<c:choose>
    <c:when test="${param.commentID != null}">
        <script>
            document.getElementById("${param.commentID}").scrollIntoView({block:"center"});
            document.getElementById("${param.commentID}").style.borderColor = "red";
        </script>
    </c:when>

</c:choose>

</body>
</html>
