package com.feng.controller;

import com.feng.pojo.Article;
import com.feng.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class InitController {

    @Autowired
    private ArticleService articleService;

    public InitController() {
    }

    @RequestMapping(value = {"/", "index.htm"}, method = RequestMethod.GET)
    public String showMainPage(Model model) {
        List<Article> articleList = articleService.getAllArticles();
        model.addAttribute("articleList", articleList);
        return "index";
    }


}
