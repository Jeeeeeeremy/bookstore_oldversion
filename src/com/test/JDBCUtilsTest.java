package com.test;

import com.utils.JDBCUtils;
import org.junit.Test;

import java.sql.Connection;

public class JDBCUtilsTest {
    @Test

    public void testuitils(){
        for (int i = 0; i <50 ; i++) {
            Connection con = JDBCUtils.getConnection();
            System.out.println(con);
            JDBCUtils.close(con);
        }

    }

}
