package com.ljh.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("执行了preHandle方法"+request.getRequestURL());
        if (request.getSession().getAttribute("user")!=null){
            return true;
        }
//        String url = request.getContextPath()+"/login";
//        System.out.println(url);
//        response.sendRedirect("/login");
//        System.out.println(request.getContextPath());
        response.sendRedirect(request.getContextPath()+"/login");
        return false;
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
