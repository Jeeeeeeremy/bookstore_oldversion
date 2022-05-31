//package com.web;
//
//import com.dao.UserDao;
//import com.dao.impl.UserDaoImpl;
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
//public class LoginServlet extends HttpServlet {
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        UserService userService = new UserServiceImpl();
//        String username = req.getParameter("username");
//        String password = req.getParameter("password");
//        User loginUser = userService.login(new User(null,username,password,null));
//
//        if (loginUser==null){
//            req.setAttribute("msg","invalid username or password!");
//            req.setAttribute("username",username);
//            req.getRequestDispatcher("/pages/user/login.jsp").forward(req, resp);
//        }else{
//            req.getRequestDispatcher("/pages/user/login_success.jsp").forward(req, resp);
//        }
//    }
//}
