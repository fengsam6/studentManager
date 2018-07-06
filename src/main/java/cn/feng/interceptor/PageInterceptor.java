package cn.feng.interceptor;

import com.baomidou.mybatisplus.plugins.PaginationInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 * Created by rf on 2018/7/3.
 */
//@Component
public class PageInterceptor {
//    @Bean
    public PaginationInterceptor paginationInterceptor() {
        PaginationInterceptor page = new PaginationInterceptor();
        page.setDialectType("sqlserver");
        // 打开PageHelper localPage 模式
        page.setLocalPage(true);
        return page;
    }
}
