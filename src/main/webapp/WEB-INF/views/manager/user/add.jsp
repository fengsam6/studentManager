<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>添加用户</title>
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="${baseUrl}/static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${baseUrl}/static/css/public.css">
</head>
<body>
<form class="layui-form layui-row addForm" action="${baseUrl}/user/add">
    <div class="layui-col-md6 layui-col-xs12">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" name="username">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" name="password">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">角色</label>
            <div class="layui-input-block">
                <select name="roleId">
                    <option value="${role.id}" lay-verify="required">选择用户角色</option>
                    <c:forEach var="role" items="${roleListModel}">
                        <option value="${role.id}" lay-verify="required">${role.roleName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn add_btn">添加</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
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

