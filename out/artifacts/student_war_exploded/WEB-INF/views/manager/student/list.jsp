<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>学生列表</title>
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="${baseUrl}/static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${baseUrl}/static/css/public.css">
    <style>
        #studentPage {
            float: right;
            margin: -2px 20px;
        }
    </style>
</head>
<body>
<form class="layui-form">
    <blockquote class="layui-elem-quote quoteBox">
        <form class="layui-form">
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <input type="text" class="layui-input searchVal" placeholder="请输入搜索的内容"/>
                </div>
                <a class="layui-btn search_btn" data-type="reload">搜索</a>
            </div>
            <div class="layui-inline">
                <a class="layui-btn layui-btn-normal addPage_btn" href="javascript:void(0);">添加学生</a>
            </div>
            <div class="layui-inline">
                <a class="layui-btn layui-btn-danger layui-btn-normal delAll_btn" href="javascript:void(0);">批量删除</a>
            </div>
        </form>
    </blockquote>
    <table class="layui-table">
        <thead>
        <tr>
            <th><input type="checkbox"></th>
            <th>姓名</th>
            <th>性别</th>
            <th>学号</th>
            <th>班级</th>
            <th>专业</th>
            <th>手机号</th>
            <th>图像</th>
            <th>学校</th>
            <th colspan="2">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="student" items="${studentPageInfo.list}">
            <tr>
                <td><input type="checkbox"></td>
                <td>${student.studentName}</td>
                <td>
                    <c:choose>
                        <c:when test="${student.gender==0}">
                            男
                        </c:when>
                        <c:when test="${student.gender==1}">
                            女
                        </c:when>
                        <c:otherwise>
                            保密
                        </c:otherwise>
                    </c:choose>
                </td>

                <td>${student.studentNum}</td>
                <td>${student.classObj.className}</td>
                <td>${student.major}</td>
                <td>${student.phone}</td>
                <td>${student.averPath}</td>
                <td>${student.school.schoolName}</td>
                <td><a href="javascript:editPage(${student.id});" class="layui-btn layui-btn-xs ">编辑</a></td>
                <td><a href="javascript:deteteStudent('${baseUrl}/student/delete','${student.id}');"
                       class="delete_btn layui-btn layui-btn-danger layui-btn-xs">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div id="studentPage"></div>
</form>
<script src="${baseUrl}/static/plugins/layui/layui.all.js"></script>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作

    var $ = layui.jquery;
    var layer = layui.layer;
    var element = layui.element;
    var util = layui.util;
    var table = layui.table;
    var laypage = layui.laypage;
    util.fixbar({
        bar1: false
    });
    laypage.render({
        elem: 'studentPage', //注意，这里的 test1 是 ID，不用加 # 号
        curr: ${studentPageInfo.pageNum}
        , limit: ${studentPageInfo.pageSize},
        limits: [10, 6, 8, 12, 14],
        count: ${studentPageInfo.total} //数据总数，从服务端得到
        , layout: ['prev', 'page', 'next', 'skip', 'count', 'limit'],
        jump: function (obj, first) {
            //obj包含了当前分页的所有参数，比如：
            console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
            console.log(obj.limit); //得到每页显示的条数

            //首次不执行
            if (!first) {
                //do something
                window.location.href = "/student/listStudentInfo.html?pageNum=" + obj.curr + "&pageSize=" + obj.limit
            }
        }
    });
</script>
<script src="${baseUrl}/static/js/student.js"></script>
</body>
</html>
