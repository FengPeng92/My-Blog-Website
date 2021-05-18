package com.feng.service;

import com.feng.dao.ArticleDao;
import com.feng.pojo.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class ArticleService {

    @Autowired
    private ArticleDao articleDao;


    public List<Article> getAllArticles() {
        return articleDao.getAllArticles();
    }

    public void save(Article article) {
        articleDao.save(article);
    }

    public Article getArticleById(Integer articleId) {
        return articleDao.getArticleById(articleId);
    }

    public void updateArticle(Article updateArticle) {
        articleDao.updateArticle(updateArticle);
    }

    public void deleteArticle(Article deleteArticle) {
        articleDao.deleteArticle(deleteArticle);
    }

    public List<Article> getUserArticles(Integer userId) {
        return articleDao.getUserArticles(userId);
    }

    public List<Article> getSearchArticles(String search) {
        return articleDao.getSearchArticles(search);
    }
}
