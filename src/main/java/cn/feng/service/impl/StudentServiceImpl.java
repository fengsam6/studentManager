package cn.feng.service.impl;

import cn.feng.dao.StudentMapper;
import cn.feng.entity.Student;
import cn.feng.entity.StudentInfo;
import cn.feng.service.StudentService;
import cn.feng.service.support.BaseServiceImpl;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rf on 2018/7/2.
 */
@Service("studentService")
public class StudentServiceImpl extends BaseServiceImpl<StudentMapper, Student> implements StudentService {
    @Autowired
    private StudentMapper studentMapper;


    @Override
    public Page<Student> selectUserPage(Page<Student> page, Integer state) {
        return null;
    }

    public PageInfo<Student> listPage(Integer pageNum, Integer pageSize, Student studentSearch) {
        //获取第1页，10条内容，默认查询总数count
        if (pageNum == null) {
            pageNum = 1;
        }
        if (pageSize == null) {
            pageSize = 10;
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Student> list = studentMapper.selectList(new EntityWrapper<>(studentSearch));
        /* 用PageInfo对结果进行包装 */
        return new PageInfo<>(list);
    }

    @Override
    public PageInfo<StudentInfo> listPageByProc(Integer pageNum, Integer pageSize) {
        if (pageNum == null) {
            pageNum = 1;
        }
        if (pageSize == null) {
            pageSize = 10;
        }
        PageHelper.startPage(pageNum, pageSize);

//        紧跟着的第一个select方法会被分页
        List<StudentInfo> list = studentMapper.getStudentInfoByProc();
        /* 用PageInfo对结果进行包装 */
        return new PageInfo<>(list);
    }

    @Override
    public PageInfo<StudentInfo> listStudentInfoPage(Integer pageNum, Integer pageSize) {
        if (pageNum == null) {
            pageNum = 1;
        }
        if (pageSize == null) {
            pageSize = 10;
        }
        PageHelper.startPage(pageNum, pageSize);

//        紧跟着的第一个select方法会被分页
        List<StudentInfo> list = studentMapper.listStudentInfo();
        /* 用PageInfo对结果进行包装 */
        return new PageInfo<>(list);
    }

    @Override
    public void add(Student student) {
        Assert.notNull(student.getStudentName(), "学生姓名不能为空！");
        Assert.hasText(student.getStudentNum(), "学号不能为空！");
        Assert.notNull(student.getClassId(), "班级不能为空！");
        Assert.hasText(student.getMajor(), "专业不能为空");
        studentMapper.insert(student);
    }

    @Override
    public void update(Student student) {
        Assert.notNull(student.getId(), "学生id不能为空！");
        Assert.notNull(student.getStudentName(), "学生姓名不能为空！");
        Assert.hasText(student.getStudentNum(), "学号不能为空！");
        Assert.notNull(student.getClassId(), "班级不能为空！");
        Assert.hasText(student.getMajor(), "专业不能为空");
        studentMapper.updateById(student);
    }
}
