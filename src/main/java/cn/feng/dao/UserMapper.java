
package cn.feng.dao;

import cn.feng.entity.User;
import cn.feng.entity.UserInfo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public interface UserMapper extends BaseMapper<User>{


    User getUsersByName(String name);

    List<UserInfo> listUserInfo(User user);

}
