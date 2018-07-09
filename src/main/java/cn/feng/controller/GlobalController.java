package cn.feng.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by rf on 2018/7/2.
 */
@Controller
@RequestMapping("/")
public class GlobalController {

    /**
     * 跳转到404页面
     *
     * @author fengshuonan
     */
    @RequestMapping(path = "/404.html")
    public String notFoundPage() {
        return "/404";
    }

    @RequestMapping(path = "/error.html")
    public String errorPage() {
        return "/error";
    }

    @RequestMapping(path = "/businessError.html")
    public String businessErrorPage() {
        return "/businessError";
    }

    @RequestMapping(path = "/illegalArgumentError.html")
    public String illegalArgumentErrorPage() {
        return "/illegalArgumentError";
    }

    @RequestMapping(value = {"/login.html", "/login"})
    public String loginPage() {
        return "/login";
    }

    @RequestMapping("/")
    public String defaultPage() {
        return "/login";
    }

    @RequestMapping("/admin/index")
    public String adminIndexPage() {
        return "/manager/index";
    }

    @RequestMapping("/admin/welcome")
    public String welcomeIndexPage() {
        return "/manager/welcome";
    }

    @RequestMapping("/common/footer.html")
    public String footerPage() {
        return "/common/footer";
    }

    @RequestMapping("/common/header.html")
    public String headerPage() {
        return "/common/header";
    }

    /**
     * 跳转到session超时页面
     *
     * @author fengshuonan
     */
    @RequestMapping(path = "/sessionError")
    public String errorPageInfo(Model model) {
        model.addAttribute("tips", "session超时");
        return "/login";
    }

}
