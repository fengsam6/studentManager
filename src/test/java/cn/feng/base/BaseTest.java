package cn.feng.base;

import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by rf on 2018/7/2.
 */
@RunWith(SpringJUnit4ClassRunner.class) //使用junit4进行测试
@ContextConfiguration(locations={"classpath:spring/spring-context.xml","classpath:spring/spring-mvc.xml"}) //加载配置文件
public class BaseTest {
    protected Logger logger = LoggerFactory.getLogger(this.getClass());
}
