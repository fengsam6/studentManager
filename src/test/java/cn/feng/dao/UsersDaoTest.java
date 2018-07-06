package cn.feng.dao;

import cn.feng.entity.User;
import cn.feng.util.CommonUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by rf on 2018/6/15.
 */
@RunWith(SpringJUnit4ClassRunner.class)  //使用junit4进行测试
@ContextConfiguration(locations = {"classpath:spring/spring-mybatis.xml"})
public class UsersDaoTest {
    @Autowired
    private UserMapper usersDao;
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Test
    public void addUser() throws Exception {
        User user = new User();
        user.setUsername("testController");
        user.setPassword("123456");
        user.setRoleId(1);
        user.setCreateTime(CommonUtil.getSystemDate("yyyy-MM-dd HH:mm:ss"));
        usersDao.addUser(user);
    }

    @Test
    public void updateUser() throws Exception {
    }

    @Test
    public void findUsersById() throws Exception {
        User user = usersDao.getUsersById(1);
        System.out.println(user.toString());
        logger.info("{}", user);
    }

    @Test
    public void list() throws Exception {
        List<User> userList = usersDao.selectList(null);
        for (User user : userList){
            logger.info("{}",user.toString());
        }
    }

}