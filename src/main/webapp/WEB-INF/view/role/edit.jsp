<%--
changed by https://github.com/almasaeed2010/AdminLTE
and some style inspired by aliyun console
@license MIT <http://opensource.org/licenses/MIT>
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <%@ include file="../common/base.jsp"%>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <ol class="breadcrumb">
                <!-- currentMenu defined in common/base.jsp -->
                <li><i class="fa ${currentMenu.icon}"></i> &nbsp;${currentMenu.name}&nbsp;<i class="fa fa-angle-right"></i>&nbsp;编辑</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <form class="form-horizontal" role="form" method="post">
                <input type="hidden" name="id" value="${role.id}">
                <div class="form-group">
                    <label class="col-sm-offset-2 col-md-offset-2 col-xs-4 col-sm-2 col-md-2 control-label">名称</label>
                    <div class="col-xs-8 col-sm-6 col-md-6">
                        <input type="text" class="form-control" placeholder="名称" name="name" value="${role.name}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-2 col-md-offset-2 col-xs-4 col-sm-2 col-md-2 control-label">备注</label>
                    <div class="col-xs-8 col-sm-6 col-md-6">
                        <textarea rows="3" class="form-control" placeholder="备注" name="remarks" value="${role.remarks}"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-md-offset-4 col-xs-12 col-sm-8 col-md-8">
                        <button class="btn btn-default btn-left" onclick="javascript:history.back();">取消</button>
                        <button type="submit" class="btn btn-primary">提交</button>
                    </div>
                </div>
            </form>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

</div>
<!-- ./wrapper -->

<script src="${ctx}/lib/jQuery/jquery-2.2.3.min.js"></script>
<script src="${ctx}/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx}/lib/slimScroll/jquery.slimscroll.min.js"></script>
<script src="${ctx}/lib/jquery-validation/jquery.validate.min.js"></script>
<script src="${ctx}/lib/jquery-validation/localization/messages_zh.js"></script>

<script src="${ctx}/lib/ez/app.js"></script>

<script src="${ctx}/lib/ez/role.edit.js"></script>

</body>
</html>
