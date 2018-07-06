package cn.feng.Aop;

import cn.feng.entity.JsonResult;
import cn.feng.exception.BusinessException;
import cn.feng.exception.ParamException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


@ControllerAdvice
public class GlobalExceptionHandler {
    private static Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);
    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseBody
    public JsonResult handleIllegalArgument(IllegalArgumentException e) {
        logger.error("参数异常:{}\n", e.toString());
        e.printStackTrace();
        return JsonResult.renderError(300,e.getMessage());
    }

    @ExceptionHandler(ParamException.class)
    @ResponseBody
    public JsonResult handleParamException(ParamException e) {
        logger.debug("参数解析失败:  {}\n", e.toString());
        e.printStackTrace();
        return JsonResult.renderError(e.getErrorCode(),e.getMsg());
    }



    @ExceptionHandler(BusinessException.class)
    @ResponseBody
    public JsonResult handleBusinessException(BusinessException e) {
        logger.debug("业务异常:  {}\n", e.toString());
        e.printStackTrace();
        return JsonResult.renderError(e.getErrorCode(),e.getMsg());
    }


    @ExceptionHandler(Exception.class)
    @ResponseBody
    public JsonResult handleException(Exception e) {
        logger.error("服务运行异常:{}\n", e.toString());
        e.printStackTrace();
        return JsonResult.renderError(500,"系统错误： "+e.toString());
    }
}
