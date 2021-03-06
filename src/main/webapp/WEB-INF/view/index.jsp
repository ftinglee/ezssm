<%--
changed by https://github.com/almasaeed2010/AdminLTE
and some style inspired by aliyun console
@license MIT <http://opensource.org/licenses/MIT>
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>ezssm</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${ctx}/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/lib/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctx}/lib/bootstrap-table/bootstrap-table.css">

    <link rel="stylesheet" href="${ctx}/css/app.css">
    <link rel="stylesheet" href="${ctx}/css/loading.css">

</head>
<body class="hold-transition skin-blue sidebar-mini fixed">
<div class="wrapper">

    <!-- use include JSP instruction , not JSP action ,caz need share attributes between two jsp page   -->
    <%@ include file="common/base.jsp"%>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <ol class="breadcrumb">
                <!-- currentMenu defined in common/base.jsp -->
                <li><a href="#">总体概况</a></li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="info-con">
                <div class="header">操作系统信息</div>
                <div><span>系统架构</span><span>${system.os.arch}</span></div>
                <div><span>系统名称</span><span>${system.os.name}</span></div>
                <div><span>系统版本</span><span>${system.os.version}</span></div>
                <div><span>可用处理器数目</span><span>${system.os.availableProcessors}</span></div>
            </div>

            <div class="info-con">
                <div class="header">虚拟机运行状态</div>
                <div><span>总的内存量</span><span><fmt:formatNumber type="number" maxFractionDigits="2" groupingUsed="false" value="${system.runTime.totalMemory/1024/1024}"/> M</span></div>
                <div><span>空闲内存量</span><span><fmt:formatNumber type="number" maxFractionDigits="2" groupingUsed="false" value="${system.runTime.freeMemory/1024/1024}"/> M</span></div>
                <div><span>最大内存量</span><span><fmt:formatNumber type="number" maxFractionDigits="2" groupingUsed="false" value="${system.runTime.maxMemory/1024/1024}"/> M</span></div>
            </div>

            <div class="info-con">
                <div class="header">数据库信息</div>
                <div><span>名称</span><span>${system.db.name}</span></div>
                <div><span>版本</span><span>${system.db.version}</span></div>
            </div>

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

</div>
<!-- ./wrapper -->

<script src="${ctx}/lib/jQuery/jquery-2.2.3.min.js"></script>
<script src="${ctx}/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx}/lib/slimScroll/jquery.slimscroll.min.js"></script>
<script src="${ctx}/lib/ez/app.js"></script>

</body>
</html>
