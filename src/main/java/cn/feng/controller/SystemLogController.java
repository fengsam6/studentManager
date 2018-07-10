package cn.feng.controller;


import cn.feng.common.annotation.SysLog;
import cn.feng.entity.JsonResult;
import cn.feng.entity.SystemLog;
import cn.feng.service.SystemLogService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
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
@RequestMapping("/systemLog")
public class SystemLogController {
    @Autowired
    private SystemLogService systemLogService;

    @RequestMapping("/list.html")
    public String list(Integer pageNum, Integer pageSize, SystemLog systemLog, Model model) {
        PageInfo<SystemLog> systemLogPageInfo = systemLogService.listPage(pageNum, pageSize, systemLog);
        model.addAttribute("systemLogPageInfo", systemLogPageInfo);
        return "/manager/systemLog/list";
    }

    @ResponseBody
    @RequestMapping("/add")
    public JsonResult add(SystemLog systemLog) {
        systemLogService.insert(systemLog);
        return JsonResult.renderSuccess("添加日志成功！");
    }

    @ResponseBody
    @RequestMapping("/delete")
    @SysLog("删除日志")
    public JsonResult delete(Long id) {
        systemLogService.deleteById(id);
        return JsonResult.renderSuccess("删除日志成功！");
    }

    @ResponseBody
    @RequestMapping("/deleteBatch")
    @SysLog("批量删除日志")
    public JsonResult deleteBatch(Long[] id){
        systemLogService.deleteBatchIds(id);
        return JsonResult.renderSuccess("删除日志成功！");
    }

    @ResponseBody
    @RequestMapping("/update")
    public JsonResult update(SystemLog systemLog) {
        systemLogService.updateById(systemLog);
        return JsonResult.renderSuccess("更新日志成功！");
    }
}
