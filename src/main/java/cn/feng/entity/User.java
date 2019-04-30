
package cn.feng.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * Created by rf on 2017/9/15.
 */
@TableName("tb_user")
public class User {
    @TableId(value="Id", type= IdType.AUTO)
    private Integer id;//
    @NotBlank(message = "用户名不能为空")
    private String username;//用户名
    private Integer num;
    @NotBlank(message = "密码不能为空")
    private String password;//用户密码
    private Integer roleId;//角色id
    private String createTime;
    private String lastLoginTime;

    /*
     * users不带参数的构造方法
     */
    public User() {
    }
    /*
     * users带参数的构造方法
     */

    public Integer getId() {
        return id;
    }

    public void setId(Integer Id) {
        this.id = Id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(String lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }




    @Override
    public String toString() {
        return "User{" +
                "Id=" + id +
                ", username='" + username + '\'' +
                ", num=" + num +
                ", password='" + password + '\'' +
                ", roleId=" + roleId +
                ", createTime='" + createTime + '\'' +
                ", lastLoginTime='" + lastLoginTime + '\'' +
                '}';
    }
}

