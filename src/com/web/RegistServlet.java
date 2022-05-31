//package com.web;
//
//import com.pojo.User;
//import com.service.UserService;
//import com.service.impl.UserServiceImpl;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
//public class RegistServlet extends HttpServlet {
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        UserService userService = new UserServiceImpl();
//        //1 获取请求参数
//        String username = req.getParameter("username");
//        String password = req.getParameter("password");
//        String email = req.getParameter("email");
//        String code = req.getParameter("code");
//
//
//        //先写死检查
//        if ("abc".equalsIgnoreCase(code)) {
//            //2 检查用户名是否正确
//            //用户名存在的情况
//            if (userService.existUsername(username)) {
//                System.out.println(username + " exist");
//                req.setAttribute("msg","username is already existed");
//                req.getRequestDispatcher("/pages/user/regist.jsp").forward(req, resp);
//            } else {
//                userService.registerUser(new User(null, username, password, email));
//                req.getRequestDispatcher("/pages/user/regist_success.jsp").forward(req, resp);
//            }
//        }
//        //验证码错误
//        else {
//            System.out.println("验证码错误");
//            req.setAttribute("msg","wrong auth code");
//            req.setAttribute("username",username);
//            req.setAttribute("email",email);
//            req.setAttribute("password",password);
//            req.getRequestDispatcher("/pages/user/regist.jsp").forward(req, resp);
//        }
//    }
//}
