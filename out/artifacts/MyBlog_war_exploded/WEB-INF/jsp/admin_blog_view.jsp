<%--
  Created by IntelliJ IDEA.
  User: fengpeng
  Date: 4/18/21
  Time: 11:45 AM
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

<body id="single">

<div class="container">
    <header id="site-header">
        <div class="row">
            <div class="col-md-4 col-sm-5 col-xs-8">
                <div class="logo">
                    <h1><a href="index.html"><b>Code</b> &amp; Blogs</a></h1>
                </div>
            </div><!-- col-md-4 -->
        </div>
    </header>
</div>

<div class="content-body">
    <div class="container">
        <div class="row">
            <main class="col-md-8">
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
                    <h3>发表评论</h3>
                    <form action="#" method="post" class="comment-form">
                        <div class="row">
                            <div class="col-md-12">
                                <label for="id_comment">评论：</label>
                                <textarea name="comment" id="id_comment" required></textarea>
                                <button type="submit" class="comment-btn">发表</button>
                            </div>
                        </div>    <!-- row -->
                    </form>
                    <div class="comment-list-panel">
                        <h3>评论列表，共 <span>4</span> 条评论</h3>
                        <ul class="comment-list list-unstyled">
                            <li class="comment-item">
                                <span class="nickname">追梦人物</span>
                                <time class="submit-date" datetime="2012-11-09T23:15:57+00:00">2017年3月12日 14:56</time>
                                <div class="text">
                                    文章观点又有道理又符合人性，这才是真正为了表达观点而写，不是为了迎合某某知名人士粉丝而写。我觉得如果琼瑶是前妻，生了三孩子后被一不知名的女人挖了墙角，我不信谁会说那个女人是追求真爱，说同情琼瑶骂小三的女人都是弱者。
                                </div>
                            </li>
                            <li class="comment-item">
                                <span class="nickname">zmrenwu</span>
                                <time class="submit-date" datetime="2012-11-09T23:15:57+00:00">2017年3月11日 23:56</time>
                                <div class="text">
                                    本能有可能会冲破格局，但格局有时候也会拘住本能。
                                </div>
                            </li>
                            <li class="comment-item">
                                <span class="nickname">蝙蝠侠</span>
                                <time class="submit-date" datetime="2012-11-09T23:15:57+00:00">2017年3月9日 8:56</time>
                                <div class="text">
                                    其实真理一般是属于沉默的大多数的。那些偏激的观点只能吸引那些同样偏激的人。前几年琼瑶告于妈抄袭，大家都表示大快人心，说明吃瓜观众都只是就事论事，并不是对琼瑶有偏见。
                                </div>
                            </li>
                            <li class="comment-item">
                                <span class="nickname">长江七号</span>
                                <time class="submit-date" datetime="2012-11-09T23:15:57+00:00">2017年2月12日 12:56</time>
                                <div class="text">
                                    观点我很喜欢！就是哎嘛本来一清二楚的，来个小三小四乱七八糟一团乱麻夹缠不清，简直麻烦要死
                                </div>
                            </li>
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
                <p class="copyright">&copy 2017 - Collect from <a href="http://www.cssmoban.com/"
                                                                  target="_blank" title="模板之家">模板之家</a>
                    - Modified by <a href="http://zmrenwu.com/" title="网页模板" target="_blank">追梦人物的博客</a>
                </p>
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

