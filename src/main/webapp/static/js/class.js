var layerIndex;
function deteteStudent(url,studentId) {
    layer.confirm("确定删除该学生?", {icon: 3, title: '提示信息'}, function (index) {
        $.ajax({
            url: url,
            data: {id: studentId},
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

function editPage(studentId) {
    layerIndex = layer.open({
        type: 2,
        area: ['90%', '95%'],
        title: "编辑学生",
        fixed: false, //不固定
        maxmin: true,
        content: '/student/edit.html?studentId=' + studentId
    });
}
$(".addPage_btn").click(function () {
    layerIndex = layer.open({
        type: 2,
        area: ['90%', '99%'],
        title: "添加学生",
        fixed: false, //不固定
        maxmin: true,
        content: '/student/add.html'
    });
});
$(".showPage_btn").click(function () {
    layerIndex = layer.open({
        type: 2,
        title: "查看学生",
        area: ['90%', '95%'],
        fixed: false, //不固定
        maxmin: true,
        content: '/student/detail.html'
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
                    layer.close(layer.index);
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
                    layer.closeAll();
                });
            } else {
                layer.msg(data.msg, {icon: 5});
            }
        }
    })
});





