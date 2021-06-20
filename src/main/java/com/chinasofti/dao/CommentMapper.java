package com.chinasofti.dao;

import com.chinasofti.bean.Comment;
import com.chinasofti.bean.Film;
import com.chinasofti.bean.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface CommentMapper {

    @Results(id = "rm-comment", value = {
            @Result(one = @One(select = "com.chinasofti.dao.UserMapper.findById"),
                    column = "user_id", javaType = User.class, property = "user"),
            @Result(one = @One(select = "com.chinasofti.dao.FilmMapper.findById"),
                    column = "film_id", javaType = Film.class, property = "film")
    })
    @Select("SELECT * FROM t_pinglun WHERE user_id in(SELECT ID FROM t_user WHERE username LIKE #{param1})" +
            "AND " +
            "film_id in(SELECT ID FROM t_film where film_name LIKE #{param2})"

    )
    List<Comment> findList(String username, String filmName);


    @Select("SELECT * FROM t_pinglun WHERE ID=#{param0}")
    Comment findById(int id);

    @Select("SELECT score FROM t_pinglun WHERE film_id = #{param0}")
    List<Integer> findScoreByFilmId(int id);

    @ResultMap("rm-comment")
    @Select("SELECT * FROM t_pinglun ORDER BY comment_time DESC LIMIT 14")
    List<Comment> findLatestComments();


    @ResultMap("rm-comment")
    @Select("SELECT * FROM t_pinglun WHERE film_id = #{param0}")
    List<Comment> findCommentByFilmId(int filmId);

    @ResultMap("rm-comment")
    @Select("SELECT * FROM t_pinglun tp,t_dianzan td WHERE tp.ID = td.pinglun_ID GROUP BY " +
            "td.pinglun_ID ORDER BY COUNT(td.pinglun_ID) DESC LIMIT 12")
    List<Comment> findHotComment();

    @Insert("INSERT INTO t_pinglun VALUES(NULL,#{param1},#{param2},#{param3},#{param4},now())")
    int addComment(int userId, int filmId, String content, int score);

    @Delete("DELETE FROM t_pinglun WHERE ID=#{param0}")
    int deleteById(int id);


}