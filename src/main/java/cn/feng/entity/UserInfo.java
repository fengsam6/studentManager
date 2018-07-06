package cn.feng.entity;

/**
 * Created by rf on 2018/7/5.
 */
public class UserInfo extends User{
    private Role role;

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
