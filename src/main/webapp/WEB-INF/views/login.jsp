<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html class="loginHtml">
<head>
    <meta charset="utf-8"/>
    <title>登录</title>
    <link rel="stylesheet" href="${baseUrl}/static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${baseUrl}/static/css/public.css">
    <style type="text/css">
        .nav-color {
            display: block;
            background-color: #FF5722 !important;
        }
       #captcha_img{
            cursor: pointer;
        }
    </style>
</head>
<body class="loginBody">
<form class="layui-form userForm" action="${baseUrl}/user/login">
    <div class="login_face"><img src="${baseUrl}/static/img/face.jpg" class="userAvatar"></div>
    <div class="layui-form-item input-item">
        <label for="username">用户名</label>
        <input type="text" placeholder="请输入用户名" autocomplete="off" name="username" id="username" class="layui-input"
               lay-verify="required" value="admin">
    </div>
    <div class="layui-form-item input-item">
        <label for="password">密码</label>
        <input type="password" placeholder="请输入密码" autocomplete="off" id="password" name="password" class="layui-input"
               lay-verify="required" >
    </div>
    <div class="layui-form-item input-item" id="imgCode">
        <label for="inputCode">验证码</label>
            <input type="text" placeholder="请输入验证码" autocomplete="off" id="inputCode" class="layui-input" name="code">
    </div>
    <div class="layui-form-item input-item" >
        <img src="${baseUrl}/system/getCaptcha" id="captcha_img" onclick="refreshCode()">
    </div>
    <div class="layui-form-item">
        <button class="layui-btn layui-block login_btn" lay-filter="login" type="button">登录</button>
    </div>
</form>
<script type="text/javascript" src="${baseUrl}/static/plugins/jquery/jquery-3.2.1.js"></script>
<script src="${baseUrl}/static/plugins/layui/layui.all.js"></script>
<script type="text/javascript" src="${baseUrl}/static/js/login.js"></script>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作

    var layer = layui.layer;
    var element = layui.element;
    function refreshCode() {
        console.log("update code");
        $('#captcha_img').attr("src", "${baseUrl}/system/getCaptcha?" + Math.random());
    }
    $(function () {


        layer.msg("学生管理系统测试版，登录账号admin，<br/>密码123456", {icon: 6, time: 3500});
        $(".login_btn").click(function () {
            var userForm = $(".userForm");
            $.ajax({
                url: userForm.attr("action"),
//                dataType: "json",
                type: "post",
                data: userForm.serialize(),
                success: function (data) {
                    console.log(data);
                    if (data.erroCode === 0) {
                        layer.msg(data.msg, {icon: 6, time: 2000}, function () {
                            window.location.href = "${baseUrl}/admin/index.html";
                        });
                    } else {
                        layer.msg(data.msg, {icon: 5});
                        refreshCode();
                    }
                }
            })
        })
    })

</script>
</body>

</html>
