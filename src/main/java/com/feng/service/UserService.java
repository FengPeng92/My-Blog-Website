package com.feng.service;

import com.feng.dao.UserDao;
import com.feng.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.*;


@Service
@Transactional
public class UserService {

    @Autowired
    private UserDao userDao;


    public User getUserByEmail(String email)  {
        return userDao.getUserByEmail(email);
    }

    public boolean userExist(String email) {
        if (userDao.getUserByEmail(email) == null) return false;
        return true;
    }

    public boolean verfiedPwd(String email, String password) {
        String pwd = userDao.getPwdByEmail(email);
        if (pwd.equals(password)) {
            return true;
        } else {
            return false;
        }
    }

    public void add(User user) {
        userDao.add(user);
    }


    public void add(String username, String email, String password, String role) {
        User user = new User(username, email, password, role);
        add(user);
    }

    public boolean verfiedAdmin(String email) {
        List<User> admins = userDao.getAdmins();
        System.out.println(admins == null);
        for (User user : admins) {
            if (user.getEmail().equals(email)) return true;
        }
        return false;
    }

    public List<User> getAllUsers() {
        return userDao.getUserList();
    }

    public User getUserById(Integer id) {
        return userDao.getUserById(id);

    }

    public void updateUser(User selectedUser) {
        userDao.updateUser(selectedUser);
    }

    public void deleteUser(User deleteUser) {
        userDao.deleteUser(deleteUser);
    }

    public User getUserByName(String username) {
        return userDao.getUserByName(username);
    }

    public Map<String, Integer> getUsernameMap() {
        Map<String, Integer> map = new HashMap<>();

        for (User user : getAllUsers()) {
            map.put(user.getUsername(), user.getId());
        }
        for (User admin : userDao.getAdmins()) {
            map.put(admin.getUsername(), admin.getId());
        }
        return map;
    }

    public Map<String, Integer> getEmailMap() {
        Map<String, Integer> map = new HashMap<>();

        for (User user : getAllUsers()) {
            map.put(user.getEmail(), user.getId());
        }

        for (User admin : userDao.getAdmins()) {
            map.put(admin.getEmail(), admin.getId());
        }
        return map;
    }

}
