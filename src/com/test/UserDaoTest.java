package com.test;

import com.dao.UserDao;
import com.dao.impl.UserDaoImpl;
import com.pojo.User;
import org.junit.Test;

import static org.junit.Assert.*;

public class UserDaoTest {

    @Test
    public void queryUserByName() {
        UserDao userDao = new UserDaoImpl();
        System.out.println(userDao.queryUserByName("admin"));
    }

    @Test
    public void queryUserByNameAndPassword() {
        UserDao userDao = new UserDaoImpl();
        System.out.println(userDao.queryUserByNameAndPassword("admin","admin"));
    }

    @Test
    public void saveUser() {
        UserDao userDao = new UserDaoImpl();
        System.out.println(userDao.saveUser(
                new User(null,"admin1","admin1","admin1@gmail.com")));
    }
}