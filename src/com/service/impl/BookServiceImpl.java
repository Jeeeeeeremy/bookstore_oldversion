package com.service.impl;

import com.dao.BookDao;
import com.dao.impl.BookDaoImpl;
import com.pojo.Book;
import com.pojo.Page;
import com.service.BookService;

import java.util.List;

public class BookServiceImpl implements BookService {

    private BookDao bookDao = new BookDaoImpl();

    @Override
    public void addBook(Book book) {
        bookDao.addBook(book);
    }

    @Override
    public void deleteBookById(Integer id) {
        bookDao.deleteBookById(id);
    }

    @Override
    public void updateBook(Book book) {
        bookDao.updateBook(book);
    }

    @Override
    public Book queryBookById(Integer id) {
        return bookDao.queryBookById(id);
    }

    @Override
    public List<Book> queryBooks() {
        return bookDao.queryBooks();
    }


    @Override
    public Page<Book> page(int pageNo, int pageSize) {
        Page<Book> page = new Page<Book>();
        if (pageNo<1) pageNo = 1;
        page.setPageNo(pageNo);
        page.setPageSize(pageSize);
        //拿到总记录数
        Integer pageTotalCount = bookDao.queryForPageTotalCount();
        page.setPageTotalCount(pageTotalCount);
        page.setPageTotal(pageTotalCount/pageSize+(pageTotalCount%pageSize>0 ? 1:0));
        if(pageNo>page.getPageTotal()) page.setPageNo(page.getPageTotal());
        //请求本页的数据
        List<Book> items = bookDao.queryForPageItems((page.getPageNo()-1)*pageSize,pageSize);
        page.setItems(items);
        return page;
    }



}
