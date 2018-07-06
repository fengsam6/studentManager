package cn.feng.dao;

import cn.feng.base.BaseTest;
import cn.feng.entity.Student;
import cn.feng.service.StudentService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by rf on 2018/7/3.
 */
public class PageHelperTest extends BaseTest {
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private StudentService studentService;

    @Test
    public void test() {
        PageHelper.startPage(2, 2);
        // 组装查询条件
        Page<Student> page = new Page<>();
        page.setSize(2);
        page.setCurrent(1);
        studentService.selectPage(page);


    }

    @Test
    public void pageHelpertest() {
        //获取第1页，10条内容，默认查询总数count
        PageHelper.startPage(2, 2);
        //紧跟着的第一个select方法会被分页
        List<Student> list = studentMapper.selectList(new Wrapper<Student>() {
            @Override
            public String getSqlSegment() {
                return null;
            }
        });
        //用PageInfo对结果进行包装
        PageInfo page = new PageInfo(list);
    }
}
