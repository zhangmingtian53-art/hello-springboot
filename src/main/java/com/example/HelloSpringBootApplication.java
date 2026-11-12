package com.example;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 启动类
 * <p>
 * 注意：原来这里写的是 @SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
 * 那句 exclude 会「关掉数据源自动配置」。以前没连数据库时靠它启动，
 * 现在要连 MySQL，必须去掉，否则 MyBatis 拿不到 DataSource，会启动失败。
 */
@SpringBootApplication
@MapperScan("com.example.mapper")   // 扫描 Mapper 接口（UserMapper 上已有 @Mapper，二者有一个即可）
public class HelloSpringBootApplication {

    public static void main(String[] args) {
        SpringApplication.run(HelloSpringBootApplication.class, args);
    }

}
