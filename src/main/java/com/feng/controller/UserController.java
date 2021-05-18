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
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "/user/login.htm", method = RequestMethod.GET)
    public String showLoginForm() {
        return "user_login";
    }

    @RequestMapping(value = "/user/login.htm", method = RequestMethod.POST)
    public String handleLoginForm(HttpServletRequest request, Model model) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (!userService.userExist(email)) {
            model.addAttribute("error", "This user is not existed");
            return "user_login";
        } else if (!userService.verfiedPwd(email, password)) {
            model.addAttribute("error", "The password is not correct");
            return "user_login";
        } else {
            User sessionUser = userService.getUserByEmail(email);
            request.getSession().setAttribute("user", sessionUser);
            System.out.println(sessionUser.getId());
            return "redirect:/index.htm";
        }

    }

    @RequestMapping(value = "/user/register.htm", method = RequestMethod.GET)
    public String register() {
        return "user_register";
    }

    @RequestMapping(value = "/user/register.htm", method = RequestMethod.POST)
    public String handleRegisterForm(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(true);

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");

        System.out.println(username + " " + email + " " + password);

        if (!password.equals(repassword)) {
            model.addAttribute("error", "two passwords are not the same");
            return "user_register";
        }
        if (userService.userExist(email)) {
            model.addAttribute("error", "This email is already registered");
            return "user_register";
        } else if (userService.getUserByName(username) != null) {
            model.addAttribute("error", "This username is already existed");
            return "user_register";
        } else {
            userService.add(username, email, password, "normal");
            return "redirect:/user/login.htm";
        }
    }

    @RequestMapping(value = "/user/{userId}/blogManagement.htm", method = RequestMethod.GET)
    public String viewUserInfo(Model model, @PathVariable("userId") Integer userId) {

        User user = userService.getUserById(userId);
        List<Article> userArticles = articleService.getUserArticles(userId);
        model.addAttribute("userArticles", userArticles);

        return "user_info";

    }

    @RequestMapping(value = "/user/{articleId}/userViewArticle.htm", method = RequestMethod.GET)
    public String userViewArticle(Model model, @PathVariable("articleId") Integer articleId) {
        Article selectedArticle = articleService.getArticleById(articleId);

        model.addAttribute("selectedArticle", selectedArticle);
        return "user_viewArticle";
    }

    @RequestMapping(value = "/user/{articleId}/userReadArticle.htm", method = RequestMethod.GET)
    public String userReadArticle(Model model, @PathVariable("articleId") Integer articleId) {
        Article readArticle = articleService.getArticleById(articleId);
        System.out.println(readArticle.getComments().size());

        model.addAttribute("readArticle", readArticle);

        return "user_readArticle";
    }

    @RequestMapping(value = "/user/logout.htm", method = RequestMethod.GET)
    public String userLogout(HttpServletRequest request) {
        User removeUser = (User) request.getSession().getAttribute("user");
        System.out.println(removeUser.getId());
        request.getSession().removeAttribute("user");
        return "redirect:/index.htm";
    }

    @RequestMapping(value = "/user/{userId}/userManagement.htm", method = RequestMethod.GET)
    public String profileManagement(@PathVariable("userId") Integer userId) {
        return "user_profile";
    }

    @RequestMapping(value = "/user/{userId}/userEdit.htm", method = RequestMethod.POST)
    public String userEdit(HttpServletRequest request, Model model,  @PathVariable("userId") Integer userId) {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Map<String, Integer> usernameMap = userService.getUsernameMap();
        Map<String, Integer> emailMap = userService.getEmailMap();
        System.out.println(usernameMap.size());
        System.out.println(emailMap.size());


        if (usernameMap.containsKey(username) && usernameMap.get(username) != userId) {
            model.addAttribute("usernameExisted", "This username is already registered");
            return "user_profile";
        } else if (emailMap.containsKey(email) && emailMap.get(email) != userId) {
            model.addAttribute("emailExisted", "This email is already existed");
            return "user_profile";
        } else {
            User selectedUser = userService.getUserById(userId);

            selectedUser.setUsername(username);
            selectedUser.setEmail(email);
            selectedUser.setPass(password);

            userService.updateUser(selectedUser);
            request.getSession().removeAttribute("user");
            model.addAttribute("edit", "You changed your profile, please login again");
            return "user_login";

        }

    }

    @RequestMapping(value = "/user/{userId}/newBlog.htm", method = RequestMethod.GET)
    public String newBlog(@PathVariable("userId") Integer userId) {
        return "user_blog_create";
    }

    @RequestMapping(value = "/user/{userId}/newBlog.htm", method = RequestMethod.POST)
    public String newBlogUpload(HttpServletRequest request, @PathVariable("userId") Integer userId) {
        String title = request.getParameter("blogtitle");
        String content = request.getParameter("editormd");

        Date time = new Date();
        User user = userService.getUserById(userId);

        Article article = new Article(title, content, time, user);

        articleService.save(article);
        return "redirect:/user/" + userId +"/blogManagement.htm";
    }

    @RequestMapping(value = "/user/{articleId}/articleEdit.htm", method = RequestMethod.GET)
    public String articleEdit(@PathVariable("articleId") Integer articleId, Model model) {
        Article editArticle = articleService.getArticleById(articleId);

        model.addAttribute("editArticle", editArticle);
        return "user_editArticle";
    }

    @RequestMapping(value = "/user/{userId}/{articleId}/updateArticle.htm", method = RequestMethod.POST)
    public String articleEditSave(HttpServletRequest request, @PathVariable("userId") Integer userId, @PathVariable("articleId") Integer articleId) {
        String title = request.getParameter("blogtitle");
        String content = request.getParameter("editormd");

        Date time = new Date();

        Article selectedArticle = articleService.getArticleById(articleId);

        selectedArticle.setTime(time);
        selectedArticle.setContent(content);
        selectedArticle.setTitle(title);
        articleService.updateArticle(selectedArticle);
        return "redirect:/user/" + articleId + "/userViewArticle.htm";
    }

    @RequestMapping(value = "/user/{userId}/{articleId}/articleDelete.htm", method = RequestMethod.GET)
    public String articleDelete(@PathVariable("userId") Integer userId, @PathVariable("articleId") Integer articleId, Model model) {
        Article deleteArticle = articleService.getArticleById(articleId);

        articleService.deleteArticle(deleteArticle);
        return "redirect:/user/" + userId + "/blogManagement.htm";
    }

    @RequestMapping(value = "/user/search.htm", method = RequestMethod.POST)
    public String searchArticle(HttpServletRequest request, Model model) {
        String search = request.getParameter("searchContent");
        List<Article> searchArticles = articleService.getSearchArticles(search);
        model.addAttribute("searchArticles", searchArticles);
        return "user_search";
    }

    @RequestMapping(value = "/user/{userId}/unreadComments.htm", method = RequestMethod.GET)
    public String unreadComments(@PathVariable("userId") Integer userId) {

        return "user_unreadComments";
    }

    @RequestMapping(value = "/user/{articleId}/{commentId}/viewComment.htm", method = RequestMethod.GET)
    public String viewUnreadComment(@PathVariable("commentId") Integer commentId, @PathVariable("articleId") Integer articleId) {
        return "redirect:/user/" + articleId + "/userViewComment.htm?commentID=" + commentId;

    }

    @RequestMapping(value = "/user/{articleId}/userViewComment.htm", method = RequestMethod.GET)
    public String userReadComment(Model model, @PathVariable("articleId") Integer articleId, @RequestParam("commentID") Integer commentID, HttpServletRequest request) {
        Article selectedArticle = articleService.getArticleById(articleId);

        User user = (User)request.getSession().getAttribute("user");
        Comment updateComment = user.markedAsRead(commentID);
        commentService.updateComment(updateComment);

        user.markedAsRead(updateComment.getId());
        model.addAttribute("selectedArticle", selectedArticle);
        return "user_viewArticle";
    }
}
