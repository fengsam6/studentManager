package cn.feng.service.impl;

import cn.feng.constant.AppEnum;
import cn.feng.dao.UserMapper;
import cn.feng.entity.User;
import cn.feng.entity.User;
import cn.feng.entity.UserInfo;
import cn.feng.exception.BusinessException;
import cn.feng.service.UserService;
import cn.feng.service.support.BaseServiceImpl;
import cn.feng.util.CommonUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rf on 2018/7/2.
 */
@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<UserMapper, User> implements UserService {
    @Autowired
    private UserMapper userMapper;

    public PageInfo<User> listPage(Integer pageNum, Integer pageSize, User userSearch) {
        //获取第1页，10条内容，默认查询总数count
        //获取第1页，10条内容，默认查询总数count
        if (pageNum == null) {
            pageNum = 1;
        }
        if (pageSize == null) {
            pageSize = 30;
        }
        PageHelper.startPage(pageNum, pageSize);
        Map<String, Object> map = new HashMap<>();
        map.put("role_id", userSearch.getRoleId());
        //紧跟着的第一个select方法会被分页
        List<User> list = userMapper.selectByMap(map);
        /* 用PageInfo对结果进行包装 */
        return new PageInfo<>(list);
    }

    @Override
    public PageInfo<UserInfo> listUserInfoPage(Integer pageNum, Integer pageSize, User userSearch) {
        if (pageNum == null) {
            pageNum = 1;
        }
        if (pageSize == null) {
            pageSize = 10;
        }
        PageHelper.startPage(pageNum, pageSize);
        //紧跟着的第一个select方法会被分页
        List<UserInfo> list = userMapper.listUserInfo(userSearch);
        /* 用PageInfo对结果进行包装 */
        return new PageInfo<>(list);
    }

    @Override
    public User login(User user) {
        Assert.hasText(user.getUsername(), AppEnum.USER_NOT_NULL.getMsg());
        Assert.hasText(user.getPassword(), AppEnum.PASSWORD_NOT_NULL.getMsg());
        User loginUser = userMapper.getUsersByName(user.getUsername());
        Assert.notNull(loginUser, AppEnum.USER_NOT_EXIST.getMsg());
        if (!loginUser.getPassword().equals(user.getPassword())) {
            throw new BusinessException(AppEnum.USER_PASS_ERROR.getErrorCode(), AppEnum.USER_PASS_ERROR.getMsg());
        }
        return loginUser;
    }

    @Override
    public void add(User user) {
        Assert.hasText(user.getUsername(), AppEnum.USER_NOT_NULL.getMsg());
        Assert.hasText(user.getPassword(), AppEnum.PASSWORD_NOT_NULL.getMsg());
        user.setCreateTime(CommonUtil.getSystemDate());
        User existUser = userMapper.getUsersByName(user.getUsername());
        if(existUser!=null){
            throw new BusinessException(AppEnum.USER_REPEAT.getErrorCode(), AppEnum.USER_REPEAT.getMsg());
        }
        userMapper.insert(user);
    }

    @Override
    public void update(User user) {
        Assert.notNull(user.getId(), AppEnum.P_KEY_NOT_NULL.getMsg());
        Assert.hasText(user.getUsername(), AppEnum.USER_NOT_NULL.getMsg());
        Assert.hasText(user.getPassword(), AppEnum.PASSWORD_NOT_NULL.getMsg());
        User existUser = userMapper.getUsersByName(user.getUsername());
        if (!existUser.getId().equals(user.getId()) && user.getUsername().equals(existUser.getUsername())) {
            throw new BusinessException(AppEnum.USER_REPEAT.getErrorCode(), AppEnum.USER_REPEAT.getMsg());
        }
        userMapper.updateById(user);
    }
}
