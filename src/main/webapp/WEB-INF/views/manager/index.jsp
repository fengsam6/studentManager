<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="utf-8">
    <title>学生管理后台首页</title>
    <meta name="renderer" content="webkit"/>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <link rel="stylesheet" href="${baseUrl}/static/plugins/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">学生信息管理</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:void(0);">
                    <img src="${baseUrl}/static/img/face.jpg" class="layui-nav-img">
                    ${loginUser.username}
                    <span>${userRole.roleName}</span>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:editPage(${loginUser.id})">基本资料</a></dd>
                    <dd><a href="#">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="javascript:void(0);" class="userLogout">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="layuiTab">
                <li class="layui-nav-item"><a href="javascript:void(0);">学生管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);" class="layTabPlus"
                               tab_url="${baseUrl}/student/listStudentInfo.html">学生列表</a></dd>
                        <dd><a href="javascript:void(0);" class="layTabPlus"
                               tab_url="${baseUrl}/student/add.html">添加学生</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="javascript:void(0);">班级管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);" class="layTabPlus"
                               tab_url="${baseUrl}/class/list.html">班级列表</a></dd>
                        <dd><a href="javascript:void(0);" class="layTabPlus"
                               tab_url="${baseUrl}/class/add.html">添加班级</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="javascript:void(0);">学校管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);" class="layTabPlus"
                               tab_url="${baseUrl}/school/list.html">学校列表</a></dd>
                        <dd><a href="javascript:void(0);" class="layTabPlus"
                               tab_url="${baseUrl}/school/add.html">添加学校</a></dd>
                    </dl>
                </li>
                <%--管理员才能访问--%>
                <c:if test="${loginUser.roleId>2}">
                    <li class="layui-nav-item"><a href="javascript:void(0);">用户管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:void(0);" class="layTabPlus"
                                   tab_url="${baseUrl}/user/listUserInfo.html">用户列表</a></dd>
                            <dd><a href="javascript:void(0);" class="layTabPlus"
                                   tab_url="${baseUrl}/user/add.html">添加用户</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item"><a href="javascript:void(0);">角色管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:void(0);" class="layTabPlus" tab_url="${baseUrl}/role/list.html">角色列表</a>
                            </dd>
                            <dd><a href="javascript:void(0);" class="layTabPlus"
                                   tab_url="${baseUrl}/role/add.html">添加角色</a></dd>
                        </dl>
                    </li>

                    <li class="layui-nav-item"><a href="javascript:void(0);" class="layTabPlus"
                                                  tab_url="${baseUrl}/systemLog/list.html">日志管理</a></li>
                </c:if>

            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="layui-tab" lay-filter="layuiTab" lay-allowClose="true">
            <ul class="layui-tab-title">

            </ul>
            <div class="layui-tab-content" style="padding:1px 18px">

            </div>
        </div>
    </div>

    <div class="layui-footer" >
        <!-- 底部固定区域 -->
        <a href="http://118.89.228.250/student/">学生信息管理</a> copyright @rf拥有
        <span >欢迎访问<a href="https://gitee.com/fengsam618/studentManager">学生信息管理码云地址</a></span>
    </div>
</div>
<script src="${baseUrl}/static/plugins/layui/layui.all.js"></script>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作

    var $ = layui.jquery;
    var layer = layui.layer;
    var element = layui.element;
    var util = layui.util;
    var table = layui.table;
    util.fixbar({
        bar1: false
    });

</script>
<script src="${baseUrl}/static/js/layTabPlus.js"></script>

<script>
    layTabPlus.init({
        lay_filter: 'layuiTab'
    });

    $(function () {
        $(".userLogout").click(function () {
            $.ajax({
                url: "${baseUrl}/user/logout",
                dataType: "json",
                type: "post",
                success: function (data) {
                    console.log(data);
                    if (data.erroCode === 0) {
                        layer.msg(data.msg, {icon: 1, time: 2000}, function () {
                            window.location.href = "${baseUrl}/login.html"
                        });
                    } else {
                        layer.msg(data.msg, {icon: 5});
                    }
                }
            });
        })
    })
</script>
<script src="${baseUrl}/static/js/user.js"></script>
</body>
</html>
