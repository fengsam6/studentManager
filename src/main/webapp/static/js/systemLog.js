function add() {
    $(".add_btn").click(function () {
        $.ajax({
            url: $(".addForm").attr("action"),
               dataType: "json",
            type: "post",
            data: $(".addForm").serialize(),
            success: function (data) {
                console.log( data);
                if (data.erroCode === 0) {
                    layer.msg(data.msg, {icon: 1, time: 2000}, function () {
                        window.location.href = "${baseUrl}/admin/index.html";
                    });
                } else {
                    layer.msg(data.msg, {icon: 5});
                }
            }
        })
    })
}
function update() {
    $(".update_btn").click(function () {
        $.ajax({
            url: $(".addForm").attr("action"),
            dataType: "json",
            type: "post",
            data: $(".addForm").serialize(),
            success: function (data) {
                console.log( data);
                if (data.erroCode === 0) {
                    layer.msg(data.msg, {icon: 1, time: 2000}, function () {
                        window.location.href = "${baseUrl}/admin/index.html";
                    });
                } else {
                    layer.msg(data.msg, {icon: 5});
                }
            }
        })
    })
}
$(".addPage_btn").click(function () {
    layer.open({
        type: 2,
        area: ['90%', '90%'],
        title: "添加学生",
        fixed: false, //不固定
        maxmin: true,
        content: '/student/add.html',
        btn: ['修改', '取消'] //只是为了演示
        , yes: function (index) {
            layer.msg("添加学生成功！",{icon:1,time:2000},function () {
                layer.close(index);
            });
        }
        , btn2: function (index) {
            layer.close(index);
        }
    });
});
$(".showPage_btn").click(function () {
    layer.open({
        type: 2,
        title: "查看学生",
        area: ['90%', '90%'],
        fixed: false, //不固定
        maxmin: true,
        content: '/student/detail.html',
        btn: ['查看', '取消'] //只是为了演示
        , yes: function (index) {
            layer.msg("查看该学生成功！",{icon:1,time:2000},function () {
                layer.close(index);
            });
        }
        , btn2: function (index) {
            layer.close(index);
        }
    });
});
$(".editPage_btn").click(function () {
    layer.open({
        type: 2,
        area: ['90%', '90%'],
        title: "编辑学生",
        fixed: false, //不固定
        maxmin: true,
        content: '/student/edit.html',
        btn: ['修改', '取消'] //只是为了演示
        , yes: function (index) {
            layer.msg("修改该学生成功！",{icon:1,time:2000},function () {
                layer.close(index);
            });
        }
        , btn2: function (index) {
            layer.close(index);
        }
    });
});
$(".delete_btn").click(function () {
    layer.confirm("确定删除该学生", {icon: 3, title: '提示信息'}, function (index) {
        layer.msg("删除该学生成功！",{icon:1,time:2000},function () {
            layer.close(index);
        });

    })
});


