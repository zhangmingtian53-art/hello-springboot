# hello-springboot

基于 **Spring Boot + MyBatis-Plus + MySQL** 的用户管理后台服务，实现了用户数据的完整 CRUD、条件搜索、分页与跨域配置，是本人学习 Java 后端开发的实践项目。

## 技术栈

| 层次 | 技术 |
|---|---|
| 框架 | Spring Boot 2.6.13（Java 8） |
| ORM | MyBatis-Plus 3.5.5（分页插件 + 驼峰映射） |
| 数据库 | MySQL 8 |
| 视图 | Thymeleaf |
| 工具 | Lombok、Maven |

## REST API 一览

| 方法 | 路径 | 说明 |
|---|---|---|
| GET | `/user/list` | 用户列表（分页） |
| GET | `/user/count` | 用户总数 |
| GET | `/user/{id}` | 按 ID 查询用户 |
| GET | `/user/search?username=` | 按用户名模糊搜索 |
| POST | `/user/add` | 新增用户 |
| PUT | `/user/update` | 更新用户 |
| DELETE | `/user/delete/{id}` | 删除用户 |

另有配套前端页面 `static/user-page.html`，可直接在浏览器中对接口进行增删改查操作。

## 项目结构

```
src/main/java/com/example
├── controller/   # REST 接口层
├── service/      # 业务逻辑层
├── mapper/       # MyBatis-Plus Mapper 接口
├── entity/       # 数据实体（Lombok）
└── config/       # 跨域配置、MyBatis-Plus 分页插件配置
```

## 快速开始

1. 环境要求：JDK 8+、Maven 3.6+、MySQL 8
2. 执行 `init_qing_zmt_user.sql` 初始化数据库
3. 数据库连接配置有两种方式（任选其一）：
   - 设置环境变量 `DB_USERNAME` / `DB_PASSWORD`
   - 创建 `src/main/resources/application-local.yml`（已被 `.gitignore` 排除）：
     ```yaml
     spring:
       datasource:
         url: jdbc:mysql://localhost:3306/qing?serverTimezone=Asia/Shanghai&useSSL=false&allowPublicKeyRetrieval=true
         username: root
         password: "你的密码"
     ```
4. 启动并验证：

```bash
mvn spring-boot:run
curl http://localhost:8084/user/list
```

## 安全说明

数据库密码等敏感配置均通过环境变量或本地配置文件注入，仓库中不包含任何真实凭据。
