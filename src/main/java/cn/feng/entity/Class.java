package cn.feng.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * Created by rf on 2018/7/3.
 */
@TableName("tb_class")
public class Class {
    @TableId(value="Id", type= IdType.AUTO)
    private Integer Id;
    private String className;
    private String comment;
    private String createTime;

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Class{" +
                "Id=" + Id +
                ", className='" + className + '\'' +
                ", comment='" + comment + '\'' +
                ", createTime='" + createTime + '\'' +
                '}';
    }
}
