<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>学校列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="content-type" content="text/html; charset=utf-8 ;">
    <link rel="stylesheet" href="${baseUrl}/static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${baseUrl}/static/css/public.css">
    <style>
        #schoolPage {
            float: right;
            margin: -2px 20px;
        }
    </style>
</head>
<body>
<form class="layui-form" action="${baseUrl}/school/list.html">
    <blockquote class="layui-elem-quote quoteBox">
        <form class="layui-form" >
            <div class="layui-inline">
                <label >学校</label>
                <div class="layui-input-inline">
                    <input type="text" name="schoolName" class="layui-input searchVal" placeholder="请输入学校"/>
                </div>
                <input type="submit" value="搜索" class="layui-btn search_btn">
                <%--<button class="layui-btn search_btn">搜索</button>--%>
            </div>
        </form>
            <div class="layui-inline">
                <a class="layui-btn layui-btn-normal addPage_btn" href="javascript:void(0);">添加学校</a>
            </div>
            <div class="layui-inline">
                <a class="layui-btn layui-btn-danger layui-btn-normal delAll_btn" href="javascript:void(0);">批量删除</a>
            </div>

    </blockquote>
    <table class="layui-table">
        <thead>
        <tr>
            <th><input type="checkbox"></th>
            <th>学校名称</th>
            <th>学校地址</th>
            <th colspan="2">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="school" items="${schoolPageInfo.list}">
            <tr>
                <td><input type="checkbox"></td>
                <td>${school.schoolName}</td>
                <td>${school.address}</td>
                <td><a href="javascript:editPage(${school.schoolId});" class="layui-btn layui-btn-xs">编辑</a></td>
                <td><a href="javascript:deteteSchool('${baseUrl}/school/delete','${school.schoolId}');"
                       class="delete_btn layui-btn layui-btn-danger layui-btn-xs">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</form>
<div id="schoolPage"></div>
<script src="${baseUrl}/static/plugins/layui/layui.all.js"></script>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作

    var $ = layui.jquery;
    var layer = layui.layer;
     layui.element;
    var util = layui.util;
    var table = layui.table;
    var laypage = layui.laypage;
    util.fixbar({
        bar1: false
    });
    laypage.render({
        elem: 'schoolPage', //注意，这里的 test1 是 ID，不用加 # 号
        curr: ${schoolPageInfo.pageNum}
        , limit: ${schoolPageInfo.pageSize},
        limits: [10, 6, 8, 12, 14],
        count: ${schoolPageInfo.total} //数据总数，从服务端得到
        , layout: ['prev', 'page', 'next', 'skip', 'count', 'limit'],
        jump: function (obj, first) {
            //obj包含了当前分页的所有参数，比如：
            console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
            console.log(obj.limit); //得到每页显示的条数

            //首次不执行
            if (!first) {
                //do something
                window.location.href = "/school/list.html?pageNum=" + obj.curr + "&pageSize=" + obj.limit
            }
        }
    });
</script>
<script src="${baseUrl}/static/js/school.js"></script>
</body>
</html>
