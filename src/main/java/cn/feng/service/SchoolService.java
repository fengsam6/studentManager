package cn.feng.service;

import cn.feng.entity.School;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.github.pagehelper.PageInfo;

public interface SchoolService extends IService<School> {
    PageInfo<School> listPage(Integer pageNum, Integer pageSize, School schoolSearch);
    void add(School school);
    void update(School school);
}
