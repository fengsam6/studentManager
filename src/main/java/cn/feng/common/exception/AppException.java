package cn.feng.common.exception;


import cn.feng.common.error.CommonError;

/**
 * Created by rf on 2018/6/15.
 */
public class AppException extends RuntimeException implements CommonError{
    protected int errorCode;
    protected String msg;

    public int getErrorCode() {
        return errorCode;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public AppException(int errorCode, String msg) {
        super(msg);
        this.errorCode = errorCode;
        this.msg = msg;
    }
    public AppException(CommonError commonError) {
        this(commonError.getErrorCode(),commonError.getMsg());
    }
}
