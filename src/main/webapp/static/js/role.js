var layerIndex;
function deteteRole(roleId) {
    layer.confirm("确定删除该角色?", {icon: 3, title: '提示信息'}, function (index) {
        $.ajax({
            url: '/role/delete',
            data: {id: roleId},
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

function editPage(roleId) {
    layerIndex = layer.open({
        type: 2,
        area: ['90%', '100%'],
        title: "编辑角色",
        fixed: false, //不固定
        maxmin: true,
        content: '/role/edit.html?roleId=' + roleId
    });
}
$(".addPage_btn").click(function () {
    layerIndex = layer.open({
        type: 2,
        area: ['90%', '99%'],
        title: "添加角色",
        fixed: false, //不固定
        maxmin: true,
        content: '/role/add.html'
    });
});
$(".showPage_btn").click(function () {
    layerIndex = layer.open({
        type: 2,
        title: "查看角色",
        area: ['90%', '95%'],
        fixed: false, //不固定
        maxmin: true,
        content: '/role/detail.html'
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
                layer.msg(data.msg, {icon: 1, time: 2500}, function () {
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
                    window.parent.location.reload(); //刷新父页面
                });
            } else {
                layer.msg(data.msg, {icon: 5});
            }
        }
    })
});





