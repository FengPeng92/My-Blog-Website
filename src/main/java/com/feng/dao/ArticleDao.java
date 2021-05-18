package com.feng.dao;

import com.feng.pojo.Article;
import com.feng.pojo.User;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ArticleDao extends Dao{

    public List<Article> getAllArticles() {

        try {
            beginTransaction();
            Query q = getSession().createQuery("from Article");
            List<Article> allArticles = q.list();
            return allArticles;
        } catch (HibernateException e) {
            rollback();
            System.out.println(e.getMessage());
            return null;
        } finally {
            close();
        }
    }

    public void save(Article article) {
        try {
            beginTransaction();
            getSession().save(article);
            commit();
        } catch (HibernateException e) {
            rollback();
            System.out.println("Could not add article  " +  e.getMessage());
        } finally {
            close();
        }
    }

    public Article getArticleById(Integer articleId) {
        try {
            beginTransaction();
            Query q = getSession().createQuery("from Article where id = :id");
            q.setInteger("id", articleId);
            Article article = (Article)q.uniqueResult();
            return article;
        } catch (HibernateException e) {
            rollback();
            return null;
        } finally {
            close();
        }
    }

    public void updateArticle(Article updateArticle) {
        try {
            beginTransaction();
            getSession().update(updateArticle);
            commit();
        } catch (HibernateException e) {
            rollback();
            System.out.println("Could not add article  " +  e.getMessage());
        } finally {
            close();
        }
    }

    public void deleteArticle(Article deleteArticle) {
        try {
            beginTransaction();
            getSession().delete(deleteArticle);
            commit();
        } catch (HibernateException e) {
            rollback();
            System.out.println("Could not add article  " +  e.getMessage());
        } finally {
            close();
        }
    }

    public List<Article> getUserArticles(Integer userId) {
        try {
            beginTransaction();
            Query q = getSession().createQuery("from Article where userId = :userId");
            q.setInteger("userId", userId);
            List<Article> allArticles = q.list();
            return allArticles;
        } catch (HibernateException e) {
            rollback();
            System.out.println(e.getMessage());
            return null;
        } finally {
            close();
        }

    }

    public List<Article> getSearchArticles(String search) {
        try {
            beginTransaction();
            Query q = getSession().createQuery("from Article where title like :search");
            q.setString("search", "%" + search + "%");
            List<Article> allArticles = q.list();
            return allArticles;
        } catch (HibernateException e) {
            rollback();
            System.out.println(e.getMessage());
            return null;
        } finally {
            close();
        }

    }
}
