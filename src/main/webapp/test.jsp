<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>登录</title>
    <link rel="stylesheet" href="${baseUrl}/static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${baseUrl}/static/css/main.css">
    <style type="text/css">
        .nav-color{
            display: block;
            background-color: #FF5722!important;
        }
    </style>
</head>

<body class="layui-layout-body">
<form method="post">
    <div class="layui-form-item">
        <label for="L_email" class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
            <input type="text" id="L_email" name="email" required lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="L_pass" class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="password" id="L_pass" name="pass" required lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="L_vercode" class="layui-form-label">人类验证</label>
        <div class="layui-input-inline">
            <input type="text" id="L_vercode" name="vercode" required lay-verify="required" placeholder="请回答后面的问题" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid">
            <span style="color: #c00;">{{d.vercode}}</span>
        </div>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn" lay-filter="*" lay-submit>立即登录</button>
    </div>
</form>
</body>

</html>
