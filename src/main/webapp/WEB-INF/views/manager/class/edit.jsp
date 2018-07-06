<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <title>编辑学生</title>
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="${baseUrl}/static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${baseUrl}/static/css/main.css">
    <style type="text/css">
        .nav-color {
            display: block;
            background-color: #FF5722 !important;
        }
    </style>
</head>

<body class="layui-layout-body">

<form class="layui-form layui-row editForm" action="${baseUrl}/student/update">
    <input type="hidden" name="id" value="${studentModel.id}">
    <div class="layui-container">
        <div class="layui-col-md6 layui-col-xs12">

            <div class="layui-form-item">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="studentName" placeholder="请输入姓名" lay-verify="required" class="layui-input" value="${studentModel.studentName}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">学号</label>
                <div class="layui-input-block">
                    <input type="text" name="studentNum" placeholder="请输入学号" lay-verify="required" class="layui-input" value="${studentModel.studentNum}">
                </div>
            </div>
            <div class="layui-form-item" pane="">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block userSex">
                    <input type="radio" name="sex" value="男" title="男" checked="">
                    <input type="radio" name="sex" value="女" title="女">
                    <input type="radio" name="sex" value="保密" title="保密">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">班级</label>
                <div class="layui-input-block">
                    <input type="text" name="className" placeholder="请输入班级" lay-verify="required"
                           class="layui-input" value="${studentModel.className}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">专业</label>
                <div class="layui-input-block">
                    <input type="text" name="major" placeholder="请输入专业" lay-verify="required" class="layui-input" value="${studentModel.major}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-block">
                    <input type="text" name="phone" placeholder="请输入手机号" lay-verify="required" class="layui-input" value="${studentModel.phone}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">入学时间</label>
                <div class="layui-input-block">
                    <input type="text" name="enterSchoolTime" placeholder="请输入入学时间" lay-verify="userBirthday" readonly
                           class="layui-input userBirthday" value="${studentModel.enterSchoolTime}">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-block">
                    <input type="text" name="email" placeholder="请输入邮箱" lay-verify="email"
                           class="layui-input userEmail" value="${studentModel.className}">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn update_btn" type="button">立即提交</button>
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
<script src="${baseUrl}/static/js/student.js"></script>
</body>
</html>