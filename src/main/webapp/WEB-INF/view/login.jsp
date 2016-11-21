<%--
style changed by metronic
@license MIT <http://opensource.org/licenses/MIT>
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>后台管理系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <link href="${ctx}/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${ctx}/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/css/login.css" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="favicon.ico">
</head>

<body class="login">

<div class="logo">
    <h2>后台管理系统</h2>
</div>

<div class="content">
    <!-- BEGIN LOGIN FORM -->
    <form class="login-form" action="${ctx}/login" method="post">
        <h3 class="form-title">登录</h3>

        <div class="alert alert-danger display-hide" hidden>
            <button class="close" data-close="alert"></button>
            <span> ${msg} </span>
        </div>

        <div class="form-group">
            <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
            <label class="control-label visible-ie8 visible-ie9">用户名</label>
            <input class="form-control" type="text" autocomplete="off"
                   placeholder="Username" name="username" value="ftinglee"/></div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">密码</label>
            <input class="form-control" type="password" autocomplete="off"
                   placeholder="Password" name="password" value="ftinglee"/></div>
        <div class="form-actions">
            <button type="submit" class="btn blue">登录</button>
            <label class="rememberme check mt-checkbox mt-checkbox-outline">
                <input type="checkbox" name="remember" value="1"/>
                <span>记住密码</span>
            </label>
            <a href="javascript:;" id="forget-password" class="forget-password">忘记密码</a>
        </div>
        <div class="create-account">
            <p>
                <a href="javascript:;" id="register-btn" class="uppercase">用户注册</a>
            </p>
        </div>
    </form>

</div>
<div class="copyright"> 2016 © ezbase, All Rights Reserved</div>

</body>

</html>