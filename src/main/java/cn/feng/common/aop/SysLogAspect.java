package cn.feng.common.aop;


import cn.feng.common.annotation.SysLog;
import cn.feng.entity.SystemLog;
import cn.feng.entity.User;
import cn.feng.service.SystemLogService;
import cn.feng.util.CommonUtil;
import cn.feng.util.HttpContextUtils;
import cn.feng.util.IPUtils;
import com.google.gson.Gson;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.aspectj.lang.annotation.Aspect;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;

/**
 * Created by rf on 2018/7/8.
 */

@Aspect
@Component

public class SysLogAspect {
    @Autowired
    private SystemLogService sysLogService;
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Pointcut("@annotation(cn.feng.common.annotation.SysLog)")
    public void logPointCut() {

    }

    @Around("logPointCut()")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        long beginTime = System.currentTimeMillis();
        //执行方法
        Object result = point.proceed();
        //执行时长(毫秒)
        long time = System.currentTimeMillis() - beginTime;

        //保存日志
        saveSysLog(point, time);

        return result;
    }

    private void saveSysLog(ProceedingJoinPoint joinPoint, long time) {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();

        SystemLog sysLog = new SystemLog();
        SysLog syslog = method.getAnnotation(SysLog.class);
        if (syslog != null) {
            //注解上的描述
            sysLog.setOperation(syslog.value());
        }

        //请求的方法名
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = signature.getName();
        sysLog.setMethod(className + "." + methodName + "()");
        logger.info("{}", className + "." + methodName + "()");
        //请求的参数
        Object[] args = joinPoint.getArgs();
        try {
            String params = new Gson().toJson(args[0]);
            sysLog.setParams(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

//        //获取request
        HttpServletRequest request = HttpContextUtils.getHttpServletRequest();
//        //设置IP地址
        sysLog.setIp(IPUtils.getIpAddr(request));
        Object object = request.getSession().getAttribute("loginUser");
        if (object == null) {
            logger.info("未登录");
            return;
        }
        User loginUser = (User) object;

        String username = loginUser.getUsername();
        sysLog.setUsername(username);

        sysLog.setTime(time);
        sysLog.setCreateDate(CommonUtil.getSystemDate());
        //保存系统日志
        sysLogService.insert(sysLog);
    }
}

