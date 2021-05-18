package com.feng.pojo;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "comment")
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", updatable = false)
    private Integer id;

    @Column(name = "content")
    private String content;

    @Column(name = "time")
    private Date time;


    @ManyToOne(fetch = FetchType.EAGER, targetEntity = Article.class)
    @JoinColumn(name = "articleId")
    private Article article;

    @ManyToOne(fetch = FetchType.EAGER, targetEntity = User.class)
    @JoinColumn(name = "userId")
    private User user;

    @Column(name = "isRead")
    private boolean isRead;

    public Comment() {
    }

    public Comment(String content, Article article, User user, Date time) {
        this.content = content;
        this.article = article;
        this.user = user;
        this.time = time;
        isRead = false;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
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

    public boolean isRead() {
        return isRead;
    }

    public void setRead(boolean read) {
        isRead = read;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", time=" + time +
                ", article=" + article +
                ", user=" + user +
                ", isRead=" + isRead +
                '}';
    }
}
