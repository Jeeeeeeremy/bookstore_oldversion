package com.web;

import com.pojo.Book;
import com.pojo.Page;
import com.service.BookService;
import com.service.impl.BookServiceImpl;
import com.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ClientBookServlet extends BaseServlet {
    private BookService bookService = new BookServiceImpl();
    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1 获取请求参数 pageNo 和pageSize
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
        //2 调用bookservice的page方法

        Page<Book> page = bookService.page(pageNo, pageSize);
        page.setUrl("/client/bookServlet?action=page");
        //3 保存page对象到req
        req.setAttribute("page", page);
        //4 请求转发到bookmanager页面
        req.getRequestDispatcher("/pages/client/index.jsp").forward(req, resp);
        System.out.println("转发完成");
    }


}
