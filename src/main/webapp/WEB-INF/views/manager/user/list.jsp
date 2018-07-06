
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>用户列表</title>
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="${baseUrl}/static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${baseUrl}/static/css/public.css">
</head>
<body>
<form class="layui-form">
    <blockquote class="layui-elem-quote quoteBox">
        <form class="layui-form">
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <input type="text" class="layui-input searchVal" placeholder="请输入搜索的内容" />
                </div>
                <a class="layui-btn search_btn" data-type="reload">搜索</a>
            </div>
            <div class="layui-inline">
                <a class="layui-btn layui-btn-normal addPage_btn">添加用户</a>
            </div>
            <div class="layui-inline">
                <a class="layui-btn layui-btn-danger layui-btn-normal delAll_btn">批量删除</a>
            </div>
        </form>
    </blockquote>
    <table class="layui-table">
        <thead>
        <tr>
            <th><input type="checkbox"></th>
            <th>用户名</th>
            <th>密码</th>
            <th>角色名称</th>
            <th>创建时间</th>
            <th>最后次登录时间</th>
            <th colspan="3">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${pageInfoModel.list}">
            <tr>
                <td><input type="checkbox"></td>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td>${user.role.roleName}</td>
                <td>${user.createTime}</td>
                <td>${user.lastLoginTime}</td>
                <td><a href="javascript:void(0);"
                       class="layui-btn  layui-btn-normal layui-btn-xs showPage_btn">查看</a></td>

                <td><a href="javascript:editPage(${user.id});" class="layui-btn layui-btn-xs">编辑</a></td>
                <td><a href="javascript:deteteUser(${user.id});"
                       class=" layui-btn layui-btn-danger layui-btn-xs">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</form>
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
<script src="${baseUrl}/static/js/user.js"></script>
</body>
</html>
