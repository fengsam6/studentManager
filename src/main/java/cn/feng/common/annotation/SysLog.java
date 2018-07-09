package cn.feng.common.annotation;

import java.lang.annotation.*;

/**
 * Created by rf on 2018/7/8.
 */

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SysLog {

    String value() default "";
}
