<%--
  Created by IntelliJ IDEA.
  User: fengpeng
  Date: 4/16/21
  Time: 10:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>admin-login</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/signin.css" rel="stylesheet">

</head>

<body class="text-center">
<form class="form-signin" action="/user/login.htm" method="post">
    <h1 style="margin-bottom: 50px">Code &amp; Blogs</h1>
    <label for="inputEmail" class="sr-only">Email address</label>
    <input type="email" id="inputEmail" name = "email" class="form-control" placeholder="Email address" required autofocus>
    <label for="inputPassword" class="sr-only">Password</label>
    <input type="password" id="inputPassword" name = "password" class="form-control" placeholder="Password" required>
    <button class="btn btn-lg btn-dark btn-block" type="submit">Login</button>
    <p class="mt-5 mb-3 text-muted">${error}</p>
    <p class="mt-5 mb-3 text-muted">${edit}</p>
</form>
</body>
</html>
