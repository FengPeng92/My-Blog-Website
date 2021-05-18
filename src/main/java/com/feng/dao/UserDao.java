package com.feng.dao;

import com.feng.pojo.Comment;
import com.feng.pojo.User;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDao extends Dao {


    // get user by the email
    public User getUserByEmail(String email) {
        try {
            beginTransaction();
            Query q = getSession().createQuery("from User where email = :email");
            q.setString("email", email);
            User user = (User)q.uniqueResult();
            return user;
        } catch (HibernateException e) {
            rollback();
//            throw new Exception("Could not get user" + email, e);
            return null;
        } finally {
            close();
        }
    }

    //get user's password
    public String getPwdByEmail(String email) {
        try {
            beginTransaction();
            Query q = getSession().createQuery("from User where email = :email");
            q.setString("email", email);
            User user = (User)q.uniqueResult();
            return user.getPass();
        } catch (HibernateException e) {
            rollback();
            return null;
        } finally {
            close();
        }
    }


    public void add(User user) {
        try {
            beginTransaction();
            getSession().save(user);
            commit();
        } catch (HibernateException e) {
            rollback();
            System.out.println("Could not add user  " +  e.getMessage());
        } finally {
            close();
        }
    }

    public List<User> getAdmins() {
        try {
            beginTransaction();
            Query q = getSession().createQuery("from User where myRole = :role");
            q.setString("role", "admin");
            List<User> users = q.list();
            return users;
        } catch (HibernateException e) {
            rollback();
            System.out.println(e.getMessage());
            return null;
        } finally {
            close();
        }
    }

    public List<User> getUserList() {
        try {
            beginTransaction();
            Query q = getSession().createQuery("from User where myRole = :role");
            q.setString("role", "normal");
            List<User> users = q.list();
            return users;
        } catch (HibernateException e) {
            rollback();
            System.out.println(e.getMessage());
            return null;
        } finally {
            close();
        }
    }

    public User getUserById(Integer id) {
        try {
            beginTransaction();
            Query q = getSession().createQuery("from User where id = :id");
            q.setInteger("id", id);
            User user = (User)q.uniqueResult();
            return user;
        } catch (HibernateException e) {
            rollback();
            return null;
        } finally {
            close();
        }
    }

    public void updateUser(User selectedUser) {
        try {
            beginTransaction();
            getSession().update(selectedUser);
            commit();
        } catch (HibernateException e) {
            rollback();
            System.out.println("Could not add user  " +  e.getMessage());
        } finally {
            close();
        }
    }

    public void deleteUser(User deleteUser) {
        try {
            beginTransaction();
            getSession().delete(deleteUser);
            commit();
        } catch (HibernateException e) {
            rollback();
            System.out.println("Could not add user  " +  e.getMessage());
        } finally {
            close();
        }
    }

    public User getUserByName(String username) {
        try {
            beginTransaction();
            Query q = getSession().createQuery("from User where username = :username");
            q.setString("username", username);
            User user = (User)q.uniqueResult();
            return user;
        } catch (HibernateException e) {
            rollback();
            return null;
        } finally {
            close();
        }
    }
}
