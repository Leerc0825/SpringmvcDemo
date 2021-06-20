package com.chinasofti.dao;

import com.chinasofti.bean.Category;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface CategoryMapper {

    @Select("SELECT * FROM t_category")
    List<Category> findList();

    @Select("SELECT * FROM t_category WHERE id = #{param0}")
    Category findById(int id);

    @Insert("INSERT INTO t_category VALUES(NULL,#{name})")
    int save(Category category);

    @Delete("DELETE FROM t_category WHERE id = #{param0}")
    int delete(int id);

    @Update("UPDATE t_category SET name = #{name} WHERE id = #{id}")
    int update(Category category);

}
