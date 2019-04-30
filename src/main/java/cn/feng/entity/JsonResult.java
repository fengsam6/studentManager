package cn.feng.entity;

import cn.feng.common.error.CommonError;

/**
 * Created by rf on 2018/6/15.
 */
public class JsonResult {
    private int erroCode;
    private String msg;
    private Object data;

    public int getErroCode() {
        return erroCode;
    }

    public void setErroCode(int erroCode) {
        this.erroCode = erroCode;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public static JsonResult renderSuccess(Object data){
        JsonResult jsonResult = new JsonResult();
       jsonResult.erroCode =0;
       jsonResult.data = data;
        return jsonResult;
    }
    public static JsonResult renderSuccess(String msg,Object data){
        JsonResult jsonResult = new JsonResult();
        jsonResult.erroCode =0;
        jsonResult.msg = msg;
        jsonResult.data = data;
        return jsonResult;
    }

    public static JsonResult renderSuccess(String msg){
        JsonResult jsonResult = new JsonResult();
        jsonResult.erroCode =0;
        jsonResult.msg = msg;
        return jsonResult;
    }

    public static JsonResult renderError(int erroCode,String msg){
        return renderError(erroCode,msg,null);
    }
    public static JsonResult renderError(CommonError commonError){
        return renderError(commonError.getErrorCode(),commonError.getMsg());
    }
    public static JsonResult renderError(int erroCode,String msg,Object data){
        JsonResult jsonResult = new JsonResult();
        jsonResult.erroCode =erroCode;
        jsonResult.msg = msg;
        jsonResult.data = data;
        return jsonResult;
    }
}
