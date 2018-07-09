<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <title>编辑角色</title>
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="${baseUrl}/static/plugins/layui/css/layui.css">
    <style type="text/css">
        .nav-color {
            display: block;
            background-color: #FF5722 !important;
        }
    </style>
</head>

<body class="layui-layout-body">

<form class="layui-form layui-row editForm" action="${baseUrl}/role/update">
    <div class="layui-container">
        <div class="layui-col-md6 layui-col-xs12">
            <input type="hidden" name="id" value="${roleModel.id}">
            <div class="layui-form-item">
                <label class="layui-form-label">角色名称</label>
                <div class="layui-input-block">
                    <input type="text" name="roleName" placeholder="请输入角色名称" lay-verify="required"
                           class="layui-input" value="${roleModel.roleName}">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn update_btn" type="button">更新</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
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
    util.fixbar({
        bar1: false
    });

</script>
<script src="${baseUrl}/static/js/role.js"></script>
</body>
</html>