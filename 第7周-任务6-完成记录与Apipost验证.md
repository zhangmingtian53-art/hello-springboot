# 第 7 周（任务6）上机任务书 · 完成记录 + Apipost 验证手册

> 项目：`C:\Users\lenovo\IdeaProjects\hello-springboot`
> 库表：`qing.zmt_user` ｜ 端口：`8084` ｜ 包名：`com.example.*`

---

## 一、代码改动清单（已完成）

| # | 文件 | 改了什么 |
|---|------|---------|
| 1 | `mapper/UserMapper.java` | 新增 `findByPage(offset, pageSize)`，SQL：`SELECT * FROM zmt_user ORDER BY id LIMIT #{offset}, #{pageSize}` |
| 2 | `service/UserService.java` | 新增 `findByPage(pageNum, pageSize)`，做参数兜底 + `offset = (pageNum-1)*pageSize` 换算 + 返回 `{data, total, pageNum, pageSize}` |
| 3 | `controller/UserController.java` | 新增 `GET /user/page?pageNum=1&pageSize=5` |
| 4 | `config/CorsConfig.java` | **新建**。`@Configuration` + 实现 `WebMvcConfigurer`，全局放开跨域 |
| 5 | `frontend/user-page.html` | **新建**。前端演示页（可直接双击打开，不依赖 Vue 脚手架） |

已有的 `count()` 方法本来就在 Mapper 里，直接复用，没重复写。

---

## 二、关掉随机端口这个坑（重要）

我第一次用 Maven 启动时，Tomcat 起在了 **62952** 端口，不是 8084，并报 `Port ... already in use`。

原因：IDEA/Maven 的 `spring-boot:run` 在调试模式下会读取环境变量覆盖 `server.port`。
**验证时一律用下面的方式启动**，保证端口就是 8084：

- **方式 A（推荐，最接近上课演示）**：在 IDEA 里打开 `HelloSpringBootApplication`，点绿色三角运行。
  启动日志里必须出现 `Tomcat started on port(s): 8084`。
- **方式 B（命令行）**：
  ```bash
  cd C:/Users/lenovo/IdeaProjects/hello-springboot
  mvn spring-boot:run -Dspring-boot.run.arguments=--server.port=8084
  ```

> 判断成功的唯一标准：日志里那行端口号是 **8084**。不是的话后面 Apipost 一定连不上。

---

## 三、Apipost 验证步骤（关卡 2）

### 步骤 1：新建「测试集合」

打开 Apipost → 左侧 **「测试」/「新建目录」**，建一个目录叫 `第7周-分页`，后面 4 个请求都放进去。

---

### 步骤 2：请求一 —— 分页查询（核心）

| 项 | 值 |
|---|---|
| 请求方式 | **GET** |
| 地址 | `http://localhost:8084/user/page?pageNum=1&pageSize=5` |

**操作**：把地址整条粘进地址栏。注意 Apipost 会自动把 `?` 后面的部分解析到 **「Query / 参数」** 标签页里，
变成两行 `pageNum = 1`、`pageSize = 5`，这是正常的。

**点「发送」，预期返回（HTTP 200）：**

```json
{
  "total": 21,
  "data": [
    { "id": 6,  "username": "admin", "password": "123456", "nickname": "管理员", ... },
    { "id": 18, "username": "测试2411061202test", ... },
    { "id": 19, "username": "测试19", ... },
    { "id": 20, "username": "测试20", ... },
    { "id": 21, "username": "测试21", ... }
  ],
  "pageNum": 1,
  "pageSize": 5
}
```

**对照任务书标准逐条打勾：**

- [x] `data` 数组长度 = 5（等于 pageSize）
- [x] `total` = 21（是这个表的总条数，**不是** 5）
- [x] HTTP 状态码 200

> 我这台机器实测：`total = 21`。你库里的条数可能不同，**以你 Apipost 里看到的 total 为准**，
> 后续页码计算的判断标准是「总条数 / 每页 5 条」。

---

### 步骤 3：请求二 —— 翻页不重复（验收关键）

复制请求一 → 改名「分页-第2页」→ 把 `pageNum` 改成 **2** → 发送。

**验收标准：`data` 里 5 条数据的 id，必须和第 1 页完全不重叠。**

我实测的 id 序列：

| 页码 | 返回的 id | 条数 |
|---|---|---|
| 1 | 6, 18, 19, 20, 21 | 5 |
| 2 | 22, 23, 24, 25, 26 | 5 |
| 3 | 27, 28, 29, 30, 31 | 5 |
| 5（末页） | 1353682949 | 1 |
| 6（越界） | `[]` | 0 |

- 末页条数 = `total ÷ 5` 的余数（21 条 → 第 5 页只剩 1 条，这是对的）
- 越界页返回空数组、`total` 仍是 21，不报错，这也是对的

**如果第 2 页和第 1 页数据一模一样**，说明 Controller 里直接拿 `pageNum` 当 `LIMIT` 第一个参数了，
检查 `UserService.findByPage()` 里有没有写 `(pageNum - 1) * pageSize`。

---

### 步骤 4：请求三 —— 改每页条数

把 `pageSize` 改成 **10**，`pageNum` 改回 **1** → 发送。

**预期：`data` 长度 = 10，`total` 仍是 21。**（我实测：10 条 ✓）

---

### 步骤 5：请求四 —— 边界值

| 测试 | 参数 | 预期 |
|---|---|---|
| 不传参数 | `http://localhost:8084/user/page` | 走 defaultValue：第 1 页、5 条 |
| 只传页码 | `?pageNum=3` | 第 3 页、5 条 |
| pageNum 传 0 | `?pageNum=0&pageSize=5` | 兜底成第 1 页，不报 500 |

这些能过，说明 `@RequestParam` 的 `defaultValue` 和 Service 里的兜底都生效了。

---

### 步骤 6：验证跨域（关卡 3）

Apipost 是客户端工具，**不受浏览器同源策略限制**，所以它调得通不代表浏览器调得通。跨域必须另外验：

**方法 A（看响应头，Apipost 里就能做）**

1. 在请求一的地址栏下面找到 **「Header / 请求头」** 标签
2. 手动加一行：

   | 参数名 | 参数值 |
   |---|---|
   | `Origin` | `http://localhost:5173` |

3. 发送 → 切到返回区的 **「实际响应头 / Response Headers」**

**预期能看到：**

```
Access-Control-Allow-Origin: http://localhost:5173
Access-Control-Allow-Credentials: true
```

如果响应头里没有 `Access-Control-Allow-Origin`，就是 `CorsConfig` 没生效（没加 `@Configuration`，或改完没重启）。

**方法 B（看 OPTIONS 预检）**

新建请求，方法选 **OPTIONS**，地址 `http://localhost:8084/user/page`，请求头加：

| 参数名 | 参数值 |
|---|---|
| `Origin` | `http://localhost:5173` |
| `Access-Control-Request-Method` | `GET` |

预期 **HTTP 200**，响应头含：

```
Access-Control-Allow-Origin: http://localhost:5173
Access-Control-Allow-Methods: GET,POST,PUT,DELETE,OPTIONS
Access-Control-Max-Age: 3600
```

> 这两项我已经用命令行实测通过，返回 200 且响应头齐全。

---

## 四、关卡 4：前端页面对接

任务书要求用第 3 周做好的 Vue 页面改造。但你项目里现在只有 Thymeleaf 页面（`templates/main.html`），
没有 Vue 工程，所以我另外做了一个**纯 HTML 版**：

```
C:\Users\lenovo\IdeaProjects\hello-springboot\frontend\user-page.html
```

**它对应任务书的四个步骤，代码里都有注释标出来：**

| 任务书步骤 | 代码位置 |
|---|---|
| 页面数据定义 | `let cur / size / total / keyword` + `const BASE_URL` |
| 封装加载数据方法 | `async function loadPage()` |
| 页面初始化调用 | 文件最后一行 `loadPage()` |
| 分页组件绑定 | `renderPager()` / `go()` / `changeSize()` / `jump()` |

### 怎么跑起来

1. 先启动后端（确认日志是 8084）
2. **直接双击** `frontend/user-page.html`
3. 页面底部有一条绿色状态栏，会显示「✔ 数据来自后端 `http://localhost:8084/user/page?...`｜本页 5 条，总记录数 21」

**这就是图 6-5 要的效果**：表格数据是后端来的，不是写死的。

### 页面能做的操作（对应「余下时间自己点一遍」）

- 点页码 `1 2 3 4 5` → 重新请求对应页
- 点 `‹` `›` → 上一页 / 下一页，到头自动置灰
- 改下拉框「5/10/20 条每页」→ 回第 1 页重新加载
- 「前往 __ 页」输入框回车 → 跳页
- 点「刷新」→ 重新拉当前页

---

## 五、截图留档清单（作业提交）

建议**全屏截图**，按要求覆盖三处：网络面板响应头、终端输出、浏览器页面。

| 编号 | 截图内容 | 对应图上要求 |
|---|---|---|
| 1 | Apipost：`/user/page?pageNum=1&pageSize=5` 的请求 + 响应 JSON（能看到 `data` 5 条、`total`） | 图 6-5 的后端依据 |
| 2 | Apipost：`pageNum=2` 的响应，id 与第 1 页不重复 | 关卡 2 验收 |
| 3 | Apipost：响应头里的 `Access-Control-Allow-Origin` | 关卡 3 验收 |
| 4 | 浏览器页面全貌（表格有数据 + 底部绿色状态栏） | **图 6-5 用户信息 Home.vue 页面** |
| 5 | F12 → Console → 能看到请求数据对象 | **图 6-6 "控制台"显示** |
| 6 | F12 → Network → 点 `page?pageNum=1&pageSize=5` → 看 Headers（Response Headers 里有 CORS 头）或 Response | **图 6-7 查看当前数据流向** |
| 7 | IDEA 控制台：`Tomcat started on port(s): 8084` + 执行的 SQL 日志 | 终端输出 |

> 第 7 张：`application.yml` 里配了 `log-impl: StdOutImpl`，控制台会打印真实执行的 SQL，
> 长这样：`==>  Preparing: SELECT * FROM zmt_user ORDER BY id LIMIT ?, ?` / `==> Parameters: 5(Integer), 5(Integer)`
> 这张图特别有说服力，一眼能看出 LIMIT 两个参数是 `(偏移量, 条数)`。

---

## 六、报错速查（结合任务书对照表）

| 现象 | 先查这里 |
|---|---|
| Apipost 报 **Connection refused** | 后端没起，或端口不是 8084（看启动日志那行） |
| Apipost 报 **400 Bad Request** | URL 里参数名拼错，必须是 `pageNum` / `pageSize`（大小写敏感） |
| 返回 500 + `Unknown column` | 表名/列名不对，本项目是 `zmt_user` |
| 第 2 页数据和第 1 页重复 | `UserService` 里 `(pageNum-1)*pageSize` 漏了 |
| `total` 是 5 不是 21 | 把 `data.size()` 当 total 了，应该调 `count()` |
| 页面表格空白但接口正常 | 前端 `u.username` 这类字段名和后端 JSON 不一致 |
| 浏览器控制台 CORS 红字 | ① `CorsConfig` 有没有 `@Configuration` ② 改完有没有重启 ③ `BASE_URL` 端口对不对 |
| 改了配置没反应 | **重启后端**，跨域配置热部署不一定刷新 |

---

## 七、书本作业

任务书要求「请截图 P93 的图 6-5 和 P94 的图 6-7」。那两张图是书上 **dormback 项目**的界面，
它用的是 MyBatis-Plus + Vue 脚手架 + Element UI，界面样式和我做的 `user-page.html` 不完全一样
（我按 Element 的视觉风格仿了：左侧深色菜单、浅灰表头、蓝色分页器）。

如果老师要求必须是书上的界面，那需要按书上第 6 章把 Vue 工程搭起来；
如果只要求「实现同样功能并截图留档」，直接截我这个页面即可 —— 功能点（后端分页、跨域、表格渲染、分页交互）完全覆盖。
