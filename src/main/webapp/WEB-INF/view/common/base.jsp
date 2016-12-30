<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="main-header">
    <!-- Logo -->
    <a href="${ctx}" class="logo">
        <span class="logo-mini"><b>EZ</b></span>
        <span class="logo-lg"><b>EZ</b>SSM</span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <c:if test="${not empty sessionScope.user.avatar}">
                            <img src="${ctx}/${sessionScope.user.avatar}" class="user-image" alt="用户头像">
                        </c:if>
                        <c:if test="${empty sessionScope.user.avatar}">
                            <img src="${ctx}/img/avatar.jpg" class="user-image" alt="用户头像">
                        </c:if>
                        <span class="hidden-xs">${sessionScope.user.name}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">
                            <c:if test="${not empty sessionScope.user.avatar}">
                                <img src="${ctx}/${sessionScope.user.avatar}" class="img-circle" alt="用户头像">
                            </c:if>
                            <c:if test="${empty sessionScope.user.avatar}">
                                <img src="${ctx}/img/avatar.jpg" class="img-circle" alt="用户头像">
                            </c:if>

                            <p>
                                ${sessionScope.user.name} - <c:forEach var="role" items="${sessionScope.user.roles}"><label style="margin-right:10px;">${role.name}</label></c:forEach>
                                <small>上次登录时间:2016-01-01 16:01:00</small>
                            </p>
                        </li>
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="${ctx}/profile" class="btn btn-default btn-flat">修改个人信息</a>
                            </div>
                            <div class="pull-right">
                                <a href="${ctx}/logout" class="btn btn-default btn-flat">退出</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>

    </nav>
</header>
<aside class="main-sidebar">
    <section class="sidebar">
        <ul class="sidebar-menu">
            <c:forEach var="menu" items="${sessionScope.menus}">
                <li class="treeview">
                    <a class="open" href="#" data-container="body" data-toggle="tooltip" title="${menu.name}"
                       data-placement="right">
                        <i class="fa fa-caret-right"></i><span>${menu.name}</span>
                    </a>
                    <c:if test="${menu.children[0] != null}">
                        <ul class="treeview-menu">
                            <c:forEach var="menu" items="${menu.children}">
                                <c:if test="${menu.href eq currentPage}">
                                    <c:set var="currentMenu" value="${menu}"/>
                                    <li class="active">
                                        <a href="${ctx}${menu.href}" title="${menu.name}"
                                           data-container="body" data-toggle="tooltip" data-placement="right">
                                            <i class="fa ${menu.icon}"></i><span>${menu.name}</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${menu.href ne currentPage}">
                                    <li>
                                        <a href="${ctx}${menu.href}" title="${menu.name}"
                                           data-container="body" data-toggle="tooltip" data-placement="right">
                                            <i class="fa ${menu.icon}"></i><span>${menu.name}</span>
                                        </a>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </c:if>
                </li>
            </c:forEach>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
<script>
    var context = "${ctx}";
</script>

<!-- Loading state -->
<div class="load-container" tabindex="-1">
    <div class="loader"></div>
</div>

