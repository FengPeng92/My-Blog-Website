package com.feng.controller;


import com.feng.pojo.Article;
import com.feng.pojo.Comment;
import com.feng.pojo.User;
import com.feng.service.ArticleService;
import com.feng.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
public class CommentController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CommentService commentService;


    @RequestMapping(value = "/user/{articleId}/writeComment.htm", method = RequestMethod.POST)
    public String writeComment(HttpServletRequest request, @PathVariable("articleId") Integer articleId) {
        String comment = request.getParameter("comment");
        User commentUser = (User)request.getSession().getAttribute("user");
        Article commentArticle = articleService.getArticleById(articleId);
        Date time = new Date();
        Comment newComment = new Comment(comment, commentArticle, commentUser, time);
        commentService.save(newComment);

//        User author = commentArticle.getUser();
//        author.addUnreadComment(newComment);
//        System.out.println(author.getUsername() + " " + author.getUnreadComment().size());

        return "redirect:/user/" + articleId +"/userReadArticle.htm";
    }


    @RequestMapping(value = "/user/{userId}/commentManagement.htm", method = RequestMethod.GET)
    public String commentManagement(@PathVariable("userId") Integer userId, Model model) {

        List<Comment> myComments = commentService.getUserComments(userId);
        model.addAttribute("myComments", myComments);
        boolean edit = false;
        model.addAttribute("editable", edit);
        return "user_comments";
    }

    @RequestMapping(value = "/user/{userId}/{commentId}/commentEdit.htm", method = RequestMethod.GET)
    public String commentEdit(HttpServletRequest request, @PathVariable("userId") Integer userId, @PathVariable("commentId") Integer commentId, Model model) {

        List<Comment> myComments = commentService.getUserComments(userId);
        model.addAttribute("myComments", myComments);
        model.addAttribute("editId", commentId);
        return "user_comments";
    }

    @RequestMapping(value = "/user/{userId}/{commentId}/commentSave.htm", method = RequestMethod.POST)
    public String commentSave(HttpServletRequest request, @PathVariable("userId") Integer userId, @PathVariable("commentId") Integer commentId, Model model) {

        String name = "editComment" + commentId;
        System.out.println(name);
        String content = request.getParameter(name);
        System.out.println("My content: " + content);
        Date time = new Date();

        Comment selectedComment = commentService.getCommentById(commentId);

        selectedComment.setContent(content);
        selectedComment.setTime(time);

        commentService.updateComment(selectedComment);


        List<Comment> myComments = commentService.getUserComments(userId);
        model.addAttribute("myComments", myComments);
        return "user_comments";
    }

    @RequestMapping(value = "/user/{userId}/{commentId}/commentDelete.htm", method = RequestMethod.GET)
    public String commentDelete(@PathVariable("userId") Integer userId, @PathVariable("commentId") Integer commentId, Model model) {
        Comment deleteComment = commentService.getCommentById(commentId);
        commentService.deleteComment(deleteComment);

        List<Comment> myComments = commentService.getUserComments(userId);
        model.addAttribute("myComments", myComments);
        return "user_comments";
    }

}
