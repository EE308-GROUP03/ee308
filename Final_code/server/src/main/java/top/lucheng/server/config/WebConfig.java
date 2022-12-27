package top.lucheng.server.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import top.lucheng.server.interceptor.JwtInterceptor;

import java.util.ArrayList;
import java.util.List;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOriginPatterns("*")
                .allowCredentials(true)
                .allowedMethods("GET", "POST", "PATCH", "DELETE", "OPTIONS")
                .allowedHeaders("*")
                .exposedHeaders("*")
                .maxAge(500);
    }

    //pattern中不用包含  context-path: /orange
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        String[] urls = new String[]{
                // 添加Swagger相关的请求路径，予以放行
                "/doc.html",
                "/webjars/**",
                "/swagger-resources",
                "/v3/api-docs",
                "/favicon.ico"
        };
        registry.addInterceptor(new JwtInterceptor())
                .addPathPatterns("/user")
                .excludePathPatterns("/user/login", "/user/register")
                .excludePathPatterns(urls);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("swagger-ui.html").addResourceLocations("classpath:/META-INF/resources/");
        registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/");
        // knife4j页面
        registry.addResourceHandler("doc.html").addResourceLocations("classpath:/META-INF/resources/");
        registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/");
    }
}
