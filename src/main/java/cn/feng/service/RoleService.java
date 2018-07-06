package cn.feng.service;

import cn.feng.entity.Role;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * Created by rf on 2018/6/15.
 */
public interface RoleService extends IService<Role> {
    void add(Role role);
    void update(Role role);
    List<Role> list();
}
