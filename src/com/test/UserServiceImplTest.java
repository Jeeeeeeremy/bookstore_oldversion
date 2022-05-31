package com.test;

import com.pojo.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;
import org.junit.Test;

import static org.junit.Assert.*;

public class UserServiceImplTest {

    private UserService userService = new UserServiceImpl();

    @Test
    public void registerUser() {
        userService.registerUser(
                new User(null, "admin2", "admin2", "admin2@gmail.com"));

    }

    @Test
    public void login() {
        System.out.println(userService.login(
                new User(null, "admin2", "admin2", "admin2@gmail.com")));

    }

    @Test
    public void existUsername() {
        System.out.println(userService.existUsername("admin3 "));

    }
}