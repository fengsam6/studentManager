package cn.feng.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * Created by rf on 2018/7/3.
 */
@TableName("tb_systemLog")
public class SystemLog {
    @TableId(value="Id", type= IdType.AUTO)
    private Integer Id;
    private Integer userId;
    private String userName;
    private String operationTime;
    private String operation;

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getOperationTime() {
        return operationTime;
    }

    public void setOperationTime(String operationTime) {
        this.operationTime = operationTime;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    @Override
    public String toString() {
        return "SystemLog{" +
                "Id=" + Id +
                ", userId=" + userId +
                ", userName='" + userName + '\'' +
                ", operationTime='" + operationTime + '\'' +
                ", operation='" + operation + '\'' +
                '}';
    }
}
