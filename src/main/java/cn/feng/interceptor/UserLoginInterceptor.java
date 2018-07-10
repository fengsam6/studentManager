package cn.feng.interceptor;

import cn.feng.entity.Role;
import cn.feng.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by rf on 2018/7/3.
 */
@Component
public class UserLoginInterceptor implements HandlerInterceptor {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取请求的URL
        String url = request.getRequestURI();
        //URL:login.jsp是公开的;login.html是可以公开访问的，其它的URL都进行拦截控制
        if (url.contains("login.html") || url.contains("/user/login")) {
            logger.info("登录页面放行： {}", url);
            return true;
        }
        logger.info("拦截请求url： {}", url);
        //获取Session
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute("loginUser");
        Role role = (Role) session.getAttribute("userRole");
        if (loginUser != null) {
            logger.info("登录用户：{}", loginUser.getUsername());
            logger.info("用户角色：{}", role.getRoleName());
            //toDo 判断角色权是否有权限访问，后期可能会用shiro处理
            return true;
        }
        //不符合条件的，跳转到登录界面
        response.sendRedirect("/login.html");
//        request.getRequestDispatcher("/login.html").forward(request, response);

        return false;

    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        // toDo 判断角色权是否有权限访问，后期可能会用shiro处理
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
