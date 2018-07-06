package cn.feng.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by rf on 2018/6/15.
 */
public class CommonUtil {
    public static String getSystemDate(String dateFormat){
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat( dateFormat);
        return simpleDateFormat.format(date);
    }
}
