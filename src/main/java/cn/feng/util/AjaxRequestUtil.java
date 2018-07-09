package cn.feng.util;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by rf on 2018/7/8.
 */
public class AjaxRequestUtil {
    public static boolean isAjaxRequest(HttpServletRequest request){
        String header = request.getHeader("X-Requested-With");
        boolean isAjax = "XMLHttpRequest".equals(header) ? true:false;
        return isAjax;
    }
}
