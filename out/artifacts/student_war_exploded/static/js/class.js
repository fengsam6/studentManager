var layerIndex;
function deteteClass(url,classId) {
    layer.confirm("确定删除该班级?", {icon: 3, title: '提示信息'}, function (index) {
        $.ajax({
            url: url,
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

function editPage(classId) {
    layerIndex = layer.open({
        type: 2,
        title: "编辑班级",
        area: ['60%', '65%'],
        fixed: false, //不固定
        maxmin: true,
        content: '/class/edit.html?classId=' + classId
    });
}
$(".addPage_btn").click(function () {
    layerIndex = layer.open({
        type: 2,
        area: ['60%', '65%'],
        title: "添加班级",
        fixed: false, //不固定
        maxmin: true,
        content: '/class/add.html'
    });
});
$(".showPage_btn").click(function () {
    layerIndex = layer.open({
        type: 2,
        title: "查看班级",
        area: ['60%', '65%'],
        fixed: false, //不固定
        maxmin: true,
        content: '/class/detail.html'
    });
});



$(".add_btn").click(function () {
    var addForm = $(".addForm");
    $.ajax({
        url: addForm.attr("action"),
        dataType: "json",
        type: "post",
        data: addForm.serialize(),
        success: function (data) {
            console.log(data);
            if (data.erroCode === 0) {
                layer.msg(data.msg, {icon: 1, time: 2000}, function () {
                    var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                    console.log(index);
                    if (index > 0) {
                        window.parent.location.reload(); //刷新父页面
                    }
                });
            } else {
                layer.msg(data.msg, {icon: 5});
            }
        }
    })
});
$(".update_btn").click(function () {
    var editForm = $(".editForm");
    $.ajax({
        url: editForm.attr("action"),
        dataType: "json",
        type: "post",
        data: editForm.serialize(),
        success: function (data) {
            console.log(data);
            if (data.erroCode === 0) {
                layer.msg(data.msg, {icon: 1, time: 2000}, function () {
                    var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
                    console.log(index);
                    if (index > 0) {
                        window.parent.location.reload(); //刷新父页面
                    }
                });
            } else {
                layer.msg(data.msg, {icon: 5});
            }
        }
    })
});





