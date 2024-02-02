package com.wxk1991.common;

import com.wxk1991.intercepter.AdminInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class GlobalConfig implements WebMvcConfigurer {
    /**
     *
     * @return
     */
    @Bean
    public HandlerInterceptor getAdminInterceptor(){
        return new AdminInterceptor();
    }

    /**
     * 添加全局拦截器
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry){
        registry.addInterceptor(getAdminInterceptor()).addPathPatterns("/wxk1991/**")
                .excludePathPatterns("/wxk1991/login", "/wxk1991/logout", "/wxk1991/adminLogin");

    }
}
