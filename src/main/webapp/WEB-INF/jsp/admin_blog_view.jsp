<%--
  Created by IntelliJ IDEA.
  User: fengpeng
  Date: 4/18/21
  Time: 11:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Blog view</title>

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


    <title>Edit Blog</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/dashboard.css" rel="stylesheet">
</head>

<body id="single">
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">${admin.getUsername()}</a>
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <a class="nav-link" href="${contextPath}/admin/logout.htm">Sign out</a>
        </li>
    </ul>
</nav>


<div class="container">
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
                <article class="post post-1">
                    <header class="entry-header">
                        <h1 class="entry-title">${viewArticle.title}</h1>
                        <div class="entry-meta">
<%--                            <span class="post-category"><a href="#">Django 博客教程</a></span>--%>
                            <span class="post-date"><a href="#"><time class="entry-date"
                                                                      datetime="2012-11-09T23:15:57+00:00">${viewArticle.time}</time></a></span>
                            <span class="post-author"><a href="#">${viewArticle.user.username}</a></span>
                            <span class="comments-link"><a href="#">${viewArticle.comments.size()} comments</a></span>
                            <span class="views-count"><a href="#">${viewArticle.praises.size()} likes</a></span>
                        </div>

                        <div class="entry-content" id = "test-editormd">
                            <textarea style="display:none;">${viewArticle.content}</textarea>
                        </div>
                    </header>

                </article>

                <section class="comment-area" id="comment-area">
                    <hr>
                    <h3>Comments: </h3>
                    <form action="${contextPath}/admin/${viewArticle.id}/writeComment.htm" method="post" class="comment-form">
                        <div class="row">
                            <div class="col-md-12">

                                <textarea name="comment" id="id_comment" required></textarea>
                                <button type="submit" class="comment-btn">Submit</button>
                            </div>
                        </div>    <!-- row -->
                    </form>
                    <div class="comment-list-panel">
                        <h3>Comments</h3>
                        <ul class="comment-list list-unstyled">
                            <c:forEach var="comment" items="${viewArticle.comments}">
                                <li class="comment-item">
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
            <li><a href="index.html">首页</a></li>
            <li><a href="full-width.html">博客</a></li>
            <li><a href="about.html">关于</a></li>
            <li><a href="contact.html">联系</a></li>
        </ul>
    </nav>
</div>

<script src="/js/script.js"></script>

<script type="text/javascript">
    editormd.markdownToHTML("test-editormd",{emoji:true});
</script>

</body>
</html>

