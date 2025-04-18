package org.example.resume.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class CorsInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {
        // 设置允许跨域的源（生产环境建议替换为具体域名）
        // 只需要前端在localhost:88请求后端
        response.setHeader("Access-Control-Allow-Origin", "http://localhost:88");

        // 允许携带凭证（如cookies）
        // 如果后端需要保持session, 需要运行前端携带cookie
        response.setHeader("Access-Control-Allow-Credentials", "false");

        // 允许的HTTP方法
        response.setHeader("Access-Control-Allow-Methods",
                "GET, POST, PUT, DELETE, OPTIONS");

        // 预检请求缓存时间（秒）
        response.setHeader("Access-Control-Max-Age", "3600");

        // 允许的请求头
        response.setHeader("Access-Control-Allow-Headers",
                "*");

        // 直接放行OPTIONS预检请求
        if ("OPTIONS".equalsIgnoreCase(request.getMethod())) {
            response.setStatus(HttpServletResponse.SC_OK);
            return false;
        }
        return true;
    }
}