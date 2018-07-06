package cn.feng.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * Created by rf on 2018/7/2.
 */
@TableName("tb_student")
public class Student {
    @TableId(value="Id", type= IdType.AUTO)
    private Integer id;
    private String studentName;
    private String studentNum;
    //0男，1女
    private Integer gender;
    //专业名称
    private String major;
    private String email;
    private String enterSchoolTime;
    private String phone;
    private String averPath;
    private Integer classId;
    private Integer schoolId;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAverPath() {
        return averPath;
    }

    public void setAverPath(String averPath) {
        this.averPath = averPath;
    }

    public Integer getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Integer schoolId) {
        this.schoolId = schoolId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEnterSchoolTime() {
        return enterSchoolTime;
    }

    public void setEnterSchoolTime(String enterSchoolTime) {
        this.enterSchoolTime = enterSchoolTime;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentNum() {
        return studentNum;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public void setStudentNum(String studentNum) {
        this.studentNum = studentNum;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", studentName='" + studentName + '\'' +
                ", studentNum='" + studentNum + '\'' +
                ", gender=" + gender +
                ", major='" + major + '\'' +
                ", email='" + email + '\'' +
                ", enterSchoolTime='" + enterSchoolTime + '\'' +
                ", phone='" + phone + '\'' +
                ", averPath='" + averPath + '\'' +
                ", classId=" + classId +
                ", schoolId=" + schoolId +
                '}';
    }
}
