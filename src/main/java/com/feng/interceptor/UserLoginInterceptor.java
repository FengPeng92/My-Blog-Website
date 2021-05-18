package com.feng.interceptor;

import com.feng.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserLoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (request.getRequestURI().equals("/user/login.htm") || request.getRequestURI().equals("/user/register.htm") ||
                request.getRequestURI().equals("/user/search.htm")) return true;
        String uri = request.getRequestURI();

        boolean isnull = uri.equals("");

        String[] split = uri.split("/");
        boolean read = split[split.length - 1].equals("userReadArticle.htm");

        User user = (User) request.getSession().getAttribute("user");
        if (!isnull && !read && user == null) {
            response.sendRedirect("/user/login.htm");
            return false;
        }
        return true;

    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
