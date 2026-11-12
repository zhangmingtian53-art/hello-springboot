package com.example.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 全局跨域配置（任务6 关卡3）
 * <p>
 * 为什么需要它：
 * 浏览器有「同源策略」，前端页面跑在 http://localhost:5173（或 8080、3000…），
 * 后端接口在 http://localhost:8084，端口不同就算跨域，
 * 浏览器会先发一个 OPTIONS 预检请求，后端不回 CORS 响应头就报错：
 *   Access to XMLHttpRequest at 'http://localhost:8084/user/page' from origin
 *   'http://localhost:5173' has been blocked by CORS policy
 * <p>
 * 两个注解都不能少：
 *   @Configuration   —— 让 Spring 把它当成配置类加载（不写它，这个类形同虚设）
 *   WebMvcConfigurer —— 提供 addCorsMappings 回调，用来注册跨域规则
 * <p>
 * 注意：改完这个文件必须重启后端才生效，热部署不一定能刷新跨域规则。
 * 这就是「配置写了还是报 CORS」最常见的原因。
 */
@Configuration
public class CorsConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")                       // 所有接口路径
                // allowedOriginPatterns 支持通配符，比 allowedOrigins("*") 更安全也更兼容
                // （Spring Boot 2.4+ 同时开 allowCredentials 时，allowedOrigins("*") 会报错）
                .allowedOriginPatterns("*")
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .allowedHeaders("*")
                .allowCredentials(true)                  // 允许携带 Cookie / 认证信息
                .maxAge(3600);                           // 预检结果缓存 1 小时，少发 OPTIONS 请求
    }
}
