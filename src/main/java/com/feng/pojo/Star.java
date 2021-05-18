package com.feng.pojo;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "star")
public class Star {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", updatable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.EAGER, targetEntity = Article.class)
    @JoinColumn(name = "articleId")
    private Article article;

    @ManyToOne(fetch = FetchType.EAGER, targetEntity = User.class)
    @JoinColumn(name = "userId")
    private User user;

    @Column(name = "status")
    private Integer status;


    public Star() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Star{" +
                "id=" + id +
                ", article=" + article +
                ", user=" + user +
                ", status=" + status +
                '}';
    }
}
