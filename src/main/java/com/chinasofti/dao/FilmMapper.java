package com.chinasofti.dao;


import com.chinasofti.bean.Film;
import org.apache.ibatis.annotations.*;

import java.util.List;

//电影信息表的数据访问层
public interface FilmMapper {
    @Select("SELECT * FROM t_film")
    List<Film> findList();

    @Select("SELECT * FROM t_film WHERE state = '正在上映' ORDER BY release_date DESC LIMIT 12")
    List<Film> findListDesc();

    @Select("SELECT * FROM t_film WHERE ID = #{param0}")
    Film findById(int id);

    @Select("SELECT tf.*,avg(score) avg FROM t_film tf,t_pinglun tp where tf.id = tp.film_id AND type like #{param0} " +
            "GROUP BY film_id ORDER BY avg(score) DESC ")
    List<Film> findByType(String type);


    @Select("select * from t_film f join(select film_id,count(film_id) c " +
            "from (select * from t_pinglun where comment_time > DATE_ADD(now(),INTERVAL -7 day)) " +
            "temp group by film_id ORDER BY c desc LIMIT 10) t on f.ID = t.film_id order by c desc")
    List<Film> findHotMovies();

    @Insert("INSERT INTO t_film VALUES(NULL,#{filmName},#{director},#{screenwriter}," +
            "#{actor},#{type},#{country},#{language},#{releaseDate},#{filmLength}," +
            "#{image},#{link},'default.mp4',#{brief},now(),#{state},0)")
    int save(Film film);

    @Update("UPDATE t_film SET movie = #{movie} WHERE ID = #{ID}")
    int update(Film film);

    @Update("UPDATE t_film SET banner_state = #{param2} WHERE ID = #{param1}")
    int updateBannerState(int filmId, int bannerState);

    @Delete("DELETE FROM t_film WHERE ID = #{param0}")
    int delete(int id);
}
