<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fengpeng
  Date: 4/17/21
  Time: 9:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
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

<div class="content-body">
    <div class="container">
        <div class="row">
            <main class="col-md-12">
                <h1>➤ 【 Search Results ※】</h1>

<%--                <c:choose>--%>
<%--                    <c:when test="${searchArticles.size() == 0}">--%>
<%--                        --%>
<%--                    </c:when>--%>
<%--                </c:choose>--%>

                <c:forEach var="article" items="${searchArticles}">
                    <article class="post post-1">
                        <header class="entry-header">
                            <h1 class="entry-title">
                                <a href="blog-detail.html">${article.title}</a>
                            </h1>
                            <div class="entry-meta">
                        <span class="post-date"><a href="#"><time class="entry-date"
                                                                  datetime="2012-11-09T23:15:57+00:00">${article.time}</time></a></span>
                                <span class="post-author"><a href="#">${article.user.username}</a></span>
                                <span class="comments-link"><a href="#">${article.comments.size()} comments</a></span>
                                <span class="views-count"><a href="#">${article.praises.size()} likes</a></span>
                            </div>
                        </header>
                        <div class="entry-content clearfix">
                            <div class="read-more cl-effect-14">
                                <a href="${contextPath}/user/${article.id}/userReadArticle.htm" class="more-link">View the Article<span class="meta-nav">→</span></a>
                            </div>
                        </div>
                    </article>

                </c:forEach>
            </main>
        </div>
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
            <li><a href="index.html">Home</a></li>
            <li><a href="full-width.html">Blog</a></li>
            <li><a href="about.html">About</a></li>
            <li><a href="contact.html">Contact</a></li>
        </ul>
    </nav>
</div>

<script src="js/script.js"></script>

</body>
</html>
