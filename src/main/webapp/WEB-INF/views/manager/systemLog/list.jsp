<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>日志列表</title>
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="${baseUrl}/static/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="${baseUrl}/static/css/public.css">
    <style>
        #systemLogPage {
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
                <a class="layui-btn layui-btn-danger layui-btn-normal delAll_btn" href="javascript:void(0);">批量删除</a>
            </div>
        </form>
    </blockquote>
    <table class="layui-table">
        <thead>
        <tr>
            <th><input type="checkbox" name="ids"></th>
            <th>用户名称</th>
            <th>操作</th>
            <th>请求方法</th>
            <%--<th>参数</th>--%>
            <th>创建时间</th>
            <th>执行时长</th>
            <th>ip</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="systemLog" items="${systemLogPageInfo.list}">
            <tr>
                <td><input type="checkbox" name="id" value="${systemLog.id}"></td>
                <td>${systemLog.username}</td>
                <td>${systemLog.operation}</td>
                <td>${systemLog.method}</td>
                <%--<td>${systemLog.params}</td>--%>
                <td>${systemLog.createDate}</td>
                <td>${systemLog.time} 毫秒</td>
                <td>${systemLog.ip}</td>
                <td><a href="javascript:deteteSystemLog('/systemLog/delete',${systemLog.id});"
                       class="delete_btn layui-btn layui-btn-danger layui-btn-xs">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</form>
<div id="systemLogPage"></div>
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
$(".delAll_btn").click(function () {
    var ids = $(":checked").value;
    layer.confirm("确定删除该日志?", {icon: 3, title: '提示信息'}, function (index) {
        $.ajax({
            url: "/systemLog/deleteBatch",
            data: {ids: ids},
            dataType: "json",
            type: "post",
            success: function (data) {
                console.log(data);
                if (data.erroCode === 0) {
                    layer.msg(data.msg, {icon: 1, time: 2000}, function () {
                        window.location.reload()
                    });
                } else {
                    layer.msg(data.msg, {icon: 5});
                }
            }
        });
    })
});

    laypage.render({
        elem: 'systemLogPage', //注意，这里的 test1 是 ID，不用加 # 号
        curr: ${systemLogPageInfo.pageNum}
        , limit: ${systemLogPageInfo.pageSize},
        limits: [10, 6, 8, 12, 14],
        count: ${systemLogPageInfo.total} //数据总数，从服务端得到
        , layout: ['prev', 'page', 'next', 'skip', 'count', 'limit'],
        jump: function (obj, first) {
            //obj包含了当前分页的所有参数，比如：
            console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
            console.log(obj.limit); //得到每页显示的条数

            //首次不执行
            if (!first) {
                //do something
                window.location.href = "/systemLog/list.html?pageNum=" + obj.curr + "&pageSize=" + obj.limit
            }
        }
    });
</script>
<script src="${baseUrl}/static/js/systemLog.js"></script>
</body>
</html>
