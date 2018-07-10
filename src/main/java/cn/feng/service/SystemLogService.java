package cn.feng.service;

import cn.feng.entity.SystemLog;
import com.baomidou.mybatisplus.service.IService;
import com.github.pagehelper.PageInfo;

/**
 * Created by rf on 2018/6/15.
 */
public interface SystemLogService extends IService<SystemLog> {
    PageInfo<SystemLog> listPage(Integer pageNum, Integer pageSize, SystemLog systemLog);

    void deleteBatchIds(Long[] ids);
}
