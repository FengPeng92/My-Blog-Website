package com.feng.controller;

import com.feng.pojo.Article;
import com.feng.pojo.Comment;
import com.feng.pojo.User;
import com.feng.service.ArticleService;
import com.feng.service.CommentService;
import com.feng.service.UserService;
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
public class AdminController {

    @Autowired
    private UserService userService;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CommentService commentService;

    private User admin;

    @RequestMapping(value = "/admin/login.htm", method = RequestMethod.GET)
    public String showLoginForm() {
        return "admin_login";
    }

    @RequestMapping(value = "/admin/login.htm", method = RequestMethod.POST)
    public String handleLoginForm(HttpServletRequest request, Model model) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (!userService.verfiedAdmin(email)) {
            model.addAttribute("error", "This is not an admin");
            System.out.println("not admin error");
            return "admin_login";
        } else if (!userService.verfiedPwd(email, password)) {
            model.addAttribute("error", "The password is not correct");
            System.out.println("password not correct");
            return "admin_login";
        } else {
            System.out.println(userService.getUserByEmail(email).getUsername());
            admin = userService.getUserByEmail(email);
            request.getSession().setAttribute("admin", userService.getUserByEmail(email));
        }
        return "admin_index";
    }

    @RequestMapping(value = "/admin/logout.htm", method = RequestMethod.GET)
    public String adminLogout(HttpServletRequest request) {
        User removeUser = (User) request.getSession().getAttribute("admin");
        System.out.println(removeUser.getId());
        request.getSession().removeAttribute("admin");
        return "admin_login";
    }

    @RequestMapping(value = "/admin/userManagement.htm", method = RequestMethod.GET)
    public String userManagement(Model model) {
        List<User> allUsers = userService.getAllUsers();
        model.addAttribute("allUsers", allUsers);
        return "admin_user";
    }

    @RequestMapping(value = "/admin/{userId}/userEdit.htm", method = RequestMethod.GET)
    public String userEdit(Model model, @PathVariable("userId") Integer id) {
        User selectedUser = userService.getUserById(id);
        model.addAttribute("selectedUser", selectedUser);
        return "admin_user_edit";

    }

    @RequestMapping(value = "/admin/{userId}/userEdit.htm", method = RequestMethod.POST)
    public String userEditSave(HttpServletRequest request, Model model, @PathVariable("userId") Integer id) {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User selectedUser = userService.getUserById(id);

        selectedUser.setUsername(username);
        selectedUser.setEmail(email);
        selectedUser.setPass(password);

        userService.updateUser(selectedUser);

        return "redirect:/admin/userManagement.htm";

    }

    @RequestMapping(value = "/admin/{userId}/userDelete.htm", method = RequestMethod.GET)
    public String userDelete(Model model, @PathVariable("userId") Integer id) {
        User deleteUser = userService.getUserById(id);

        userService.deleteUser(deleteUser);

        return "redirect:/admin/userManagement.htm";
    }

    @RequestMapping(value = "/admin/blogManagement.htm", method = RequestMethod.GET)
    public String blogManagement(Model model) {
        List<Article> allArticles = articleService.getAllArticles();
        model.addAttribute("allArticles", allArticles);
        return "admin_blog";
    }

    @RequestMapping(value = "/admin/addArticle.htm", method = RequestMethod.GET)
    public String addArticle() {
        return "admin_blog_create";
    }

    @RequestMapping(value = "/admin/uploadArticle.htm", method = RequestMethod.POST)
    public String uploadArticle(HttpServletRequest request, Model model) {
        String title = request.getParameter("blogtitle");
        String content = request.getParameter("editormd");

        Date time = new Date();

        Article article = new Article(title, content, time, admin);
        articleService.save(article);

        return "redirect:/admin/blogManagement.htm";

    }

    @RequestMapping(value = "/admin/{articleId}/viewArticle.htm", method = RequestMethod.GET)
    public String viewArticle(Model model, @PathVariable("articleId") Integer articleId)  {

        Article selectedArticle = articleService.getArticleById(articleId);

        model.addAttribute("viewArticle", selectedArticle);

        return "admin_blog_view";
    }

    @RequestMapping(value = "/admin/{articleId}/articleEdit.htm", method = RequestMethod.GET)
    public String editArticle(Model model, @PathVariable("articleId") Integer articleId) {
        Article selectedArticle = articleService.getArticleById(articleId);
        model.addAttribute("selectedArticle", selectedArticle);
        return "admin_blog_edit";
    }

    @RequestMapping(value = "/admin/{articleId}/articleEdit.htm", method = RequestMethod.POST)
    public String editArticleSave(HttpServletRequest request, @PathVariable("articleId") Integer articleId, Model model) {
        String title = request.getParameter("blogtitle");
        String content = request.getParameter("editormd");

        Date date = new Date();
        Article updateArticle = articleService.getArticleById(articleId);

        updateArticle.setTitle(title);
        updateArticle.setContent(content);
        updateArticle.setTime(date);
        articleService.updateArticle(updateArticle);

        return "redirect:/admin/blogManagement.htm";
    }

    @RequestMapping(value = "/admin/{articleId}/articleDelete.htm", method = RequestMethod.GET)
    public String articleDelete(@PathVariable("articleId") Integer articleId, Model model) {
        Article deleteArticle = articleService.getArticleById(articleId);

        articleService.deleteArticle(deleteArticle);
        return "redirect:/admin/blogManagement.htm";
    }

    @RequestMapping(value = "/admin/{articleId}/writeComment.htm", method = RequestMethod.POST)
    public String writeComment(HttpServletRequest request, @PathVariable("articleId") Integer articleId) {
        String comment = request.getParameter("comment");
        Article commentArticle = articleService.getArticleById(articleId);
        Date time = new Date();
        Comment newComment = new Comment(comment, commentArticle, admin, time);
        commentService.save(newComment);
        return "redirect:/admin/" + articleId +"/viewArticle.htm";
    }

    @RequestMapping(value = "/admin/commentManagement.htm", method = RequestMethod.GET)
    public String commentManagement(Model model) {
        List<Comment> allComments = commentService.getAllComments();
        model.addAttribute("allComments", allComments);
        return "admin_comment";
    }

    @RequestMapping(value = "/admin/{commentId}/commentEdit.htm", method = RequestMethod.GET)
    public String commentEdit(HttpServletRequest request, @PathVariable("commentId") Integer commentId, Model model) {

        List<Comment> allComments = commentService.getAllComments();
        model.addAttribute("allComments", allComments);
        model.addAttribute("editId", commentId);
        return "admin_comment";
    }

    @RequestMapping(value = "/admin/{commentId}/commentSave.htm", method = RequestMethod.POST)
    public String commentSave(HttpServletRequest request, @PathVariable("commentId") Integer commentId, Model model) {

        String name = "editComment" + commentId;
        System.out.println(name);
        String content = request.getParameter(name);
        System.out.println("My content: " + content);
        Date time = new Date();

        Comment selectedComment = commentService.getCommentById(commentId);

        selectedComment.setContent(content);
        selectedComment.setTime(time);

        commentService.updateComment(selectedComment);


        List<Comment> allComments = commentService.getAllComments();
        model.addAttribute("allComments", allComments);
        return "admin_comment";
    }

    @RequestMapping(value = "/admin/{commentId}/commentDelete.htm", method = RequestMethod.GET)
    public String commentDelete(@PathVariable("commentId") Integer commentId, Model model) {
        Comment deleteComment = commentService.getCommentById(commentId);
        commentService.deleteComment(deleteComment);

        List<Comment> allComments = commentService.getAllComments();
        model.addAttribute("allComments", allComments);
        return "admin_comment";
    }


}
