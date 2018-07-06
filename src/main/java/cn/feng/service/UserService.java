package cn.feng.service;

import cn.feng.entity.User;
import cn.feng.entity.UserInfo;
import com.baomidou.mybatisplus.service.IService;
import com.github.pagehelper.PageInfo;

/**
 * Created by rf on 2018/6/15.
 */
public interface UserService extends IService<User> {
    PageInfo<User> listPage(Integer pageNum, Integer pageSize, User userSearch);

    PageInfo<UserInfo> listUserInfoPage(Integer pageNum, Integer pageSize, User userSearch);
    User login(User user);

    void add(User user);
    void update(User user);
}
