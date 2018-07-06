package cn.feng.controller;


import cn.feng.entity.JsonResult;
import cn.feng.entity.Role;
import cn.feng.service.RoleService;
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
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    @RequestMapping("/list.html")
    public String listPage(Model model) {
       List<Role> roleList = roleService.list();
        model.addAttribute("roleListModal", roleList);
        return "/manager/role/list";
    }

    @RequestMapping("/add.html")
    public String addPage() {
        return "/manager/role/add";
    }

    @RequestMapping("/edit.html")
    public String editPage(Integer roleId, Model model) {
        Role role =  roleService.selectById(roleId);
        model.addAttribute("roleModel", role);
        return "/manager/role/edit";
    }

    @RequestMapping("/detail.html")
    public String detailPage() {
        return "/manager/role/detail";
    }

    @ResponseBody
    @RequestMapping("/add")
    public JsonResult add(Role role) {
        roleService.add(role);
        return JsonResult.renderSuccess("添加角色成功！");
    }

    @ResponseBody
    @RequestMapping("/delete")
    public JsonResult delete(Integer id) {
        roleService.deleteById(id);
        return JsonResult.renderSuccess("删除角色成功！",id);
    }

    @ResponseBody
    @RequestMapping("/update")
    public JsonResult update(Role role) {
        roleService.update(role);
        return JsonResult.renderSuccess("更新角色成功！",role.getId());
    }
}
