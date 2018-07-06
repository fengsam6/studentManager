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
</script>
<script src="${baseUrl}/static/js/layTabPlus.js"></script>

<script>
    layTabPlus.init({
        lay_filter: 'layuiTab'
    });
    $(function () {

        layTabPlus.addTab("page/introduce.html", "首页");
    });
    function show() {
        layer.msg("制作人：任峰", {icon: 6});
    }
</script>

