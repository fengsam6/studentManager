package cn.feng.controller;


import cn.feng.common.annotation.SysLog;
import cn.feng.common.enums.AppErrorEnum;
import cn.feng.common.exception.BusinessException;
import cn.feng.entity.JsonResult;
import cn.feng.entity.Role;
import cn.feng.entity.User;
import cn.feng.entity.UserInfo;
import cn.feng.common.exception.ParamException;
import cn.feng.service.RoleService;
import cn.feng.service.UserService;
import cn.feng.util.CommonUtil;
import com.github.pagehelper.PageInfo;
import com.google.code.kaptcha.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
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
    @RequestMapping("/listUserInfo.html")
    public String listUserInfoPage(Integer pageNum, Integer pageSize , User user, Model model) {
        PageInfo<UserInfo> pageInfo = userService.listUserInfoPage(pageNum, pageSize, user);
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
    @SysLog("添加用户")
    public JsonResult add(User user) {
        userService.add(user);
        return JsonResult.renderSuccess("添加用户成功！");
    }

    @ResponseBody
    @RequestMapping("/delete")
    @SysLog("删除用户")
    public JsonResult delete(Integer userId) {
        userService.deleteById(userId);
        return JsonResult.renderSuccess("删除用户成功！");
    }

    @ResponseBody
    @RequestMapping("/update")
    @SysLog("更新用户")
    public JsonResult update(@Valid User user, BindingResult result) {
        if(result.hasErrors()){
           String errorMsg = result.getFieldError().getDefaultMessage();
            throw new ParamException(AppErrorEnum.PARAM_INVALIDATE.setMsg(errorMsg));
        }
        userService.update(user);
        return JsonResult.renderSuccess("更新用户成功！");
    }

    @ResponseBody
    @RequestMapping("/login")
    @SysLog("用户登录")
    public JsonResult login(User user,String code, HttpServletRequest request) {
       String trueCode = (String) request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
       if(!StringUtils.hasLength(code)||!code.trim().equals(trueCode)){
           throw new BusinessException(AppErrorEnum.CODE_ERROR);
       }
        User loginUser = userService.login(user);
       Role role = roleService.selectById(loginUser.getRoleId());
        request.getSession().setAttribute("userRole", role);
        request.getSession().setAttribute("loginUser", loginUser);
        //修改登录时间
        loginUser.setLastLoginTime(CommonUtil.getSystemDate("yyyy年MM月 hh:mm:ss"));
        userService.updateById(loginUser);
        return JsonResult.renderSuccess("登录成功！", user);
    }

    @ResponseBody
    @RequestMapping("/logout")
    @SysLog("用户退出登录")
    public JsonResult logout(HttpServletRequest request) {
      request.getSession().invalidate();
        return JsonResult.renderSuccess("退出成功！");
    }
}
