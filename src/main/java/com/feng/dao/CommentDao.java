package com.feng.dao;

import com.feng.pojo.Comment;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentDao extends Dao {


    public void save(Comment newComment) {
        try {
            beginTransaction();
            getSession().save(newComment);
            commit();
        } catch (HibernateException e) {
            rollback();
            System.out.println("Could not add article  " +  e.getMessage());
        } finally {
            close();
        }
    }

    public List<Comment> getUserComments(Integer userId) {
        try {
            beginTransaction();
            Query q = getSession().createQuery("from Comment where userId = :userId");
            q.setInteger("userId", userId);
            List<Comment> myComments = q.list();
            return myComments;
        } catch (HibernateException e) {
            rollback();
            System.out.println(e.getMessage());
            return null;
        } finally {
            close();
        }
    }

    public Comment getCommentById(Integer commentId) {
        try {
            beginTransaction();
            Query q = getSession().createQuery("from Comment where id = :id");
            q.setInteger("id", commentId);
            Comment comment = (Comment) q.uniqueResult();
            return comment;
        } catch (HibernateException e) {
            rollback();
            return null;
        } finally {
            close();
        }
    }

    public void updateComment(Comment selectedComment) {
        try {
            beginTransaction();
            getSession().update(selectedComment);
            commit();
        } catch (HibernateException e) {
            rollback();
            System.out.println("Could not add user  " +  e.getMessage());
        } finally {
            close();
        }
    }

    public void deleteComment(Comment deleteComment) {
        try {
            beginTransaction();
            getSession().delete(deleteComment);
            commit();
        } catch (HibernateException e) {
            rollback();
            System.out.println("Could not add user  " +  e.getMessage());
        } finally {
            close();
        }
    }


    public List<Comment> getAllComments() {
        try {
            beginTransaction();
            Query q = getSession().createQuery("from Comment");
            List<Comment> AllComments = q.list();
            return AllComments;
        } catch (HibernateException e) {
            rollback();
            System.out.println(e.getMessage());
            return null;
        } finally {
            close();
        }
    }

}
