package cn.feng.exception;

/**
 * Created by rf on 2018/6/15.
 */
public class ParamException extends AppException {
    public ParamException(int errorCode, String msg) {
        super(errorCode, msg);
        this.errorCode = errorCode;
        this.msg = msg;
    }
}
