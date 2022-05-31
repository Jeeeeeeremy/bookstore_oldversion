package com.utils;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCUtils {

    private static DruidDataSource dataSource;

    static {
        try {
            Properties properties = new Properties();
            InputStream in = JDBCUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
            properties.load(in);
            //创建数据库链接池
            dataSource = (DruidDataSource)DruidDataSourceFactory.createDataSource(properties);


        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }



    public static Connection getConnection(){
        Connection con = null;
        try {
            con = dataSource.getConnection();
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return con;
    }

    public static void close(Connection conn){
        if (conn!=null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


}
