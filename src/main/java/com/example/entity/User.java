package com.example.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 用户实体类 —— 与数据表 qing.zmt_user 一一对应
 * <p>
 * 任务8 换 MyBatis-Plus 后，MP 靠「实体属性名驼峰 → 列名下划线」自动映射：
 *   createdTime  <->  created_time（MP 默认开启驼峰转换，不用再配）
 * <p>
 * 两个注解缺一不可：
 *   @TableName("zmt_user")  不写的话 MP 默认找表名 "user"，直接报 Table doesn't exist
 *   @TableId(type = AUTO)   不写 type 的话 MP 默认用雪花算法生成超大 id（如 1353682949），
 *                           写 AUTO 才走表的自增主键
 */
@Data
@TableName("zmt_user")
public class User {

    @TableId(type = IdType.AUTO)
    private Integer id;            // 对应 zmt_user.id（自增主键）
    private String  username;      // 对应 zmt_user.username   用户名
    private String  password;      // 对应 zmt_user.password   密码
    private String  email;         // 对应 zmt_user.email      邮箱
    private String  phone;         // 对应 zmt_user.phone      电话
    private String  nickname;      // 对应 zmt_user.nickname   昵称
    private String  address;       // 对应 zmt_user.address    地址

    // created_time 是 timestamp 类型。表结构里带了默认值 CURRENT_TIMESTAMP，
    // 新增时不用自己填，数据库会自动写入当前时间。
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private LocalDateTime createdTime;

    private String  avatar;        // 对应 zmt_user.avatar     头像地址
    private String  role;          // 对应 zmt_user.role        角色标识
}
