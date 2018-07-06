package cn.feng.dao;

import cn.feng.entity.Student;
import cn.feng.entity.StudentInfo;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentMapper extends BaseMapper<Student> {
//    List<Student> selectUserList(Pagination page, Integer state);
    List<StudentInfo> listStudentInfo();
}
