package cn.feng.common.aop;

import cn.feng.common.enums.AppErrorEnum;
import cn.feng.entity.JsonResult;
import cn.feng.common.exception.BusinessException;
import cn.feng.common.exception.ParamException;
import cn.feng.util.AjaxRequestUtil;
import cn.feng.util.HttpContextUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@RestControllerAdvice
public class GlobalExceptionHandler {
    private static Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ExceptionHandler(IllegalArgumentException.class)
    public JsonResult handleIllegalArgument(IllegalArgumentException e) {
        logger.error("参数异常:{}\n", e.toString());
        e.printStackTrace();
        notAjaxRequestHandler(e);
        return JsonResult.renderError(AppErrorEnum.PARAM_INVALIDATE.setMsg(e.getMessage()));
    }

    @ExceptionHandler(ParamException.class)
    public JsonResult handleParamException(ParamException e) {
        logger.debug("参数解析失败:  {}\n", e.toString());
        e.printStackTrace();
        notAjaxRequestHandler(e);
        return JsonResult.renderError(e);
    }


    @ExceptionHandler(BusinessException.class)
    public JsonResult handleBusinessException(BusinessException e) {
        logger.debug("业务异常:  {}\n", e.toString());
        e.printStackTrace();
        notAjaxRequestHandler(e);
        return JsonResult.renderError(e);
    }


    @ExceptionHandler(Exception.class)
    public JsonResult handleException(Exception e) {
        logger.error("服务运行异常:{}\n", e.toString());
        e.printStackTrace();
        notAjaxRequestHandler(e);
        return JsonResult.renderError(500, "系统错误： " + e.toString());
    }

    private void notAjaxRequestHandler(Exception e){
       HttpServletRequest request = HttpContextUtils.getHttpServletRequest();
        logger.info("请求request: {}",request);
        HttpServletResponse response = HttpContextUtils.getHttpServletResponse();
        if (!AjaxRequestUtil.isAjaxRequest(HttpContextUtils.getHttpServletRequest())){
            logger.info("普通请求: {}",request.getRequestURI());
            try {
                if(e instanceof IllegalArgumentException){
                    IllegalArgumentException exception = (IllegalArgumentException) e;
                    logger.error("请求错误！{}",e.toString());
                    request.setAttribute("jsonResult",JsonResult.renderError(AppErrorEnum.PARAM_INVALIDATE.setMsg(e.getMessage())));
                    request.getRequestDispatcher("/illegalArgumentError.html").forward(request, response);
                }else if(e instanceof BusinessException){
                    BusinessException exception = (BusinessException) e;
                    logger.error("请求错误！{}",e.toString());
                    request.setAttribute("jsonResult",JsonResult.renderError(exception.getErrorCode(), exception.getMsg()));
                    request.getRequestDispatcher("/businessError.html").forward(request, response);
                }else {
                    logger.error("请求错误！{}",e.toString());
                    request.setAttribute("jsonResult",JsonResult.renderError(500, "系统错误： " + e.toString()));
                    request.getRequestDispatcher("/error.html").forward(request, response);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                logger.error("请求错误！{}",ex.toString());
            }
        }
    }

}
