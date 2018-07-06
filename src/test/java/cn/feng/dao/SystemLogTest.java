package cn.feng.dao;

import cn.feng.base.BaseTest;
import cn.feng.entity.SystemLog;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by rf on 2018/7/5.
 */
public class SystemLogTest extends BaseTest {
    @Autowired
    private SystemLogMapper systemLogMapper;
    @Test
    public void List(){
       List<SystemLog> systemLogList = systemLogMapper.selectList(null);
        for (SystemLog systemLog : systemLogList){
            logger.info("{}",systemLog);
        }
    }
}
