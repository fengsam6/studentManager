package cn.feng.dao;

import cn.feng.base.BaseTest;
import cn.feng.entity.Student;
import cn.feng.entity.StudentInfo;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by rf on 2018/7/2.
 */
public class StudentMapperTest extends BaseTest {
    @Autowired
    private StudentMapper studentMapper;
    @Test
   public void testInsert(){
       Student student = new Student();
       student.setClassId(2);
       student.setMajor("MajorTest2");
      int id = studentMapper.insert(student);
        logger.debug("测试添加学生");
   }
    @Test
    public void testDelete(){
        int id=1;
        studentMapper.deleteById(id);
        logger.debug("测试删除学生");
    }

    @Test
    public void studentInfoTest(){
      List<StudentInfo> studentInfoList = studentMapper.listStudentInfo();
       for (StudentInfo studentInfo : studentInfoList)
        logger.debug("测试学生{}",studentInfo.toString());
    }

    @Test
    public void updateTest(){
        Student student = new Student();
        student.setId(14);
        student.setStudentName("test14");
        student.setPhone("11111");
        studentMapper.updateById(student);
    }
    @Test
    public void updateTest2(){
        Student student = new Student();
        student.setId(14);
        student.setStudentName("test14");
        student.setPhone("11111");
        studentMapper.update(student,new EntityWrapper<>(student));
    }

    @Test
    public void selectTest(){
        Student student = new Student();
        student.setGender(0);

        studentMapper.selectList(new EntityWrapper<>(student));
    }
}
