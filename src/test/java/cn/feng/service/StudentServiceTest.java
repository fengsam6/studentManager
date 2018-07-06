package cn.feng.service;

import cn.feng.base.BaseTest;
import cn.feng.dao.StudentMapper;
import cn.feng.entity.Student;
import com.baomidou.mybatisplus.plugins.Page;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import java.util.List;

/**
 * Created by rf on 2018/7/2.
 */
public class StudentServiceTest extends BaseTest {
    @Autowired
    private StudentService studentService;
    @Test
   public void testInsert(){
       Student student = new Student();
       student.setClassId(1);
       student.setMajor("MajorTest");
       studentService.insert(student);
        logger.debug("测试添加学生");
   }
    @Test
    public void selectPageTest1(){
        Page<Student> page = new Page<>();
        page.setCurrent(1);
        page.setSize(3);
        Page<Student> studentPage = studentService.selectPage(page);
        List<Student> studentList = studentPage.getRecords();
        for(Student student : studentList){
            logger.debug("{}",student.toString());
        }

    }

    @Test
    public void selectPageTest2() {
        Student student = new Student();
        student.setClassId(2);
      PageInfo<Student> studentPageInfo = studentService.listPage(1,2,student);
      logger.debug("count:{}",studentPageInfo.getList().size());

    }

        @Test
    public void testDelete(){
        int id=1;
        studentService.deleteById(id);
        logger.debug("测试删除学生");
    }
}
