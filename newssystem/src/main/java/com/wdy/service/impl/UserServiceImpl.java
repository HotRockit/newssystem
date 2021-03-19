package com.wdy.service.impl;

import com.wdy.dao.UserDao;
import com.wdy.domain.User;
import com.wdy.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Override
    public User findUser(String username, String password1) {

        return userDao.findUser(username,password1);

    }

    @Override
    public int addUser(String username, String password1) {
        return userDao.addUser(username,password1);
    }

    @Override
    public List<User> findAllCommonUser() {
        return userDao.findAllCommonUser();
    }

    @Override
    public User testUser(String username) {
        return userDao.testUser(username);
    }

    @Override
    public int deleteUser(int userid) {
        return userDao.deleteUser(userid);
    }

    @Override
    public int updatePassword(String password, int userid) {
        return userDao.updatePassword(password,userid);
    }

    @Override
    public int updateUserLevel(int userid) {
        return userDao.updateUserLevel(userid);
    }
}
