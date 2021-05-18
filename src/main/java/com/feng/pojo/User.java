package com.feng.pojo;

import org.hibernate.validator.constraints.Email;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "user")
public class User implements Serializable {

    @Id
    @GeneratedValue
    @Column(name = "id", updatable = false)
    private Integer id;

    @Column(name = "username", nullable = false, unique = true)
    private String username;

    @Column(name = "pass", nullable = false)
    private String pass;

    @Column(name = "email", nullable = false, unique = true)
    @Email(message = "Email is not validated")
    private String email;

    @Column(name = "portrait")
    private String portrait;

    @Column(name = "myRole")
    private String role;

    @OneToMany(fetch = FetchType.EAGER, targetEntity = Article.class, cascade = CascadeType.ALL, mappedBy = "user")
    private Set<Article> articles = new HashSet<>();

    @OneToMany(fetch = FetchType.EAGER, targetEntity = Comment.class, cascade = CascadeType.ALL, mappedBy = "user")
    private Set<Comment> myComments = new HashSet<>();

    @OneToMany(fetch = FetchType.EAGER, targetEntity = Praise.class, cascade = CascadeType.ALL, mappedBy = "user")
    private Set<Praise> myPraises = new HashSet<>();

    @OneToMany(fetch = FetchType.EAGER, targetEntity = Star.class, cascade = CascadeType.ALL, mappedBy = "user")
    private Set<Star> myStars = new HashSet<>();

    @Transient
    private Set<Comment> unreadComment = new HashSet<>();
    public User() {
    }

    public User(String username, String email, String password, String role) {
        this.username = username;
        this.email = email;
        this.pass = password;
        this.role = role;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPortrait() {
        return portrait;
    }

    public void setPortrait(String portrait) {
        this.portrait = portrait;
    }

    public Set<Article> getArticles() {
        return articles;
    }

    public void setArticles(Set<Article> articles) {
        this.articles = articles;
    }

    public Set<Comment> getMyComments() {
        return myComments;
    }

    public void setMyComments(Set<Comment> myComments) {
        this.myComments = myComments;
    }

    public Set<Praise> getMyPraises() {
        return myPraises;
    }

    public void setMyPraises(Set<Praise> myPraises) {
        this.myPraises = myPraises;
    }

    public Set<Star> getMyStars() {
        return myStars;
    }

    public void setMyStars(Set<Star> myStars) {
        this.myStars = myStars;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Set<Comment> getUnreadComment() {
        return unreadComment;
    }

    public void setUnreadComment(Set<Comment> unreadComment) {
        this.unreadComment = unreadComment;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", pass='" + pass + '\'' +
                ", email='" + email + '\'' +
                ", portrait='" + portrait + '\'' +
                ", role='" + role + '\'' +
                ", articles=" + articles +
                ", myComments=" + myComments +
                ", myPraises=" + myPraises +
                ", myStars=" + myStars +
                '}';
    }

    public Comment markedAsRead(Integer commentID) {
        for (Comment comment : unreadComment) {
            if (comment.getId() == commentID) {
                comment.setRead(true);
                return comment;
            }
        }
        return null;
    }

    public Set<Comment> UnreadComments() {
        unreadComment.clear();

        for (Article article : articles) {
            for (Comment comment :article.getComments()) {
                if (!comment.isRead()) {
                    unreadComment.add(comment);
                }
            }
        }
        return unreadComment;
    }
}
