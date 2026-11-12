package com.example;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
public class TestController {

    // 1) 测试页面：访问 /test 直接打开 main.html
    @RequestMapping("/test")
    public String test() {
        return "main.html";
    }

    // 2) 首页：访问 / 打开 login.html，并往页面传一个 msg
    //    教材给了两种写法，Map 和 Model，效果完全一样
    @GetMapping("/")
    public String index(Map<String, Object> map) {
        map.put("msg", "Hello 同学");
        return "login.html";
    }

    /*
     * Model 写法（和上面的 Map 写法二选一即可）：
     *
     * @GetMapping("/")
     * public String index(Model model) {
     *     model.addAttribute("msg", "Hello 同学");
     *     return "login.html";
     * }
     */

    // 3) 登录：表单 POST 提交到这里
    //    参数名 username / password 必须和 login.html 里 input 的 name 一致
    @PostMapping("/login")
    public String login(String username, String password, Model model) {
        System.out.println("用户名是：" + username + "，密码是：" + password);
        // 把用户名带回 main.html 显示
        model.addAttribute("username", username);
        return "main.html";
    }
}
