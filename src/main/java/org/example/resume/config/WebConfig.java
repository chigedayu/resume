package org.example.resume.config;

import org.example.resume.interceptor.CorsInterceptor;
import org.example.resume.interceptor.JwtInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// 注册拦截器配置
@Configuration
public class WebConfig implements WebMvcConfigurer {
    // CorsInterceptor类头上使用@Component注解, 把控制器反转给IOC容器
    // 在配置类中直接组装拦截器对象
    @Autowired
    private CorsInterceptor corsInterceptor;

    // 组装Jwt拦截器
    @Autowired
    private JwtInterceptor jwtInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 配置跨域拦截器
        registry.addInterceptor(corsInterceptor)
                .addPathPatterns("/**")
        .order(1);
        // 配置Jwt拦截器
        registry.addInterceptor(jwtInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/user/login", "/user/register", "/error")
                .order(2);
    }
}