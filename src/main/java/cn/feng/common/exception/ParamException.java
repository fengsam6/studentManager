package cn.feng.common.exception;

import cn.feng.common.error.CommonError;

/**
 * Created by rf on 2018/6/15.
 */
public class ParamException extends AppException {
    public ParamException(int errorCode, String msg) {
        super(errorCode, msg);
    }
    public ParamException(CommonError commonError) {
        super(commonError);
    }
}
