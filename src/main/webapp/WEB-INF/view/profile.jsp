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
    <link rel="stylesheet" href="${ctx}/lib/cropper/cropper.min.css">

    <link rel="stylesheet" href="${ctx}/css/app.css">
    <link rel="stylesheet" href="${ctx}/css/loading.css">
    <link rel="stylesheet" href="${ctx}/css/cropAavatar.css">

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
                <li><a href="#">个人信息</a></li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <form class="form-horizontal basic" role="form" method="post">
                <input type="hidden" name="id" value="${user.id}">
                <div class="form-group" style="margin-bottom: 0;">
                    <div class="col-sm-offset-1 col-md-offset-1 col-xs-2 col-sm-2 col-md-2  avatar-view">
                        <c:if test="${not empty user.avatar}">
                            <img src="${ctx}/${user.avatar}" class="img-circle avatar-img" alt="用户头像">
                        </c:if>
                        <c:if test="${empty user.avatar}">
                            <img src="${ctx}/img/avatar.jpg" class="img-circle avatar-img" alt="用户头像">
                        </c:if>
                    </div>
                    <div class="col-xs-offset-3 col-sm-offset-0 col-md-offset-0 col-xs-7 col-sm-6 col-md-6">
                        <div class="ez prof-name">${user.name}</div>
                        <div class="ez prof-role"><c:forEach var="role" items="${user.roles}"><label style="margin-right:10px;">${role.name}</label></c:forEach></div>
                    </div>
                </div>

                <div class="col-sm-offset-3 col-md-offset-3 col-xs-11 col-sm-8 col-md-8 splitor">
                    <a href="javascript:void(0);" class="ez prof-title">
                        <span class="fa fa-newspaper-o"></span> 基本资料
                    </a>

                    <a href="javascript:void(0);" class="ez prof-tool state-edit">
                        <span class="fa fa-pencil-square-o"></span> 编辑
                    </a>

                    <a href="javascript:void(0);" class="ez prof-tool state-editing hidden save">
                        <span class="glyphicon glyphicon-ok"></span>保存
                    </a>
                    <a href="javascript:void(0);" class="ez prof-tool state-editing hidden">
                        <span class="glyphicon glyphicon-remove"></span>取消
                    </a>
                </div>

                <div class="form-group">
                    <label class="col-sm-offset-2 col-md-offset-2 col-xs-4 col-sm-2 col-md-2 control-label">用户名</label>
                    <div class="col-xs-8 col-sm-6 col-md-6">
                        <p class="form-control-static">${user.username}</p>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-offset-2 col-md-offset-2 col-xs-4 col-sm-2 col-md-2 control-label">名称</label>
                    <div class="col-xs-8 col-sm-6 col-md-6">
                        <input type="text" class="form-control state-editing hidden" placeholder="姓名" name="name" value="${user.name}">
                        <p class="form-control-static state-edit">${user.name}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-2 col-md-offset-2 col-xs-4 col-sm-2 col-md-2 control-label">邮箱</label>
                    <div class="col-xs-8 col-sm-6 col-md-6">
                        <input type="text" class="form-control state-editing hidden" placeholder="example@xxx.com" name="email" value="${user.email}">
                        <p class="form-control-static state-edit">${user.email}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-offset-2 col-md-offset-2 col-xs-4 col-sm-2 col-md-2 control-label">备注</label>
                    <div class="col-xs-8 col-sm-6 col-md-6">
                        <textarea rows="3" class="form-control state-editing hidden" placeholder="备注" name="remarks" value="${user.remarks}"></textarea>
                        <p class="form-control-static state-edit">${user.remarks}</p>
                    </div>
                </div>
            </form>


            <form class="form-horizontal security" role="form" method="post">
                <input type="hidden" name="id" value="${user.id}">
                <div class="col-sm-offset-3 col-md-offset-3 col-xs-11 col-sm-8 col-md-8 splitor">
                    <a href="javascript:void(0);" class="ez prof-title">
                        <span class="fa fa-expeditedssl"></span> 安全设置
                    </a>

                    <a href="javascript:void(0);" class="ez prof-tool state-edit">
                        <span class="fa fa-pencil-square-o"></span> 编辑
                    </a>

                    <a href="javascript:void(0);" class="ez prof-tool state-editing hidden save">
                        <span class="glyphicon glyphicon-ok"></span>保存
                    </a>
                    <a href="javascript:void(0);" class="ez prof-tool state-editing hidden">
                        <span class="glyphicon glyphicon-remove"></span>取消
                    </a>
                </div>
                <div class="form-group state-edit">
                    <label class="col-sm-offset-2 col-md-offset-2 col-xs-4 col-sm-2 col-md-2 control-label">密码</label>
                    <div class="col-xs-8 col-sm-6 col-md-6">
                        <p class="form-control-static">*******</p>
                    </div>
                </div>
                <div class="form-group state-editing hidden">
                    <label class="col-sm-offset-2 col-md-offset-2 col-xs-4 col-sm-2 col-md-2 control-label">原密码</label>
                    <div class="col-xs-8 col-sm-6 col-md-6">
                        <input type="password" class="form-control"  name="old_pass">
                    </div>
                </div>
                <div class="form-group state-editing hidden">
                    <label class="col-sm-offset-2 col-md-offset-2 col-xs-4 col-sm-2 col-md-2 control-label">新密码</label>
                    <div class="col-xs-8 col-sm-6 col-md-6">
                        <input type="password" class="form-control" name="new_pass">
                    </div>
                </div>
                <div class="form-group state-editing hidden">
                    <label class="col-sm-offset-2 col-md-offset-2 col-xs-4 col-sm-2 col-md-2 control-label">确认密码</label>
                    <div class="col-xs-8 col-sm-6 col-md-6">
                        <input type="password" class="form-control" name="en_pass">
                    </div>
                </div>

            </form>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

</div>
<!-- ./wrapper -->

<!-- Cropping modal -->
<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <form class="avatar-form" action="${ctx}/profile/upload" enctype="multipart/form-data" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" id="avatar-modal-label">更改头像</h4>
                </div>
                <div class="modal-body">
                    <div class="avatar-body">

                        <!-- Upload image and data -->
                        <div class="avatar-upload">
                            <input type="hidden" class="avatar-src" name="avatar_src">
                            <input type="hidden" class="avatar-data" name="avatar_data">
                            <label for="avatarInput">本地上传</label>
                            <input type="file" class="avatar-input" id="avatarInput" name="avatar_file">
                        </div>

                        <!-- Crop and preview -->
                        <div class="row">
                            <div class="col-md-9">
                                <div class="avatar-wrapper"></div>
                            </div>
                            <div class="col-md-3">
                                <div class="preview-txt">预览:</div>
                                <div class="avatar-preview preview-lg"></div>
                                <div class="avatar-preview preview-md"></div>
                                <div class="avatar-preview preview-sm"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-offset-9 col-md-offset-9 col-md-3">
                                <button type="submit" class="btn btn-primary btn-block avatar-save">完成</button>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div> -->
            </form>
        </div>
    </div>
</div><!-- /.modal -->

<script src="${ctx}/lib/jQuery/jquery-2.2.3.min.js"></script>
<script src="${ctx}/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx}/lib/slimScroll/jquery.slimscroll.min.js"></script>
<script src="${ctx}/lib/jquery-validation/jquery.validate.js"></script>
<script src="${ctx}/lib/jquery-validation/localization/messages_zh.js"></script>
<script src="${ctx}/lib/cropper/cropper.min.js"></script>

<script src="${ctx}/lib/ez/app.js"></script>

<script src="${ctx}/lib/ez/cropAvatar.js"></script>

<script src="${ctx}/lib/ez/profile.js"></script>

</body>
</html>
