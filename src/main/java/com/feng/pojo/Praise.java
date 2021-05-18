package com.feng.pojo;

import javax.persistence.*;

@Entity
@Table(name = "praise")
public class Praise {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", updatable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.EAGER, targetEntity = User.class)
    @JoinColumn(name = "userId")
    private User user;

    @ManyToOne(fetch = FetchType.EAGER, targetEntity = Article.class)
    @JoinColumn(name = "articleId")
    private Article article;

    @Column(name = "status")
    private Integer status;

    public Praise() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Praise{" +
                "id=" + id +
                ", user=" + user +
                ", article=" + article +
                ", status=" + status +
                '}';
    }
}
