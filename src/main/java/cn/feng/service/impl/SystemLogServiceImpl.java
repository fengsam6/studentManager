package cn.feng.service.impl;

import cn.feng.dao.SystemLogMapper;
import cn.feng.entity.SystemLog;
import cn.feng.service.SystemLogService;
import cn.feng.service.support.BaseServiceImpl;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

/**
 * Created by rf on 2018/7/2.
 */
@Service("systemLogService")
public class SystemLogServiceImpl extends BaseServiceImpl<SystemLogMapper, SystemLog> implements SystemLogService {
    @Autowired
    private SystemLogMapper systemLogMapper;

    @Override
    public PageInfo<SystemLog> listPage(Integer pageNum, Integer pageSize, SystemLog systemLog) {
        if (pageNum == null) {
            pageNum = 1;
        }
        if (pageSize == null) {
            pageSize = 10;
        }
        PageHelper.startPage(pageNum, pageSize);
        List<SystemLog> list = systemLogMapper.selectList(new EntityWrapper<>(systemLog));
        /* 用PageInfo对结果进行包装 */
        return new PageInfo<>(list);
    }

    @Override
    public void deleteBatchIds(Long[] ids) {
        Assert.notNull(ids,"选择要删除日志！");
        systemLogMapper.deleteBatchIds(Arrays.asList(ids));
    }
}
