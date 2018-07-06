<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>班级列表</title>
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
                    <input type="text" class="layui-input searchVal" placeholder="请输入搜索的内容"/>
                </div>
                <a class="layui-btn search_btn" data-type="reload">搜索</a>
            </div>
            <div class="layui-inline">
                <a class="layui-btn layui-btn-normal addPage_btn" href="javascript:void(0);">添加班级</a>
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
            <th>班级名称</th>
            <th>班级说明</th>
            <th>创建时间</th>
            <th colspan="3">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="classObj" items="${classListModel}">
            <tr>
                <td><input type="checkbox"></td>
                <td>${classObj.className}</td>
                <td>${classObj.comment}</td>
                <td>${classObj.createTime}</td>
                <td><a href="javascript:void(0);"
                       class="layui-btn  layui-btn-normal layui-btn-xs showPage_btn">查看</a></td>

                <td><a href="javascript:editPage(${classObj.id});" class="layui-btn layui-btn-xs ">编辑</a></td>
                <td><a href="javascript:deteteClass('${baseUrl}/classObj/delete','${classObj.id}');"
                       class="delete_btn layui-btn layui-btn-danger layui-btn-xs">删除</a>
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
    function deteteClass(classId) {
        layer.confirm("确定删除该班级?", {icon: 3, title: '提示信息'}, function (index) {
                $.ajax({
                    url: "${baseUrl}/classObj/delete",
                    data: {id: classId},
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
                layer.close(index);
        })
    }
</script>
<script src="${baseUrl}/static/js/class.js"></script>
</body>
</html>
