package com.dao;

import com.pojo.User;

public interface UserDao {




    /**
     *根据用户名查询用户信息，用于注册
     * @param username
     * @return
     */
    public User queryUserByName(String username);

    /**
     * 根据用户名和密码查询用户信息，用于登陆
     * @param username
     * @param password
     * @return
     */
    public User queryUserByNameAndPassword(String username, String password);


    /**
     * 储存用户，用于注册完成后
     * @param user
     * @return
     */
    public int saveUser(User user);

}
