package cn.feng.controller;


import cn.feng.entity.Class;
import cn.feng.entity.JsonResult;
import cn.feng.service.ClazzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


/**
 * Created by rf on 2018/7/2.
 */
@Controller
@RequestMapping("/class")
public class ClassController {
    @Autowired
    private ClazzService clazzService;

    @RequestMapping("/list.html")
    public String listPage(Model model) {
        List<Class> classList = clazzService.list();
        model.addAttribute("classListModel", classList);


        return "/manager/class/list";
    }

    @RequestMapping("/add.html")
    public String addPage() {
        return "/manager/class/add";
    }

    @RequestMapping("/edit.html")
    public String editPage(Integer classObjId, Model model) {
        Class classObj =  clazzService.selectById( classObjId);
        model.addAttribute("classObjModel", classObj);
        return "/manager/class/edit";
    }

    @RequestMapping("/detail.html")
    public String detailPage() {
        return "/manager/class/detail";
    }

    @ResponseBody
    @RequestMapping("/add")
    public JsonResult add(Class classObj) {
        clazzService.add(classObj);
        return JsonResult.renderSuccess("添加班级成功！");
    }

    @ResponseBody
    @RequestMapping("/delete")
    public JsonResult delete(Integer id) {
        clazzService.deleteById(id);
        return JsonResult.renderSuccess("删除班级成功！",id);
    }

    @ResponseBody
    @RequestMapping("/update")
    public JsonResult update(Class classObj) {
        clazzService.update(classObj);
        return JsonResult.renderSuccess("更新班级成功！", classObj.getId());
    }
}
