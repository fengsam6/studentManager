package cn.feng.service.impl;

import cn.feng.dao.SchoolMapper;
import cn.feng.entity.School;
import cn.feng.service.SchoolService;
import cn.feng.service.support.BaseServiceImpl;
import com.baomidou.mybatisplus.plugins.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rf on 2018/7/2.
 */
@Service("schoolService")
public class SchoolServiceImpl extends BaseServiceImpl<SchoolMapper, School> implements SchoolService {
    @Autowired
    private SchoolMapper schoolMapper;


    public PageInfo<School> listPage(Integer pageNum, Integer pageSize, School schoolSearch) {
        //获取第1页，10条内容，默认查询总数count
        if (pageNum == null) {
            pageNum = 1;
        }
        if (pageSize == null) {
            pageSize = 30;
        }
        PageHelper.startPage(pageNum, pageSize);
        Map<String, Object> map = new HashMap<>();
//        map.put("class_name",schoolSearch.getClassName());
        map.put("school_id", schoolSearch.getSchoolId());
        //紧跟着的第一个select方法会被分页
        List<School> list = schoolMapper.selectByMap(map);
        /* 用PageInfo对结果进行包装 */
        return new PageInfo<>(list);
    }

    @Override
    public void add(School school) {
        Assert.hasText(school.getSchoolName(),"学校名称不能为空！");
        Assert.hasText(school.getAddress(),"学校地址不能为空！");
        schoolMapper.insert(school);
    }

    @Override
    public void update(School school) {
        Assert.notNull(school.getSchoolId(),"学校id不能为空！");
        Assert.hasText(school.getSchoolName(),"学校名称不能为空！");
        Assert.hasText(school.getAddress(),"学校地址不能为空！");
        schoolMapper.updateById(school);
    }
}
