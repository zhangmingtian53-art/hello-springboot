package com.example.config;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * MyBatis-Plus 分页插件（任务8 关卡2）
 * <p>
 * 不加这个配置类，selectPage() 会「看起来执行成功，但 total=0、把全表都查出来」——
 * 因为 MP 的分页是靠拦截器把你的 SQL 改写成 LIMIT 实现的，
 * 没注册拦截器就没有改写这一步。这就是报错对照表里「分页无效」的原因。
 * <p>
 * 三个要素缺一不可：
 *   @Configuration      让 Spring 加载它
 *   @Bean               把拦截器注册进容器
 *   DbType.MYSQL        告诉拦截器按 MySQL 的 LIMIT 语法改写（写错 DbType 生成的 SQL 不对）
 * <p>
 * 注意包名别导错：分页拦截器在 com.baomidou.mybatisplus.extension.plugins.inner 下，
 * IDE 自动导入容易导成 core 包下的同名类。
 */
@Configuration
public class MybatisPlusConfig {

    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        MybatisPlusInterceptor i = new MybatisPlusInterceptor();
        i.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));
        return i;
    }
}
