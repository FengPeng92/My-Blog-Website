package com.feng.pojo;

import javax.persistence.*;
import java.io.Serializable;
import java.util.*;

@Entity
@Table(name = "article")
public class Article implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", updatable = false)
    private Integer id;

    @Column(name = "title", nullable = false)
    private String title;

    @Column(name = "content", length = 10000)
    private String content;

    @Column(name = "time")
    private Date time;

    @ManyToOne(fetch = FetchType.EAGER, targetEntity = User.class)
    @JoinColumn(name = "userId")
    private User user;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "article", targetEntity = Comment.class, cascade = CascadeType.ALL)
    private Set<Comment> comments = new HashSet<>();

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "article", targetEntity = Praise.class, cascade = CascadeType.ALL)
    private Set<Praise> praises = new HashSet<>();

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "article", targetEntity = Star.class, cascade = CascadeType.ALL)
    private Set<Star> stars = new HashSet<>();

    public Article() {
    }

    public Article(String title, String content, Date time, User user) {
        this.title = title;
        this.content = content;
        this.time = time;
        this.user = user;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set<Comment> getComments() {
        return comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    public Set<Praise> getPraises() {
        return praises;
    }

    public void setPraises(Set<Praise> praises) {
        this.praises = praises;
    }

    public Set<Star> getStars() {
        return stars;
    }

    public void setStars(Set<Star> stars) {
        this.stars = stars;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", time=" + time +
                ", user=" + user +
                ", comments=" + comments +
                ", praises=" + praises +
                ", stars=" + stars +
                '}';
    }
}
