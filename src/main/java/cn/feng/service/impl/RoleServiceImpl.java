package cn.feng.service.impl;

import cn.feng.dao.RoleMapper;
import cn.feng.entity.Role;
import cn.feng.service.RoleService;
import cn.feng.service.support.BaseServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;


import java.util.List;


/**
 * Created by rf on 2018/7/2.
 */
@Service("roleService")
public class RoleServiceImpl extends BaseServiceImpl<RoleMapper, Role> implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public void add(Role role) {
        Assert.hasText(role.getRoleName(),"角色名称不能为空");
        roleMapper.insert(role);
    }

    @Override
    public void update(Role role) {
        Assert.notNull(role.getId(),"角色id不能为空");
        Assert.hasText(role.getRoleName(),"角色名称不能为空");
        roleMapper.updateById(role);
    }

    @Override
    public List<Role> list() {
        return roleMapper.selectList(null);
    }
}
