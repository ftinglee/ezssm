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
    <%@ include file="common/base.jsp"%>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <ol class="breadcrumb">
                <!-- currentMenu defined in common/base.jsp -->
                <li><a href="#"><i class="fa ${currentMenu.icon}"></i> &nbsp;${currentMenu.name}</a></li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div id="toolbar">
                <button id="add" class="btn btn-primary" onclick="javascript:document.location.href='${ctx}/user/a'">
                    <i class="glyphicon glyphicon-plus"></i> 添加用户
                </button>
                <button id="remove" class="btn btn-danger" disabled>
                    <i class="glyphicon glyphicon-trash"></i> 删除用户
                </button>
            </div>
            <table id="table"
                   data-toolbar="#toolbar"
                   data-detail-formatter="detailFormatter"
                   data-minimum-count-columns="2"
                   data-pagination="true"
                   data-id-field="id"
                   data-page-list="[10, 25, 50, 100, ALL]"
                   data-side-pagination="server"
                   data-url="${ctx}/user/list"
                   data-response-handler="responseHandler"
                   data-query-params="queryParams" >
            </table>

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

</div>
<!-- ./wrapper -->

<!-- 模态框（Modal） -->
<div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    添加用户
                </h4>
            </div>
            <div class="modal-body">
                <form id="userForm" class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" name="username" class="form-control" placeholder="用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" class="form-control" placeholder="姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" name="password" class="form-control" id="inputPassword"
                                   placeholder="请输入密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" placeholder="example@xx.com">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="confirmBtn btn btn-primary">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script src="${ctx}/lib/jQuery/jquery-2.2.3.min.js"></script>
<script src="${ctx}/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx}/lib/slimScroll/jquery.slimscroll.min.js"></script>
<script src="${ctx}/lib/ez/app.js"></script>
<script src="${ctx}/lib/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${ctx}/lib/bootstrap-table/bootstrap-table-locale-all.min.js"></script>

<script src="${ctx}/lib/ez/user.js"></script>

</body>
</html>
