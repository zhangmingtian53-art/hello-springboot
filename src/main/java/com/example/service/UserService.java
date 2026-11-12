package com.example.service;

import com.example.entity.User;
import com.example.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 用户业务逻辑层 —— 任务8 换 MyBatis-Plus 后大幅瘦身
 * <p>
 * 原来手写的 insert/update 判断逻辑还在，但底层全换成 MP 的方法：
 *   id == null → userMapper.insert(user)      （MP 自带，@TableId(AUTO) 走自增）
 *   id != null → userMapper.updateById(user)  （只更新非 null 字段，替代原 XML 的 &lt;set&gt;&lt;if&gt;）
 * <p>
 * 原 selectPage/selectTotal 已删：分页和条件查询直接在 Controller 里用
 * MP 的 Page + QueryWrapper 完成（书上任务8 的写法），Service 不再过一道手。
 * <p>
 * 表名：qing.zmt_user（@TableName 写在实体类上）
 */
@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 新增 or 修改，二合一
     * <p>
     * 判断依据：实体里有没有 id
     *   id == null → insert；id != null → updateById
     *
     * @return 受影响的行数（1 = 成功，0 = 失败）
     */
    public int save(User user) {
        if (user.getId() == null) {
            return userMapper.insert(user);
        } else {
            return userMapper.updateById(user);
        }
    }

    /**
     * 按主键删除
     *
     * @return 受影响的行数（1 = 删除成功，0 = 该 id 不存在）
     */
    public int deleteById(Integer id) {
        return userMapper.deleteById(id);
    }
}
