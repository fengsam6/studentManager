package cn.feng.service;

import cn.feng.common.annotation.SysLog;
import cn.feng.entity.Student;
import cn.feng.entity.StudentInfo;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.github.pagehelper.PageInfo;

import java.util.Map;

public interface StudentService extends IService<Student> {
    Page<Student> selectUserPage(Page<Student> page, Integer state);

    PageInfo<Student> listPage(Integer pageNum, Integer pageSize, Student studentSearch);

    PageInfo<StudentInfo> listPageByProc(Integer pageNum, Integer pageSize);

    PageInfo<StudentInfo> listStudentInfoPage(Integer pageNum, Integer pageSize);

    @SysLog("添加学生")
    void add(Student student);

    void update(Student student);
}
