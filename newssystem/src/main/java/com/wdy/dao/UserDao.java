package com.wdy.dao;

import com.wdy.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
     User findUser(@Param("username") String username,@Param("password") String password1);
     int addUser(@Param("username")String username,@Param("password") String password1);
     List<User> findAllCommonUser();
     User testUser(@Param("username") String username);
     int deleteUser(@Param("userid") int userid);
     int updatePassword(@Param("password") String password,@Param("userid") int userid);
     int updateUserLevel(@Param("userid") int userid);
}
