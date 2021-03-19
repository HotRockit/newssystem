package com.wdy.service;

import com.wdy.domain.User;

import java.util.List;

public interface UserService {

     User findUser(String username,String password1);
     int addUser(String username,String password1);
     List<User> findAllCommonUser();
     User testUser(String username);
     int deleteUser(int userid);
     int updatePassword(String password,int userid);
     int updateUserLevel(int userid);

}
