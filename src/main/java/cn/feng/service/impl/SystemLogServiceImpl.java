package cn.feng.service.impl;

import cn.feng.dao.SystemLogMapper;
import cn.feng.entity.SystemLog;
import cn.feng.service.SystemLogService;
import cn.feng.service.support.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by rf on 2018/7/2.
 */
@Service("systemLogService")
public class SystemLogServiceImpl extends BaseServiceImpl<SystemLogMapper, SystemLog> implements SystemLogService {
    @Autowired
    private SystemLogMapper systemLogMapper;

}
