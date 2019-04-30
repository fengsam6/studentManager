package cn.feng.common.exception;

import cn.feng.common.error.CommonError;

/**
 * Created by rf on 2018/6/15.
 */
public class BusinessException extends AppException {
    public BusinessException(int errorCode, String msg) {
        super(errorCode, msg);
    }
    public BusinessException(CommonError commonError) {
        super(commonError);
    }
}
