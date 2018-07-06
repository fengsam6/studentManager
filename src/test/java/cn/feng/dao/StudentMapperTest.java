package cn.feng.dao;

import cn.feng.base.BaseTest;
import cn.feng.entity.Student;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

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
}
