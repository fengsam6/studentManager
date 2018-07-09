package cn.feng.controller;


import cn.feng.entity.JsonResult;
import cn.feng.entity.School;
import cn.feng.service.SchoolService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * Created by rf on 2018/7/2.
 */
@Controller
@RequestMapping("/school")
public class SchoolController {
    @Autowired
    private SchoolService schoolService;

    @RequestMapping("/list.html")
    public String listPage(Integer pageNum, Integer pageSize, School school, Model model) {
        PageInfo<School> schoolPageInfo = schoolService.listPage(pageNum, pageSize, school);
        model.addAttribute("schoolPageInfo", schoolPageInfo);
        return "/manager/school/list";
    }

    @RequestMapping("/add.html")
    public String addPage() {
        return "/manager/school/add";
    }

    @RequestMapping("/edit.html")
    public String editPage(Integer schoolId, Model model) {
        School school = schoolService.selectById(schoolId);
        model.addAttribute("schoolModel", school);
        return "/manager/school/edit";
    }

    @RequestMapping("/detail.html")
    public String detailPage() {
        return "/manager/school/detail";
    }

    @ResponseBody
    @RequestMapping("/add")
    public JsonResult add(School school) {
        schoolService.add(school);
        return JsonResult.renderSuccess("添加学校成功！");
    }

    @ResponseBody
    @RequestMapping("/delete")
    public JsonResult delete(Integer id) {
        schoolService.deleteById(id);
        return JsonResult.renderSuccess("删除学校成功！", id);
    }

    @ResponseBody
    @RequestMapping("/update")
    public JsonResult update(School school) {
        schoolService.update(school);
        return JsonResult.renderSuccess("更新学校成功！", school.getSchoolId());
    }
}
