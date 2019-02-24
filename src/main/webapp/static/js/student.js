var layerIndex;
var  contextPath='';
$(function () {
    contextPath = getRootPath();
});


//js获取项目根路径
function getRootPath(){
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath=window.document.location.href;
    //获取主机地址之后的目录，如： /uimcardprj/share/meun.jsp
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht=curWwwPath.substring(0,pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    return(localhostPaht+projectName);
}


function deteteStudent(url, studentId) {
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
        area: ['100%', '100%'],
        title: "编辑学生",
        fixed: false, //不固定
        maxmin: true,
        content: contextPath+'/student/edit.html?studentId=' + studentId
    });
}
$(".addPage_btn").click(function () {
    layerIndex = layer.open({
        type: 2,
        area: ['100%', '100%'],
        title: "添加学生",
        fixed: false, //不固定
        maxmin: true,
        content: contextPath+'/student/add.html'
    });
});
$(".showPage_btn").click(function () {
    layerIndex = layer.open({
        type: 2,
        title: "查看学生",
        area: ['90%', '95%'],
        fixed: false, //不固定
        maxmin: true,
        content: contextPath+'/student/detail.html'
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





