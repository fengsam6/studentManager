package cn.feng.controller;


import cn.feng.common.annotation.SysLog;
import cn.feng.entity.*;
import cn.feng.entity.Class;
import cn.feng.service.ClazzService;
import cn.feng.service.SchoolService;
import cn.feng.service.StudentService;
import com.github.pagehelper.PageInfo;
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
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private ClazzService clazzService;
    @Autowired
    private SchoolService schoolService;

    @RequestMapping("/list.html")
    public String listPage(Integer pageNum, Integer pageSize, Student student, Model model) {
        PageInfo<Student> studentPageInfo = studentService.listPage(pageNum, pageSize, student);
        model.addAttribute("studentPageInfo", studentPageInfo);
        List<Class> classList = clazzService.selectList(null);
        model.addAttribute("classListModel", classList);
        return "/manager/student/list";
    }

    @RequestMapping("/listStudentInfo.html")
    public String listStudentInfoPage(Integer pageSize, Integer pageNum, Model model) {
        PageInfo<StudentInfo> studentPageInfo = studentService.listStudentInfoPage(pageNum, pageSize);
        model.addAttribute("studentPageInfo", studentPageInfo);
        List<Class> classList = clazzService.list();
        model.addAttribute("classListModel", classList);
        return "/manager/student/list";
    }


    @RequestMapping("/add.html")
    public String addPage(Model model) {
        List<Class> classList = clazzService.list();
        model.addAttribute("classListModel", classList);
        List<School> schoolList = schoolService.selectList(null);
        model.addAttribute("schoolListModel", schoolList);
        return "/manager/student/add";
    }

    @RequestMapping("/edit.html")
    public String editPage(Integer studentId, Model model) {
        Student student = studentService.selectById(studentId);
        model.addAttribute("studentModel", student);
        List<Class> classList = clazzService.list();
        model.addAttribute("classListModel", classList);
        List<School> schoolList = schoolService.selectList(null);
        model.addAttribute("schoolListModel", schoolList);
        return "/manager/student/edit";
    }

    @RequestMapping("/detail.html")
    public String detailPage() {
        return "/manager/student/detail";
    }

    @ResponseBody
    @RequestMapping("/add")
    @SysLog("添加学生")
    public JsonResult add(Student student) {
        studentService.add(student);
        return JsonResult.renderSuccess("添加学生成功！");
    }

    @ResponseBody
    @RequestMapping("/delete")
    @SysLog("删除学生")
    public JsonResult delete(Integer id) {
        studentService.deleteById(id);
        return JsonResult.renderSuccess("删除学生成功！", id);
    }

    @ResponseBody
    @RequestMapping("/update")
    @SysLog("更新学生")
    public JsonResult update(Student student) {
        studentService.update(student);
        return JsonResult.renderSuccess("更新学生成功！", student.getId());
    }
}
