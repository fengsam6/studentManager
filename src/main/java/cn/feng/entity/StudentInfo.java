package cn.feng.entity;

/**
 * Created by rf on 2018/7/5.
 */
public class StudentInfo extends Student{
    private Class classObj;
    private School school;

    public Class getClassObj() {
        return classObj;
    }

    public void setClassObj(Class classObj) {
        this.classObj = classObj;
    }

    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
    }
}
