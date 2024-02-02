package com.wxk1991.intercepter;

import cn.hutool.http.HttpStatus;
import com.wxk1991.entity.Admin;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Objects;

@Slf4j
public class AdminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        if (Objects.isNull(session.getAttribute("admin"))){
            response.sendError(HttpStatus.HTTP_NOT_FOUND);
            return false;
        }
        return true;
    }
}
