package cn.feng.service;

import cn.feng.entity.Class;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * Created by rf on 2018/6/15.
 */
public interface ClazzService extends IService<Class> {

    List<Class> list();

    void add(Class aClass);

    void update(Class aClass);
}
