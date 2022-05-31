package com.utils;

import com.pojo.User;
import org.apache.commons.beanutils.BeanUtils;

import javax.security.auth.login.CredentialNotFoundException;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

public class WebUtils {

    public static <T> T copyParamToBean(HttpServletRequest req, T bean){

        try {
            BeanUtils.populate(bean,req.getParameterMap());
            System.out.println(bean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bean;
    }

    public static <T> T copyParamToBean(Map value, T bean){

        try {
            BeanUtils.populate(bean,value);
            System.out.println(bean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bean;
    }


    public static int parseInt(String value,int defaultValue){
        try {
            return  Integer.parseInt(value);
        } catch (Exception e) {
//            e.printStackTrace();
        }
            return defaultValue;


    }
}
