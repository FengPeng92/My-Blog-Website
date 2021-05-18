package com.feng.service;

import com.feng.dao.CommentDao;
import com.feng.pojo.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class CommentService {

    @Autowired
    private CommentDao commentDao;


    public void save(Comment newComment) {
        commentDao.save(newComment);
    }

    public List<Comment> getUserComments(Integer userId) {
        return commentDao.getUserComments(userId);
    }

    public Comment getCommentById(Integer commentId) {
        return commentDao.getCommentById(commentId);
    }

    public void updateComment(Comment selectedComment) {
        commentDao.updateComment(selectedComment);
    }

    public void deleteComment(Comment deleteComment) {
        commentDao.deleteComment(deleteComment);
    }

    public List<Comment> getAllComments() {
        return commentDao.getAllComments();
    }
}
