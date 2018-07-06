
package cn.feng.dao;

import cn.feng.entity.User;
import cn.feng.entity.UserInfo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
public interface UserMapper extends BaseMapper<User>{

    int getUsersCount();

    /**
     * 通过用户名和密码查找用户，用于登录
     * @param name 传入用户username，password
     * @return 返回单个用户
     */
    User getUsersByName(String name);

    /**
     * 添加用户
     * @param user 传入用户username，password，rank
     */
    void addUser(User user);

    /**
     * 修改用户，管理员权限
     * @param user 传入用户id,username，password，rank
     */
    void updateUser(User user);

    /**
     * 通过用查找用户
     * @param id 户id
     * @return 返回单个用户
     */
    User getUsersById(int id);

    /**
     *查找用户，并且分页
     * @param param 传入参数（pageSize，pageNum）
     * @return
     */
    List<User> findAllUsers(Map<String, Integer> param);

    /**
     * 根据条件查找用户
     * @param user (查找条件：用户名字、角色名称)
     * @return 返回用户集合
     */
    List<User> findUsersSelective(User user);

    /**
     * 删除用户
     * @param id（根据主键id）
     */
    void deleteUser(int id);


    List<UserInfo> listUserInfo();
}
