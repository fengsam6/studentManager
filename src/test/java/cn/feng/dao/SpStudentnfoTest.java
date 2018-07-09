package cn.feng.dao;

import cn.feng.base.BaseTest;
import cn.feng.entity.StudentInfo;
import cn.feng.entity.UserInfo;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by rf on 2018/7/9.
 */
public class SpStudentnfoTest extends BaseTest {
    @Autowired
    private StudentMapper studentMapper;
    @Test
    public void test(){
       List<StudentInfo> studentInfoList = studentMapper.getStudentInfoByProc();
       for(StudentInfo studentInfo : studentInfoList){
           System.out.println(studentInfo.toString());
       }
    }
}
