package com.example.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.entity.User;
import com.example.mapper.UserMapper;
import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户接口层 —— 任务8 换 MyBatis-Plus 后的重写版
 * <p>
 * 三个变化：
 *   1. 查询不再手写 SQL，改用 QueryWrapper 拼条件（关卡1）
 *   2. 分页改用 Page + selectPage，靠 MybatisPlusConfig 的分页插件生效（关卡2）
 *   3. 改指定字段用 UpdateWrapper（关卡3）
 * <p>
 * ★ QueryWrapper 里写的是数据库列名（username / nickname / role），
 *   写成实体属性名 userName 会报 Unknown column 'userName' in 'where clause'。
 *   想用属性名就用 LambdaQueryWrapper：new LambdaQueryWrapper&lt;User&gt;().like(User::getUsername, ...)
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserService userService;

    /* ==================== 查全部：GET /user/list ==================== */
    // selectList(null)：传 null 表示没有条件 = 查全表
    @GetMapping("/list")
    public List<User> list() {
        return userMapper.selectList(null);
    }

    /* ==================== 查总数：GET /user/count ==================== */
    // MP 3.5.x 的 selectCount 返回 Long，拆箱转成 int
    @GetMapping("/count")
    public int count() {
        return Math.toIntExact(userMapper.selectCount(null));
    }

    /* ==================== 查单个：GET /user/{id} ==================== */
    @GetMapping("/{id}")
    public User getById(@PathVariable Integer id) {
        return userMapper.selectById(id);
    }

    /* ==================================================================
       关卡1：QueryWrapper 条件查询
       GET /user/search?name=张
       通过标准：只返回姓名/账号含"张"的用户，按 id 倒序
       ================================================================== */
    @GetMapping("/search")
    public List<User> search(@RequestParam(value = "name", required = false) String name) {
        QueryWrapper<User> qw = new QueryWrapper<>();
        if (name != null && !name.trim().isEmpty()) {
            // like(nickname, ...) → SQL: nickname LIKE '%张%'
            // 表里账号是"测试19"这类、姓名是"张铭天"这类，两个列都匹配才能搜得到人
            qw.like("nickname", name).or().like("username", name);
        }
        // 列名传"id"，按 id 倒序，新数据在前（和书上的 orderByDesc("id") 一致）
        qw.orderByDesc("id");
        return userMapper.selectList(qw);
    }

    /* ==================================================================
       关卡2：Page 分页（GET /user/page）
       图 8-10 的接口：GET /user/page?pageNum=1&pageSize=5&username=张
       直接返回 MP 的 Page 对象，JSON 里就是 records + total —— 和书上截图一致
       ================================================================== */
    // 参数名用 username（和图 8-10 的 URL 对齐），不传 = 查全部
    @GetMapping("/page")
    public Page<User> page(
            @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
            @RequestParam(value = "username", required = false) String username) {

        // 分页参数兜底：pageNum/pageSize 传 0 或负数会让 LIMIT 报错
        if (pageNum == null || pageNum < 1) {
            pageNum = 1;
        }
        if (pageSize == null || pageSize < 1) {
            pageSize = 5;
        }

        // new Page<>(当前页, 每页条数) —— 分页插件会把它翻译成 LIMIT
        Page<User> page = new Page<>(pageNum, pageSize);

        QueryWrapper<User> qw = new QueryWrapper<>();
        if (username != null && !username.trim().isEmpty()) {
            // 多条件模糊：username 或 nickname 任一命中即算
            qw.like("username", username).or().like("nickname", username);
        }
        qw.orderByAsc("id");

        // 关卡2 核心：selectPage(页对象, 条件)。没有 MybatisPlusConfig 时
        // 这行会退化成查全表（total=0），配了分页插件才真正 LIMIT
        return userMapper.selectPage(page, qw);
    }

    /* ==================== 增：POST /user/add ==================== */
    @PostMapping("/add")
    public Map<String, Object> add(@RequestBody User user) {
        int rows = userMapper.insert(user);
        Map<String, Object> result = new HashMap<>();
        result.put("code", 200);
        result.put("msg", "新增成功");
        result.put("rows", rows);
        result.put("newId", user.getId());   // @TableId(AUTO) 自增主键回填
        return result;
    }

    /* ==================== 改：PUT /user/update ==================== */
    // updateById 只更新非 null 字段，等价于原 XML 里 <set><if> 的效果
    @PutMapping("/update")
    public Map<String, Object> update(@RequestBody User user) {
        int rows = userMapper.updateById(user);
        Map<String, Object> result = new HashMap<>();
        result.put("code", 200);
        result.put("msg", "更新成功");
        result.put("rows", rows);
        return result;
    }

    /* ==================================================================
       关卡3：UpdateWrapper 改指定字段
       PUT /user/role?id=1&role=超级管理员
       对应任务书：userMapper.update(null, new UpdateWrapper<User>()
                        .eq("id",1).set("role","超级管理员"));
       第一个参数传 null：不用实体，改成什么样全由 set(...) 说了算
       ================================================================== */
    @PutMapping("/role")
    public Map<String, Object> updateRole(@RequestParam Integer id,
                                          @RequestParam String role) {
        // set 只改一列：UPDATE zmt_user SET role=? WHERE id=?
        // 注意 set/eq 里传的是列名 "id"、"role"，不是属性名
        int rows = userMapper.update(null,
                new UpdateWrapper<User>().eq("id", id).set("role", role));
        Map<String, Object> result = new HashMap<>();
        result.put("code", 200);
        result.put("rows", rows);
        return result;
    }

    /* ==================== 删：DELETE /user/delete/{id} ==================== */
    @DeleteMapping("/delete/{id}")
    public Map<String, Object> delete(@PathVariable Integer id) {
        int rows = userMapper.deleteById(id);
        Map<String, Object> result = new HashMap<>();
        result.put("code", 200);
        result.put("msg", "删除成功");
        result.put("rows", rows);
        return result;
    }

    /* ==================================================================
       书上 springboot+vue.js 项目二 那套路径，保持兼容（任务4 起就有）：
         查询全部  GET    /user
         新增+修改 POST   /user
         删除      DELETE /user/{id}   ← 图 8-7/8-8 的 DELETE http://localhost:8084/user/8 就走这里
       ================================================================== */

    @GetMapping
    public List<User> index() {
        return userMapper.selectList(null);
    }

    @PostMapping
    public Integer save(@RequestBody User user) {
        return userService.save(user);
    }

    // 图 8-7/8-8 要截的接口：DELETE http://localhost:8084/user/{id}
    // 返回受影响行数 1（删成功）/ 0（id 不存在）
    @DeleteMapping("/{id}")
    public Integer deleteById(@PathVariable Integer id) {
        return userService.deleteById(id);
    }
}
