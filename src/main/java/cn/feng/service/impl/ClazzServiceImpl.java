package cn.feng.service.impl;

import cn.feng.dao.ClassMapper;
import cn.feng.entity.Class;
import cn.feng.service.ClazzService;
import cn.feng.service.support.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by rf on 2018/7/2.
 */
@Service
public class ClazzServiceImpl extends BaseServiceImpl<ClassMapper, Class> implements ClazzService {
    @Autowired
    private ClassMapper classMapper;

    @Override
    public List<Class> list() {
       List<Class> classList = classMapper.selectList(null);
        for(Class aClass : classList){
            System.out.println(aClass.toString());
        }
        return classList;
    }

    @Override
    public void add(Class aClass) {
        classMapper.insert(aClass);
    }

    @Override
    public void update(Class aClass) {
        classMapper.updateById(aClass);
    }
}
