<%--
  Created by IntelliJ IDEA.
  User: fengpeng
  Date: 4/17/21
  Time: 10:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>userRegister</title>

    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/signin.css" rel="stylesheet">

</head>

<body class="text-center">
<form class="form-signin" action="/user/register.htm" method="post">
    <h1 style="margin-bottom: 50px">Code &amp; Blogs</h1>
    <label for="username" class="sr-only">Username</label>
    <input type="text" id="username" name="username" class="form-control" placeholder="Username" required autofocus>
    <label for="email" class="sr-only">Email Address</label>
    <input type="email" id="email" name="email" class="form-control" placeholder="Email address" required>

    <label for="password" class="sr-only">Password</label>
    <input type="password" id="password" name="password" class="form-control" placeholder="Password" required autofocus>
    <label for="repassword" class="sr-only">Confirm Password</label>
    <input type="password" id="repassword" name="repassword" class="form-control" placeholder="Confirm Password" required>
    <button class="btn btn-lg btn-dark btn-block" type="submit">Register</button>
    <p class="mt-5 mb-3 text-muted">${error}</p>

</form>
</body>
</html>
