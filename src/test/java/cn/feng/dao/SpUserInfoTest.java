package cn.feng.dao;

import cn.feng.base.BaseTest;
import cn.feng.entity.UserInfo;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by rf on 2018/7/9.
 */
public class SpUserInfoTest extends BaseTest {
    @Autowired
    private UserMapper userMapper;
    @Test
    public void test(){
       List<UserInfo> userInfoList = userMapper.getUserInfoByProc();
       for(UserInfo userInfo : userInfoList){
           System.out.println(userInfo.toString());
       }
    }
}
