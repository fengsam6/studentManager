<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="baseUrl" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>系统提示</title>
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="${baseUrl}/static/plugins/layui/css/layui.css">
    
    <style type="text/css">
        body{
            background: url("/static/img/error_bg2.jpg") no-repeat;

            background-size:cover;
        }
        .pageError p{
            display:block ;
            width: 280px;
            margin: 60px auto;
            font-size: 30px;
            color: #FF5722;
        }
    </style>
</head>
<body class="childrenBody">
<div class="sysError">
    <div class="pageError">


    </div>
</div>
<script type="text/javascript" src="${baseUrl}/static/plugins/layui/layui.js"></script>
<script>
    layui.use('layer', function(){
        var layer = layui.layer;

        layer.msg('${jsonResult.msg}',{icon:2,time:4000});
    });
</script>

</body>

</html>
