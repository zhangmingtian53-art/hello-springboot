package com.example;

import org.springframework.web.bind.annotation.*;

@RestController
public class HelloController {

    // 1) 原来的：不带参数访问 /hello
    @GetMapping("/hello")
    public String hello() {
        return "2411061202张铭天";
    }

    // 2) 查询参数写法：/hello?name=张铭天
    //    访问示例：http://localhost:8084/hello?name=张铭天
    //    用 params = "name" 和上面的 /hello 区分开
    @GetMapping(value = "/hello", params = "name")
    public String helloByParam(@RequestParam String name) {
        return "Hello, " + name + "!";
    }

    // 3) 路径变量写法：/hello/张铭天
    //    访问示例：http://localhost:8084/hello/张铭天
    @GetMapping("/hello/{name}")
    public String helloByPath(@PathVariable String name) {
        return "Hello, " + name + "!";
    }

    // 4) 可选参数写法：/greet 或 /greet?name=xxx
    //    required = false 表示参数可以不传，默认值 "World"
    @GetMapping("/greet")
    public String greet(@RequestParam(required = false, defaultValue = "World") String name) {
        return "Hello, " + name + "!";
    }

    // 5) 截图效果：表单同时传用户名 + 学号
    //    访问示例：/hello?username=dhy&id=2411061207
    //    控制台打印：用户名:dhy学号是:2411061207
    //    页面返回：Hello, 2411061207dhy!
    @GetMapping(value = "/hello", params = {"username", "id"})
    public String helloByUserAndId(@RequestParam String username, @RequestParam String id) {
        System.out.println("用户名:" + username + "学号是:" + id);
        return "Hello, " + id + username + "!";
    }
}
