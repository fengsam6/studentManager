package cn.feng.controller;


import cn.feng.entity.JsonResult;
import cn.feng.entity.SystemLog;
import cn.feng.service.SystemLogService;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by rf on 2018/7/2.
 */
@Controller
@RequestMapping("/systemLog")
public class SystemLogController {
    @Autowired
    private SystemLogService systemLogService;

    @RequestMapping("/list")
    public String list(SystemLog systemLog){
        systemLogService.selectList(null);
        return "/manager/systemLog/list";
    }
    @ResponseBody
    @RequestMapping("/add")
    public JsonResult add(SystemLog systemLog){
       systemLogService.insert(systemLog);
        return JsonResult.renderSuccess("添加日志成功！");
    }
    @ResponseBody
    @RequestMapping("/delete")
    public JsonResult delete(Integer id){
        systemLogService.deleteById(id);
        return JsonResult.renderSuccess("删除日志成功！");
    }
    @ResponseBody
    @RequestMapping("/update")
    public JsonResult update(SystemLog systemLog){
        systemLogService.updateById(systemLog);
        return JsonResult.renderSuccess("更新日志成功！");
    }
}
