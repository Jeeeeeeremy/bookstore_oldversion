package com.web;

import com.pojo.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

public class UserServlet extends BaseServlet {

    protected void logout(HttpServletRequest req, HttpServletResponse resp) throws Exception{
        req.getSession().invalidate();
        resp.sendRedirect(req.getContextPath());
    }

    protected void login(HttpServletRequest req, HttpServletResponse resp) throws Exception{
        UserService userService = new UserServiceImpl();
        // 2 注入bean
        User user = com.utils.WebUtils.copyParamToBean(req.getParameterMap(),new User());
        User loginUser = userService.login(new User(null,user.getUsername(),user.getPassword(),null));

        if (loginUser==null){
            req.setAttribute("msg","invalid username or password!");
            req.setAttribute("username",user.getUsername());
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req, resp);
        }else{
            //保存用户登陆的信息
            req.getSession().setAttribute("user",loginUser);
            req.getRequestDispatcher("/pages/user/login_success.jsp").forward(req, resp);
        }
    }

    protected void regist(HttpServletRequest req, HttpServletResponse resp) throws Exception{
        UserService userService = new UserServiceImpl();
        //1 获取请求参数
          String code  = req.getParameter("code");
          String token = (String) req.getSession().getAttribute(KAPTCHA_SESSION_KEY);
          req.getSession().removeAttribute(KAPTCHA_SESSION_KEY);
          User user = com.utils.WebUtils.copyParamToBean(req.getParameterMap(),new User());
          if (token!=null && token.equalsIgnoreCase(code)){
              // 2 注入bean
              //先写死检查
                  //2 检查用户名是否正确
                  //用户名存在的情况
                  if (userService.existUsername(user.getUsername())) {
                      System.out.println(user.getUsername() + " exist");
                      req.setAttribute("msg","username is already existed");
                      req.getRequestDispatcher("/pages/user/regist.jsp").forward(req, resp);
                  } else {
                      userService.registerUser(user);
                      //req.getRequestDispatcher("/pages/user/regist_success.jsp").forward(req, resp);
                      resp.sendRedirect(req.getContextPath()+"/pages/user/regist_success.jsp");
                  }
          }
        //验证码错误
        else {
            System.out.println("验证码错误");
            req.setAttribute("msg","wrong auth code");
            req.setAttribute("username",user.getUsername());
            req.setAttribute("email",user.getEmail());
            req.setAttribute("password",user.getPassword());
            req.getRequestDispatcher("/pages/user/regist.jsp").forward(req, resp);
        }
    }



}
