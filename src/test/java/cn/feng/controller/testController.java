package cn.feng.controller;

import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by rf on 2018/7/4.
 */
@Controller
@RequestMapping("/test")
public class testController {
    @RequestMapping("/exceptionTest")
    @ResponseBody
    public void exceptionTest() {
       int i = 5/0;
    }
    @RequestMapping("/assertTest")
    @ResponseBody
    public void assertTest() {
        String name = null;
        Assert.hasLength(name,"字符串不能为空！");
    }
}
