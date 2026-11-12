package com.example.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.entity.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户数据访问接口 —— 任务8 换 MyBatis-Plus 后的形态
 * <p>
 * 继承 BaseMapper&lt;User&gt; 后，下面这些方法全部白送，一行 SQL 都不用写：
 *   insert / deleteById / updateById / selectById / selectList / selectPage / selectCount ...
 * 条件查询用 QueryWrapper（列名必须是数据库列名！书上的注意点：
 * 写成 userName 会报 Unknown column —— 数据库列是 username / nickname，没有 userName）
 * <p>
 * 旧的注解 SQL（@Select/@Insert...）和 XML 全部删掉了：
 *   XML 里的 &lt;update id="update"&gt; 会和 BaseMapper 自带的 update 方法
 *   注册同一个 statement id，启动直接报 Mapped Statements collection 冲突。
 *   这就是任务8 必须删 XML 的原因（原文件备份为 resources/mapper/User.xml.bak-mybatis）。
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {
    // 空接口即可，BaseMapper 提供全部通用 CRUD
}
