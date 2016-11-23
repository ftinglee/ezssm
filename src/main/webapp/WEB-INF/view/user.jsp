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

</head>
<body class="hold-transition skin-blue sidebar-mini fixed">
<div class="wrapper">

    <header class="main-header">

        <!-- Logo -->
        <a href="#" class="logo">
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
                    <!-- Notifications: style can be found in dropdown.less -->
                    <li class="dropdown notifications-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-bell-o"></i>
                            <span class="label label-warning">10</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">You have 10 notifications</li>
                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu">
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-users text-aqua"></i> 5 new members joined today
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="footer"><a href="#">View all</a></li>
                        </ul>
                    </li>
                    <!-- Tasks: style can be found in dropdown.less -->
                    <li class="dropdown tasks-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-flag-o"></i>
                            <span class="label label-danger">9</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">You have 9 tasks</li>
                            <li>
                                <!-- inner menu: contains the actual data -->
                                <ul class="menu">
                                    <li><!-- Task item -->
                                        <a href="#">
                                            <h3>
                                                Design some buttons
                                                <small class="pull-right">20%</small>
                                            </h3>
                                            <div class="progress xs">
                                                <div class="progress-bar progress-bar-aqua" style="width: 20%"
                                                     role="progressbar" aria-valuenow="20" aria-valuemin="0"
                                                     aria-valuemax="100">
                                                    <span class="sr-only">20% Complete</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <!-- end task item -->
                                </ul>
                            </li>
                            <li class="footer">
                                <a href="#">View all tasks</a>
                            </li>
                        </ul>
                    </li>
                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="${ctx}/img/user3-128x128.jpg" class="user-image" alt="User Image">
                            <span class="hidden-xs">Alexander Pierce</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="${ctx}/img/user3-128x128.jpg" class="img-circle" alt="User Image">

                                <p>
                                    Alexander Pierce - Web Developer
                                    <small>Member since Nov. 2012</small>
                                </p>
                            </li>
                            <!-- Menu Body -->
                            <li class="user-body">
                                <div class="row">
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Followers</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Sales</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Friends</a>
                                    </div>
                                </div>
                                <!-- /.row -->
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">Profile</a>
                                </div>
                                <div class="pull-right">
                                    <a href="#" class="btn btn-default btn-flat">Sign out</a>
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
                <c:forEach var="menu" items="${menus}">
                <li class="treeview">
                    <a  class="open" href="#" data-container="body" data-toggle="tooltip" title="${menu.name}" data-placement="right">
                        <i class="fa fa-caret-right"></i><span>${menu.name}</span>
                    </a>
                    <c:if test="${menu.children[0] != null}">
                    <ul class="treeview-menu">
                        <c:forEach var="menu" items="${menu.children}">
                            <c:if test="${menu.href eq currentPage}" >
                                <c:set var="currentMenu" value="${menu}"/>
                                <li class="active"><a href="${ctx}${menu.href}" data-container="body" data-toggle="tooltip" title="${menu.name}" data-placement="right"><i class="fa ${menu.icon}"></i><span>${menu.name}</span></a></li>
                            </c:if>
                            <c:if test="${menu.href ne currentPage}" >
                                <li><a href="${ctx}${menu.href}" data-container="body" data-toggle="tooltip" title="${menu.name}" data-placement="right"><i class="fa ${menu.icon}"></i><span>${menu.name}</span></a></li>
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

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa ${currentMenu.icon}"></i> &nbsp;${currentMenu.name}</a></li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div id="toolbar">
                <button id="add" class="btn btn-primary">
                    <i class="glyphicon glyphicon-plus"></i> 添加用户
                </button>
                <button id="remove" class="btn btn-danger" disabled>
                    <i class="glyphicon glyphicon-trash"></i> 删除用户
                </button>
            </div>
            <table id="table"
                   data-toolbar="#toolbar"
                   data-search="true"
                   data-show-refresh="true"
                   data-show-toggle="true"
                   data-show-columns="true"
                   data-show-export="true"
                   data-detail-view="true"
                   data-detail-formatter="detailFormatter"
                   data-minimum-count-columns="2"
                   data-show-pagination-switch="true"
                   data-pagination="true"
                   data-id-field="id"
                   data-page-list="[10, 25, 50, 100, ALL]"
                   data-show-footer="false"
                   data-side-pagination="server"
                   data-url="/ezssm/lib/bootstrap-table/data/data1.json"
                   data-response-handler="responseHandler">
            </table>

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
<script src="${ctx}/lib/bootstrap-table/bootstrap-table.min.js"></script>

<script>
    var $table = $('#table'),$remove = $('#remove'), selections = [];

    function initTable() {
        $table.bootstrapTable({
            height: getHeight(),
            columns: [
                [
                {
                    field: 'state',
                    checkbox: true,
                    rowspan: 2,
                    align: 'center',
                    valign: 'middle'
                }, {
                    title: 'Item ID',
                    field: 'id',
                    rowspan: 2,
                    align: 'center',
                    valign: 'middle',
                    sortable: true,
                    footerFormatter: totalTextFormatter
                }, {
                    title: 'Item Detail',
                    colspan: 3,
                    align: 'center'
                }
                ],
                [
                {
                    field: 'name',
                    title: 'Item Name',
                    sortable: true,
                    editable: true,
                    footerFormatter: totalNameFormatter,
                    align: 'center'
                }, {
                    field: 'price',
                    title: 'Item Price',
                    sortable: true,
                    align: 'center',
                    editable: false,
                    footerFormatter: totalPriceFormatter
                }, {
                    field: 'operate',
                    title: 'Item Operate',
                    align: 'center',
                    events: operateEvents,
                    formatter: operateFormatter
                }
                ]
            ]
        });
        // sometimes footer render error.
        setTimeout(function () {
            $table.bootstrapTable('resetView');
        }, 200);
        $table.on('check.bs.table uncheck.bs.table ' +
                'check-all.bs.table uncheck-all.bs.table', function () {
            $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);

            // save your data, here just save the current page
            selections = getIdSelections();
            // push or splice the selections if you want to save all data selections
        });
        $table.on('expand-row.bs.table', function (e, index, row, $detail) {
            if (index % 2 == 1) {
                $detail.html('Loading from ajax request...');
                $.get('LICENSE', function (res) {
                    $detail.html(res.replace(/\n/g, '<br>'));
                });
            }
        });
        $table.on('all.bs.table', function (e, name, args) {
            console.log(name, args);
        });
        $remove.click(function () {
            var ids = getIdSelections();
            $table.bootstrapTable('remove', {
                field: 'id',
                values: ids
            });
            $remove.prop('disabled', true);
        });
        $(window).resize(function () {
            $table.bootstrapTable('resetView', {
                height: getHeight()
            });
        });
    }

    function getIdSelections() {
        return $.map($table.bootstrapTable('getSelections'), function (row) {
            return row.id
        });
    }

    function responseHandler(res) {
        $.each(res.rows, function (i, row) {
            row.state = $.inArray(row.id, selections) !== -1;
        });
        return res;
    }

    function detailFormatter(index, row) {
        var html = [];
        $.each(row, function (key, value) {
            html.push('<p><b>' + key + ':</b> ' + value + '</p>');
        });
        return html.join('');
    }

    function operateFormatter(value, row, index) {
        return [
            '<a class="like" href="javascript:void(0)" title="Like">',
            '<i class="glyphicon glyphicon-heart"></i>',
            '</a>  ',
            '<a class="remove" href="javascript:void(0)" title="Remove">',
            '<i class="glyphicon glyphicon-remove"></i>',
            '</a>'
        ].join('');
    }

    window.operateEvents = {
        'click .like': function (e, value, row, index) {
            alert('You click like action, row: ' + JSON.stringify(row));
        },
        'click .remove': function (e, value, row, index) {
            $table.bootstrapTable('remove', {
                field: 'id',
                values: [row.id]
            });
        }
    };

    function totalTextFormatter(data) {
        return 'Total';
    }

    function totalNameFormatter(data) {
        return data.length;
    }

    function totalPriceFormatter(data) {
        var total = 0;
        $.each(data, function (i, row) {
            total += +(row.price.substring(1));
        });
        return '$' + total;
    }

    function getHeight() {
        return $(window).height() - $('.content-header').outerHeight(true);
    }

    $(function () {
        var scripts = [
                    location.search.substring(1) ||
                    '/ezssm/lib/bootstrap-table/extensions/export/bootstrap-table-export.js'
                ],
                eachSeries = function (arr, iterator, callback) {
                    callback = callback || function () {
                            };
                    if (!arr.length) {
                        return callback();
                    }
                    var completed = 0;
                    var iterate = function () {
                        iterator(arr[completed], function (err) {
                            if (err) {
                                callback(err);
                                callback = function () {
                                };
                            }
                            else {
                                completed += 1;
                                if (completed >= arr.length) {
                                    callback(null);
                                }
                                else {
                                    iterate();
                                }
                            }
                        });
                    };
                    iterate();
                };

        eachSeries(scripts, getScript, initTable);
    });

    function getScript(url, callback) {
        var head = document.getElementsByTagName('head')[0];
        var script = document.createElement('script');
        script.src = url;

        var done = false;
        // Attach handlers for all browsers
        script.onload = script.onreadystatechange = function () {
            if (!done && (!this.readyState ||
                    this.readyState == 'loaded' || this.readyState == 'complete')) {
                done = true;
                if (callback)
                    callback();

                // Handle memory leak in IE
                script.onload = script.onreadystatechange = null;
            }
        };

        head.appendChild(script);

        // We handle everything using the script element injection
        return undefined;
    }
</script>
</body>
</html>
