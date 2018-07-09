package cn.feng.service.impl;

import cn.feng.dao.ClassMapper;
import cn.feng.entity.Class;
import cn.feng.service.ClazzService;
import cn.feng.service.support.BaseServiceImpl;
import cn.feng.util.CommonUtil;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

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
        EntityWrapper<Class> classObj = new EntityWrapper<Class>();
       List<Class> classList = classMapper.selectList(classObj);
        return classList;
    }

    @Override
    public void add(Class classObj) {
        Assert.hasText(classObj.getClassName(),"班级名称不能为空");
        classObj.setCreateTime(CommonUtil.getSystemDate());
        classMapper.insert(classObj);
    }

    @Override
    public void update(Class classObj) {
        Assert.notNull(classObj.getId(),"班级id不能为空");
        Assert.hasText(classObj.getClassName(),"班级名称不能为空");
        classMapper.updateById(classObj);
    }
}
