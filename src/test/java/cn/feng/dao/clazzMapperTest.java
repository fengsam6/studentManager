package cn.feng.dao;

import cn.feng.base.BaseTest;
import cn.feng.entity.Class;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by rf on 2018/7/5.
 */
public class clazzMapperTest extends BaseTest {
    @Autowired
    private ClassMapper classMapper;
    @Test
    public void listTest(){
        List<Class> classList = classMapper.selectList(null);
        for (Class aClass : classList){
            logger.info("{}", aClass.toString());
        }

    }
}
