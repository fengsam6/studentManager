<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>系统错误</title>
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="${baseUrl}/static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${baseUrl}/static/css/public.css">
    <style type="text/css">
        .nav-color{
            display: block;
            background-color: #FF5722!important;
        }
    </style>
</head>
<body class="childrenBody">
<div class="noFind">
    <div class="ufo">
        <i class="seraph icon-test ufo_icon"></i>
        <i class="layui-icon page_icon">&#xe638;</i>
    </div>
    <div class="page404">
        <i class="layui-icon">&#xe61c;</i>
        <p>我勒个去，系统繁忙，请稍后访问呢!</p>
    </div>
</div>
<script type="text/javascript" src="${baseUrl}/static/plugins/layui/layui.js"></script>
</body>

</html>
