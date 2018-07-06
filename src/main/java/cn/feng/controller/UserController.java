package cn.feng.controller;


import cn.feng.entity.JsonResult;
import cn.feng.entity.Role;
import cn.feng.entity.User;
import cn.feng.entity.UserInfo;
import cn.feng.service.RoleService;
import cn.feng.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by rf on 2018/7/2.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

    @RequestMapping("/list.html")
    public String listPage(Integer pageSize, Integer pageNum, User user, Model model) {
        PageInfo<User> pageInfo = userService.listPage(pageSize, pageNum, user);
        model.addAttribute("pageInfoModel", pageInfo);
        return "/manager/user/list";
    }
    @RequestMapping("/listUserIfo.html")
    public String listUserIfoPage(Integer pageSize, Integer pageNum, User user, Model model) {
        PageInfo<UserInfo> pageInfo = userService.listUserInfoPage(pageSize, pageNum, user);
        model.addAttribute("pageInfoModel", pageInfo);
        return "/manager/user/list";
    }
    @RequestMapping("/add.html")
    public String addPage(Model model) {
        List<Role> roleList = roleService.list();
        model.addAttribute("roleListModel", roleList);
        return "/manager/user/add";
    }

    @RequestMapping("/edit.html")
    public String editPage(Integer userId, Model model) {
        User user = userService.selectById(userId);
        model.addAttribute("userModel", user);

        List<Role> roleList = roleService.list();
        model.addAttribute("roleListModel", roleList);
        return "/manager/user/edit";
    }

    @RequestMapping("/detail.html")
    public String detailPage(Integer userId, Model model) {
        User user = userService.selectById(userId);
        model.addAttribute("userModel", user);
        return "/manager/user/detail";
    }


    @ResponseBody
    @RequestMapping("/add")
    public JsonResult add(User user) {
        userService.add(user);
        return JsonResult.renderSuccess("添加用户成功！");
    }

    @ResponseBody
    @RequestMapping("/delete")
    public JsonResult delete(Integer userId) {
        userService.deleteById(userId);
        return JsonResult.renderSuccess("删除用户成功！");
    }

    @ResponseBody
    @RequestMapping("/update")
    public JsonResult update(User user) {
        userService.update(user);
        return JsonResult.renderSuccess("更新用户成功！");
    }

    @ResponseBody
    @RequestMapping("/login")
    public JsonResult login(User user, HttpServletRequest request) {
        User loginUser = userService.login(user);
        request.getSession().setAttribute("loginUser", loginUser);
        return JsonResult.renderSuccess("登录成功！", user);
    }

    @ResponseBody
    @RequestMapping("/logout")
    public JsonResult logout(User user, HttpServletRequest request) {
      request.getSession().invalidate();
        return JsonResult.renderSuccess("登录成功！", user);
    }
}
