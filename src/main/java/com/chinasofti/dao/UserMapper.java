package com.chinasofti.dao;

import com.chinasofti.bean.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface UserMapper {

    //查询所有用户
    @Select("SELECT * FROM t_user")
    List<User> findList();

    //查询单个用户
    @Select("SELECT * FROM t_user WHERE ID = #{param0}")
    User findById(int id);

    //用户封禁评论
    @Update("UPDATE t_user SET state = 0 WHERE ID = #{id}")
    int updateState0(int id);

    //用户解封评论
    @Update("UPDATE t_user SET state = 1 WHERE ID = #{id}")
    int updateState1(int id);

    //注册用户
    @Insert("INSERT INTO t_user VALUES(NULL,#{username},#{nickname},#{password},#{tel},#{email},#{sex},#{birthday}, 1)")
    int save(User user);

    //用户修改信息
    @Update("UPDATE t_user SET nickname = #{nickname}, passsword = #{password}, tel = #{tel}, email = #{email}, sex = #{sex}, birthday = #{birthday} WHERE ID = #{id}")
    int updateUser(User user);

    //用户注销
    @Delete("DELETE FROM t_user WHERE ID = #{param0}")
    int delete(int id);

}
